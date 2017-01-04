package com.ascent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import sample.MD5Util;

import com.ascent.bean.Usr;
import com.ascent.dao.LoginDAO;
import com.ascent.dao.UserMangerDAO;

public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		doGet(request,response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,IOException{
		String loginstate = request.getParameter("a");  // 拿到登录状态
		if(loginstate.equals("login")){
			// 如果是login 则允许登录		
			this.userLogin(request, response);
		}else if(loginstate.equals("regis")){
			//注册
			this.addUser(request, response);
		}else if(loginstate.equals("out")){
			// 注销
			this.loginOut(request, response);
		}else if(loginstate.equals("managerUsers")){
			// 管理用户，管理员权限
			this.managerUser(request, response);
		}
	}
	
	public void destroy(){
	}
	
	public void doError(HttpServletRequest request, HttpServletResponse response,String error)
			throws ServletException,IOException{ // 错误处理
		request.setAttribute("error", error);  // 设置属性
		// 然后转发
//		System.out.println("ERROR");
		request.getRequestDispatcher("/product/error.jsp").forward(request, response);  // 未定义
		// 转发至products页面
	}
	
	// 编写登录函数
	public void addUser(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		UserMangerDAO ud = new UserMangerDAO();   // 去数据库中检查是否已经存在
		
		String usernames = request.getParameter("username");
		String passwords = request.getParameter("password");
		String companynames = request.getParameter("companyname");
		String companyaddresss = request.getParameter("companyaddress");
		String countrys = request.getParameter("country");
		String citys = request.getParameter("city");
		String jobs = request.getParameter("job");
		String tels = request.getParameter("tel");
		String zips = request.getParameter("zip");
		String emails = request.getParameter("email");

		// 对密码进行MD5加密
		MD5Util md5 = new MD5Util();
		passwords = md5.string2MD5(passwords);
		
	    Usr usr = new Usr();
	    usr.setCity(citys);
	    usr.setUsername(usernames);
	    usr.setTel(tels);
	    usr.setPassword(passwords);
	    usr.setZip(zips);
	    usr.setJob(jobs);
	    usr.setEmail(emails);
	    usr.setCountry(countrys);
	    usr.setCompanyname(companynames);
	    usr.setCompanyaddress(companyaddresss);
	    usr.setSuperuser("1");
	    int flag = ud.addProductUser(usr);
	    request.setAttribute("flag", flag);
	    request.setAttribute("username", usernames);
	    
	    request.getRequestDispatcher("/product/regist_succ.jsp").forward(request, response);
	    
	    
	}
	
	
	// 管理用户
	/**
	 * 管理用户 由于只能管理员进行管理 故不再进行数据库访问 直接判断其属性
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void managerUser(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");	
		HttpSession session = request.getSession(false);
		
		String superu = (String) session.getAttribute("super3");
		String username = (String) session.getAttribute("username3");
		String delsoft = (String) session.getAttribute("delsoft3");
//		System.out.println("username:"+username+"\ndelsoft:"+delsoft);
		
		LoginDAO ld = new LoginDAO(); 
//		MD5Util md5 = new MD5Util();
//		password = MD5Util.convertMD5(password);
//		Usr usr = ld.login(username, password);  // 拿到登录信息
		
		// 对登录信息进行判断
		
			
			
			if(delsoft!=null && "0".equals(delsoft.trim())){   // 0表示正常 1,表示软删除 
				String superUsr = superu;
				if(superUsr!=null){
					//System.out.println("usr exist");
					//HttpSession session = request.getSession(false); // 若存在会话则返回该会话，否则返回NULL
					//session.setAttribute("productuser", usr);
					//session.setAttribute("isLogin", "true");  // 设置getAttribute("isLogin")的值为true
					
					if(superUsr.equals("1")){ // 普通用户
						// 转发至普通页面
						request.getRequestDispatcher("/product/products.jsp").forward(request, response);
					}else if(superUsr.equals("2")||superUsr.equals("3")){   // 2.普通管理员  3.超级管理员
						 // 其可以查看所有用户
						UserMangerDAO usrDao = new UserMangerDAO(); // 拿到所有用户的列表对象
						List<Usr> usrs = usrDao.getAllProductUser();  // 拿到所有用户
						// 然后设置属性 转发至显示页面
						request.setAttribute("allproductUsrsList", usrs); // setAttribute
						request.getRequestDispatcher("/admin/products_showusers.jsp").forward(request, response);
					}else {
						// 打印
						System.out.println("用户角色错误，请与系统管理员联系！");
						this.doError(request, response, "用户角色错误，请与系统管理员联系！");
					}
				}else {
					// 打印
					System.out.println("用户角色错误，请与系统管理员联系！");
					this.doError(request, response, "用户角色为空，请与系统管理员联系！");
				}
			}else {
				// 打印
				System.out.println("该用户被冻结，请与系统管理员联系！");
				this.doError(request, response, "该用户被冻结，请与系统管理员联系！");
			}
			
		}
	
	
	
	
	public void userLogin(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		
		
		
		LoginDAO ld = new LoginDAO(); 
		Usr usr = ld.login(username, password);  // 拿到登录信息
		
		// 对登录信息进行判断
		if(usr==null){
			
			HttpSession session = request.getSession(false);
			String islogin = "false";
			
			session.setAttribute("islogin", islogin);
			request.getRequestDispatcher("/product/products.jsp").forward(request, response);
			
			
		}else{
			String delsoft = usr.getDelsoft();
			if(delsoft!=null && "0".equals(delsoft.trim())){   // 0表示正常 1,表示软删除 
				String superUsr = usr.getSuperuser();
				if(superUsr!=null){
//					System.out.println("usr exist");
					HttpSession session = request.getSession(false); // 若存在会话则返回该会话，否则返回NULL
					session.setAttribute("productuser", usr);  // 设置此时登录用户
					session.setAttribute("isLogin", "true");  // 设置getAttribute("isLogin")的值为true
					
					if(superUsr.equals("1")){ // 普通用户
						// 转发至普通页面
						request.getRequestDispatcher("/product/products.jsp").forward(request, response);
					}else if(superUsr.equals("2")||superUsr.equals("3")){   // 2.普通管理员  3.超级管理员
						 // 其可以查看所有用户
						UserMangerDAO usrDao = new UserMangerDAO(); // 拿到所有用户的列表对象
						List<Usr> usrs = usrDao.getAllProductUser();  // 拿到所有用户
						// 然后设置属性 转发至显示页面
						request.setAttribute("allproductUsrsList", usrs); // setAttribute
						request.getRequestDispatcher("/admin/products_showusers.jsp").forward(request, response);
					}else {
						// 打印
						System.out.println("用户角色错误，请与系统管理员联系！");
						this.doError(request, response, "用户角色错误，请与系统管理员联系！");
					}
				}else {
					// 打印
					System.out.println("用户角色错误，请与系统管理员联系！");
					this.doError(request, response, "用户角色为空，请与系统管理员联系！");
				}
			}else {
				// 打印
				System.out.println("该用户被冻结，请与系统管理员联系！");
				this.doError(request, response, "该用户被冻结，请与系统管理员联系！");
			}
		}
	}
	
	
	public void loginOut(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException{
		HttpSession session = request.getSession(false); // 不进行新的创建 若存在会话则返回该会话，否则返回NULL
		// 清空
		session.invalidate();
		// 转发 至首页
//		System.out.println("路径："+request.getContextPath());
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
		/*String username = request.getParameter("username");
		String password = request.getParameter("password");		
		
		*//**
		 * 2.����JDBC���ܴ�������  调用JDBC功能处理请求
		 * ��1��ʹ��JNDI��ȡ��Դ    <1>使用JNDI获取数据源
		 * ��2��ʹ��JDBC��ɵ�¼����  <2>使用JDBC完成登录
		 *//*
		boolean flag = false;	//��ʾ��¼�Ƿ�ɹ�    TRUE表示登录成功
		String superuser ="";   //3 ����Ա 1 ��ͨ�û�
		int uid = 0; 	//��ʾ�û�ID
		try{
			//JNDI
			Context context = new InitialContext();
			DataSource ds =(DataSource)context.lookup("java:comp/env/jdbc/mysql");
			Connection con = ds.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from  Usr where username=? and password=? and delsoft='0'");
			
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();	//ִ 
			if(rs!=null&&rs.next()){
				flag = true;
				uid = rs.getInt("id");
				superuser = rs.getString("superuser");
			}
			rs.close();
			ps.close();
			con.close();
		}catch(NamingException e){
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();	//��������ҳҳ��д�����
		out.println("<!DOCTYPE HTML>");
		out.println("<html>");
		out.println("<head><title>A servlet</title></head>");
		out.println("<body>");
		if(flag){	// flag
			
			HttpSession session = request.getSession();
			session.setAttribute("uid", new Integer(uid));	//�����û�ID
			session.setAttribute("username",username);
//			session.setAttribute(�ַ�, ����);
			if("1".equals(superuser)){
				out.println("恭喜！登录成功！您是普通用户，信息已经保存在会话session中，请打开userInfo.html查看<br />");
				// out.println("<a href='web_first/userInfo.html'>�û���Ϣ</a>");
				out.println("<a href='/AscentSystem/loginUserInfoServlet'>用户信息</a>");
			}else{
				out.println("恭喜，登录成功！您是管理员！信息已经保存下来再会话session中，请打开userinfo.html查看<br />");
				// out.println("<a href='web_first/userInfo.html'>�û���Ϣ</a>");
				out.println("<a href='/AscentSystem/loginUserInfoServlet'>用户信息</a>");
			}
			
		}else{
			out.println("用户名或密码错误，登录失败！");
		}
		out.println("</body>");
		out.println("</html>");
		out.flush();
		out.close();
		
		
		
	}*/

	
	
}
