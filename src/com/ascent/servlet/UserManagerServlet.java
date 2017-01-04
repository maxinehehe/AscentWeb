package com.ascent.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.ascent.bean.Usr;
import com.ascent.dao.UserMangerDAO;

@SuppressWarnings("serial")
public class UserManagerServlet extends HttpServlet {
	
	private ServletContext sc = null;

	public void init() throws ServletException {
		super.init();
		sc = this.getServletContext();
	}

	// Process the HTTP Post request
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}

		// 使用doget方式
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	
		String loginstate = request.getParameter("a");
		if (loginstate.equals("all")){// 
			this.findAllUser(request, response);
		}else if (loginstate.equals("finduser")){// 修改产品
			this.findProductUserbyid(request, response);
		}else if (loginstate.equals("update")){		// updateproduct.jsp>>执行更新 
			this.updateProductUser(request, response);
		}else if (loginstate.equals("updatesuper")){	// 更新
			this.updateUserSuper(request, response);
		}else if (loginstate.equals("delsuser")){	// 软删除
			this.delSoftUser(request, response);
		}
	}

	

	

	private void doError(HttpServletRequest request,HttpServletResponse response, String error)throws ServletException, IOException {
		request.setAttribute("error", error);
		request.getRequestDispatcher("./error.jsp").forward(request, response);
		
	}

	// Clean up resources
	public void destroy() {
	}

	/**
	 * by hehe
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findAllUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		UserMangerDAO um = new UserMangerDAO();
		List<Usr> usrs = um.getAllProductUser();
//		request.setAttribute("allproductlist", usrs);
		request.setAttribute("allproductUsrsList", usrs);
		request.getRequestDispatcher("/admin/products_showusers.jsp").forward(request, response);
	}

	/**
	 * by hehe
	 * 更新用户的状态 【管理员普通注册用户】
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateUserSuper(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession mysession = request.getSession(false);   // 创建 session 如果存在就不进行新的创建 否则返回null
		Usr pu = (Usr) mysession.getAttribute("productuser");   // 拿到此时登录的用户
		if(pu!=null && pu.getSuperuser()!=null && pu.getSuperuser().trim().equals("3")){   // 判断其状态
			String userid = request.getParameter("uid");
			String supers = request.getParameter("superuser");
			int uid = Integer.valueOf(userid);
			UserMangerDAO um = new UserMangerDAO();
			um.updateSuperuser(uid, supers);
			
			// 从新获取所有的用户
			List<Usr> allProductList = um.getAllProductUser();
			// 由于更改了 用户设置 需重新设置此时的用户 更新
//			request.setAttribute("allproductlist", allProductList);
			request.setAttribute("allproductUsrsList", allProductList);
			// 转发
			request.getRequestDispatcher("/admin/products_showusers.jsp").forward(request, response);;
		}else{
			this.doError(request, response, "更新出现错误！");
		}
	}

	/**
	 * by hehe
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delSoftUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("uid");
		String valuea = request.getParameter("value");
		int a = Integer.valueOf(valuea);
		int uid = Integer.valueOf(userid);
		UserMangerDAO um = new UserMangerDAO();
		um.delSoftuser(uid, a + "");  // 将a按字符串传递
		List<Usr> allProductList = um.getAllProductUser();
		// 更新所有用户状态
		request.setAttribute("allproductUsrsList", allProductList);
		// 转发
//		System.out.println("转发出错");

		request.getRequestDispatcher("/admin/products_showusers.jsp").forward(request, response);
	}

	/**
	 * 通过用户的uid在数据库查找
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findProductUserbyid(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("uid");   // 从product_showusers.jsp页面拿到用户id
		int uid = Integer.valueOf(userid);    			// toInt
		UserMangerDAO um = new UserMangerDAO();        
		Usr allProductuser = um.getProductUserByid(uid);          // 通过id获取数据库  拿到用户资料
		request.setAttribute("UID_Productuser", allProductuser);    // 定义属性 
		// 转发至 新的页面进行修改
		request.getRequestDispatcher("/admin/updateproductuser.jsp").forward(request, response);;
	}

	/**
	 * �����û���Ϣ
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateProductUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// 从updateproduct.jsp页面拿到数据
		String uids = request.getParameter("uid");
		String citys = request.getParameter("city");
		String usernames = request.getParameter("username");
		String fullnames = request.getParameter("fullname");
		String titles = request.getParameter("title");
		String tels = request.getParameter("tel");
		String passwords = request.getParameter("password");
		String zips = request.getParameter("zip");
		String jobs = request.getParameter("job");
		String emails = request.getParameter("email");
		String countrys = request.getParameter("country");
		String companynames = request.getParameter("companyname");
		String companyaddresss = request.getParameter("companyaddress");
		String notes = request.getParameter("note");
		
		Usr productuser = new Usr();
		// usr对象设置
		productuser.setId(Integer.valueOf(uids));
		productuser.setCity(citys);
		productuser.setUsername(usernames);
		productuser.setFullname(fullnames);
		productuser.setTitle(titles);
		productuser.setTel(tels);
		productuser.setPassword(passwords);
		productuser.setZip(zips);
		productuser.setJob(jobs);
		productuser.setEmail(emails);
		productuser.setCountry(countrys);
		productuser.setCompanyname(companynames);
		productuser.setCompanyaddress(companyaddresss);
		productuser.setNote(notes);
		
		UserMangerDAO um = new UserMangerDAO();
		// dao层进行数据库互动 提交productuser 对象
		um.updateProductuser(productuser);
		// 调用更新操作
		List<Usr> allProductList = um.getAllProductUser();
		// 更新后重新设置属性 进行更新 allproductUsrsList 
//		request.setAttribute("allproductlist", allProductList);
		request.setAttribute("allproductUsrsList", allProductList);
		// 转发
		request.getRequestDispatcher("/admin/products_showusers.jsp").forward(request, response);;
	}

	
}