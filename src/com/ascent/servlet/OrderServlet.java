package com.ascent.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sample.MD5Util;

import com.ascent.bean.Mailtb;
import com.ascent.bean.Orders;
import com.ascent.bean.Product;
import com.ascent.bean.Usr;
import com.ascent.dao.MailDAO;
import com.ascent.dao.OrderDAO;
import com.ascent.dao.UserMangerDAO;
import com.ascent.util.CartItem;
import com.ascent.util.SendMail;
import com.ascent.util.ShopCart;

@SuppressWarnings("serial")
public class OrderServlet extends HttpServlet{
	private ServletContext sc = null;
	private ServletConfig config = null;
	
	@Override
	public void init() throws ServletException {
		// TODO 自动生成的方法存根
		super.init();
		sc = this.getServletContext();
		config = this.getServletConfig();
	}
	
	public void doError(HttpServletRequest request, HttpServletResponse response,String error)
			throws ServletException, IOException {
		request.setAttribute("error", error);
		// 转发
		request.getRequestDispatcher("/product/error.jsp").forward(request, response);
	}
	
	public void destroy(){
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doGet(request, response);
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String state = request.getParameter("a");
		if(state.equals("all")){
			// 查询订单
			this.findOrderAll(request, response);
		}else if(state.equals("finditem")){
			this.findOrderitem(request, response);
		}else if(state.equals("lookuse")){
			// 查看用户 【从管理员订单列表】
			this.lookUser(request, response);
		}else if(state.equals("delorder")){
			// 删除订单
			this.delOrder(request, response);
		}else if(state.equals("checkout")){
			// 保存订单
			this.saveOrders(request, response);
		}else if(state.equals("delitem")){
			// 删除订单内容【即产品详单】
			this.delOrderitem(request, response);
		}
	}
	
	
	/**
	 * 删除订单内产品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delOrderitem(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("oid");   // 订单号
		String productid = request.getParameter("pid");  // 产品号
		int oid = Integer.valueOf(orderid);   
		int pid = Integer.valueOf(productid);
		OrderDAO pd = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		List<Product> productlist = new ArrayList<Product>();
		try {
			pd.delOrderItem(pid, oid);
			productlist = pd.findOrderItem(oid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mysession.setAttribute("orderitemlist", productlist);
		mysession.setAttribute("orderid", orderid); // 设置订单号
		
//		request.getRequestDispatcher("/admin/orderitem_show.jsp").forward(request, response);
		this.findOrderitem(request, response);
	} 
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findOrderitem(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// 获取ordershow.jsp页面 查看 得到的 oid 订单号
		String orderid = request.getParameter("oid");
		int oid = Integer.valueOf(orderid);
		OrderDAO pd = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		List<Product> productlist = new ArrayList<Product>();
		try {
			productlist = pd.findOrderItem(oid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 设置产品列表属性
		request.setAttribute("orderitemlist", productlist);
		// 设置订单属性
		request.setAttribute("orderid", orderid);
		// 转发至新的页面显示
		request.getRequestDispatcher("/admin/orderitem_show.jsp").forward(request, response);
	}

	
	/**
	 * 找到所有订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findOrderAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderDAO dao = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		Usr pu = (Usr) mysession.getAttribute("productuser");
		List<Orders> orderlist = null;
		try {
			if(pu!=null){
				String superuser = pu.getSuperuser();
				if(superuser!=null){
					if (superuser.trim().equals("2") ||superuser.trim().equals("3")) {
						orderlist = dao.findOrderAllList();
						request.setAttribute("orderlist", orderlist);
						request.getRequestDispatcher("/admin/admin_ordershow.jsp").forward(request, response);
					} else {
						orderlist = dao.findOrderList(pu.getId());
						mysession.setAttribute("orderlist", orderlist);
						request.getRequestDispatcher("/admin/ordershow.jsp").forward(request, response);
					}
				}
			}else{
				this.doError(request, response, "用户不存在！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			this.doError(request, response, "查询订单发生错误！");
		}
	}
	
	
	
	
	/**管理员操作
	 * 删除订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// 从 admin_ordershow.jsp页面获取字段“oid”的值 即 订单号
		String orderid = request.getParameter("oid");
		int oid = Integer.valueOf(orderid);
		OrderDAO pd = new OrderDAO();
		// 获取session 不重新创建
		HttpSession mysession = request.getSession(false);
		List<Orders> orderlist = null;
		try {
			// 在DAO层操作数据库 通过订单号 删除 此订单
			// 需要注意的是 此为级联操作 删除订单号 orders表 和 orderitem会一同执行删除操作
			pd.delOrder(oid);
			orderlist = pd.findOrderAllList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mysession.setAttribute("orderlist", orderlist);
//		request.getRequestDispatcher("/admin/admin_ordershow.jsp").forward(request, response);
		// 直接跳转至 findOrderAll 显示所有商品
		this.findOrderAll(request, response);
	}
	
	
	
	
	
	
	/**管理员 
	 * 查看订单用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void lookUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("uid");
		if(userid!=null){
			int uid = Integer.valueOf(userid);
			UserMangerDAO um = new UserMangerDAO();
			HttpSession mysession = request.getSession(false);
			// 通过 用户id 从数据库获取用户信息
			Usr productUser = um.getProductUserByid(uid);
			// 设置订单用户属性
			mysession.setAttribute("Orderuser", productUser);
			// 转发
			request.getRequestDispatcher("/admin/admin_orderuser.jsp").forward(request, response);
		}
	}
	
	
	
	
	/**
	 * 保存订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void saveOrders(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		OrderDAO pd = new OrderDAO();
		MailDAO md = new MailDAO();
		String content = "";// 产品内容
		String message = "";// 最终发送message
		HttpSession mysession = request.getSession(false);
		String name = request.getParameter("username");
		String tele = request.getParameter("tel");
		String emails = request.getParameter("email");
		String company = request.getParameter("companyname");
		String companyadd = request.getParameter("companyaddress");
		Usr pu = (Usr) mysession.getAttribute("productuser");
		Collection<CartItem> con = (Collection<CartItem>) mysession.getAttribute("shopcartlist");// 获取购物车内容
		try {
			if (pu == null){// 为游客
				pu = new Usr();
				pu.setId(0);
				pu.setUsername(name);
				pu.setTel(tele);
				pu.setEmail(emails);
				pu.setCompanyname(company);
				pu.setCompanyaddress(companyadd);
				content = pd.saveOrder(con, pu);// 保存订单信息
			} else{// 为注册用户
				// 如果用户在页面上做修改，已修改信息为准
				pu.setFullname(name);
				pu.setTel(tele);
				pu.setEmail(emails);
				pu.setCompanyname(company);
				pu.setCompanyaddress(companyadd);
				content = pd.saveOrder(con, pu);// 保存订单信息
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		message = "<html xmlns='http://www.w3.org/1999/xhtml'> <head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/><style type='text/css'> <!-- <br> .table_cc {color:#FFFFFF; font-weight:bold; font-size:12px;} <br> .table_hei {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#000000;} <br> .table_hui {font-family:Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:#666666;} --></style></head> "
				+ "<br> <body><table width='550' border='0' cellspacing='0'><tr> <td height='18' colspan='7' bgcolor='#1B83D8'>"
				+ "<div align='center' class='table_cc'><div align='left'>产品信息</div> </div></td></tr> "
				+ "<tr> <td width='71' height='26' bgcolor='#FFFFFF' class='table_hui'>　catalogno </td> <td width='100' bgcolor='#FFFFFF' class='table_hui'>名称 </td><td width='107' bgcolor='#FFFFFF' class='table_hui'> cas </td><td width='64' bgcolor='#FFFFFF' class='table_hui'>formula</td><td width='82' bgcolor='#FFFFFF' class='table_hui'>价格</td><td width='59' height='26' bgcolor='#FFFFFF' class='table_hui'>数量 </td></tr><br>"
				+ content 
				+ " </table><table width='550' border='0'><tr> <td height='1' colspan='4' bgcolor='#8CC6FF'></td></tr><tr> <td height='17' colspan='4'  bgcolor='#1B83D8' class='table_cc'>用户信息 </td></tr><tr><td width='78' height='30' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td><td width='91'class='table_hui'>用户名： </td><td width='365' bgcolor='#FFFFFF' class='table_hui'>"
				+ pu.getUsername()
				+ "</td></tr><tr><td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td>  <td width='91' height='23' class='table_hui'>电话：</td><td width='365' bgcolor='#FFFFFF' class='table_hui'>"
				+ pu.getTel()
				+ "</td></tr><tr><td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td> <td width='91' height='23' class='table_hui'>Email:</td> <td width='365' class='table_hui'>"
				+ pu.getEmail()
				+ "</td></tr><tr> <td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td> <td width='91' height='23' class='table_hui'>公司名称:</td> <td width='365' class='table_hui'>"
				+ pu.getCompanyname()
				+ "</td></tr></table>  </div></div></body></html>";
		Mailtb mailtb = null;
		try {
			mailtb = md.findMail();
			if (mailtb != null) {
				String usrename = mailtb.getFromaddress().substring(0,mailtb.getFromaddress().indexOf("@"));
				SendMail sm = new SendMail();
				// 此时注意 对获取的邮箱密码进行md5解密
				sm.sendMessage(mailtb.getFromaddress(), usrename,new MD5Util().convertMD5(mailtb.getFrompassword()) , mailtb.getToaddress(), emails, message);
				request.setAttribute("error", "您好，你的订单已经发送到管理员邮箱");
				request.getRequestDispatcher("/product/checkoutsucc.jsp").forward(request, response);
			} else {
				this.doError(request, response, "邮件没有设置,请与管理员联系");
			}
			// 清除购物车
			ShopCart shopCart = (ShopCart) mysession.getAttribute("shopcart");
			shopCart.emptyCart();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
