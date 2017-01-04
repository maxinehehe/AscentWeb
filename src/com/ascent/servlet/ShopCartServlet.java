package com.ascent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.ascent.bean.Product;
import com.ascent.dao.ProductDAO;
import com.ascent.util.CartItem;
import com.ascent.util.ShopCart;
import com.sun.java.swing.plaf.windows.resources.windows;

@SuppressWarnings("serial")
public class ShopCartServlet extends HttpServlet {
	private ServletContext sc = null;
	
	public void init() throws ServletException{
		super.init();  // 利用父类初始化
		sc = this.getServletContext(); // 拿到servlet内容
	}
	
	// Process the HTTP Post request
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response); // 利用doGet
		
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		// 获取登录状态（登录或退出系统）
		String state = request.getParameter("a");    // 拿到a字段的内容
		if(state.equals("add")){   // 向购物车添加产品动作
			this.addtoShopCart(request,response);
		}else if(state.equals("find")){
			// 查看购物车
			this.findShopCart(request, response);
		}else if(state.equals("updateNum")){
			// 更新商品购物车
			this.updateCartProductNum(request, response);
		}else if(state.equals("move")){
			// 从购物车中移除该商品
			this.delShopCartProduct(request, response);
		}else if(state.equals("checkout")){
			this.checkout(request, response);
		}
	}
	// 清空资源
	public void destroy(){
	}
	
	/**
	 * 购买商品，添加到购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addtoShopCart(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession(false);
		ShopCart cart = (ShopCart) session.getAttribute("shopcart");
		if(cart==null){
			cart = new ShopCart();   // 添加新的
			session.setAttribute("shopcart", cart);    // 设置属性 将shopcart设置成cart 
		}
		
		
		String pid = request.getParameter("pid");   // 拿到pid内容
		int ppid = Integer.parseInt(pid);      // 将字符串Pid内容转换成数字
		boolean b1 = cart.checkHashMapid(pid);  // 判断是否已经存在该HashMap,即判断购物车是否已经添加该产品
		if(b1){   // 该商品已经存在
			 // AJAX 返回盖商品已经添加过的提示
			String dthtml = "该商品已经保存在购物车里！";
			/**
			 * note: 此处编码原为 gb2312
			 */
			response.setContentType("text/html;charset=utf-8;");  
			
			//response.getWriter().println("<script>alert("+dthtml+");</script>");
			
			response.getWriter().println(dthtml);
			// 同过警示更好
		}else{  // 该商品还未添加  
			// 进行添加
			ProductDAO pd = new ProductDAO();
			Product product = pd.getProductByPid(ppid);
			cart.addProduct(pid, product);  // 添加产品
			String dthtml = "添加成功！";
			/**
			 * note: 此处编码原为 gb2312
			 */
			response.setContentType("text/html;charset=utf-8");
			//response.getWriter().println("<script>alert("+dthtml+");</script>");
			response.getWriter().print(dthtml);  // 返回页面
			
		}
		response.getWriter().flush();
		response.getWriter().close();
	}
	
	/**
	 * 查看购物车
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void findShopCart(HttpServletRequest request,HttpServletResponse response)
			throws IOException,ServletException{
		HttpSession session = request.getSession(false);
		ShopCart cart = (ShopCart)session.getAttribute("shopcart");
		if(cart==null){
			cart = new ShopCart();   // 添加新的
			session.setAttribute("shopcart", cart);    // 设置属性 将shopcart设置成cart 
		}
		// 创建集合 CartItem
		// 获取 hashmap的值
		Collection<CartItem> shopCartlist = cart.getHashmap().values();
		// 设置属性
		session.setAttribute("shopcartlist", shopCartlist);
		//转发
		request.getRequestDispatcher("/product/cartshow.jsp").forward(request, response);
	}
	
	
	/**
	 * 更改购物车 商品质量 【数量】
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void updateCartProductNum(HttpServletRequest request,HttpServletResponse response)
			throws IOException,ServletException{
			HttpSession session = request.getSession(false);
			ShopCart cart = (ShopCart)session.getAttribute("shopcart");
			String pid = request.getParameter("pid");
			String number = request.getParameter("quantity");
			cart.updateProductNumber(pid, Integer.parseInt(number));  // 更新产品数量
			String divhtml = "该产品已经修改！";
//			System.out.println("更新成功");
			response.setContentType("text/html;charset=utf-8");  // 要在建立out之前设置
			PrintWriter out = response.getWriter();
			out.print(divhtml);
			out.flush();
			out.close();
	}
	
	
	/**
	 * 结算
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	
	private void checkout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ShopCart cart = (ShopCart) session.getAttribute("shopcart");
		if(cart==null){
			cart = new ShopCart();   // 添加新的
			session.setAttribute("shopcart", cart);    // 设置属性 将shopcart设置成cart 
		}
		Collection<CartItem> shopCartlist = cart.getHashmap().values();
		session.setAttribute("shopcartlist", shopCartlist);
		request.getRequestDispatcher("/product/checkout.jsp").forward(request, response);
	}
	
	/**
	 * 删除购物车商品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	
	private void delShopCartProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ShopCart cart = (ShopCart)session.getAttribute("shopcart");
		String pid = request.getParameter("pid");
		
		/*int n = JOptionPane.showConfirmDialog(null, "确认删除吗?", "确认删除框", JOptionPane.YES_NO_OPTION);  
        if (n == JOptionPane.YES_OPTION) {  
        	
        } else if (n == JOptionPane.NO_OPTION) {  
            // ......  
        } */
		
        cart.removeHashMap(pid); // 移除此hashmap 
		
		Collection<CartItem> shopCartlist = cart.getHashmap().values();
		session.setAttribute("shopcartlist", shopCartlist);
		// response.getWriter().println("<script>alert('删除成功！');</script>");
		request.getRequestDispatcher("/product/cartshow.jsp").forward(request, response);
	}
	
}
