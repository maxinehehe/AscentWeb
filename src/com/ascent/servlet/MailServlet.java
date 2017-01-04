package com.ascent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ascent.bean.Mailtb;
import com.ascent.dao.MailDAO;

@SuppressWarnings("serial")
public class MailServlet extends HttpServlet{
	private ServletContext sc = null;
	
	public void init()throws ServletException{
		super.init();
		sc = this.getServletContext();
	}
	
	public void destroy(){
		/**/
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// 拿到属性
		String state = request.getParameter("a");  // 从mailmanager.jsp拿到a属性进行判断
		// 针对不同的属性进行 不同的处理
		try{
		if(state.equals("all")){
			this.findMail(request, response);
		}else if(state.equals("save")){
//			System.out.println("save");
			this.saveMail(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("MailServlet is Error");
		}
	}
	
	private void doError(HttpServletRequest request,HttpServletResponse response, String error)throws ServletException, IOException {
		request.setAttribute("error", error);
		request.getRequestDispatcher("/admin/mailmanager.jsp").forward(request, response); // 转发至其他页面
	}
	
	//findemail
	public void findMail(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException,SQLException {
		MailDAO mb = new MailDAO();
		Mailtb mail = mb.findMail();
		
		if(mail==null){
			String dthtml = "邮箱为空！";
			// 利用输出流进行显示
//			dthtml = java.net.URLDecoder.decode(dthtml, "UTF-8");
//			response.getOutputStream().print(dthtml);
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(dthtml); // 输出语句
			
			out.flush();
			out.close();
		}else{
			String fadd = mail.getFromaddress(); // 拿到from地址
			String tadd = mail.getToaddress();  // 拿到to地址
			String dthtml = "发件邮箱地址：" + fadd + "<br/> 收件地址：" + tadd;
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");  
			// 以上两行字符集编码需要在getWriter之前调用
			PrintWriter out = response.getWriter();
//			dthtml = java.net.URLDecoder.decode(dthtml, "UTF-8");
			out.print(dthtml); // 输出语句
			out.flush();
			out.close();
		}
		
	}
	
	
	// 将邮箱存储
	public void saveMail(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException,SQLException {
		String fadd = request.getParameter("fromaddressname");   // 邮件地址
		String faddtype = request.getParameter("fromaddresstype");  // 邮件后缀 @。。。
		String fpassword = request.getParameter("frompassword");   // 密码  密码将会在 MailDAO 
		String toadd = request.getParameter("toaddress");
		
		String fromaddress = fadd + faddtype;
		Mailtb mail = new Mailtb();
//		System.out.println("saveMail");
		mail.setFromaddress(fromaddress);  // 设置邮箱地址
		mail.setFrompassword(fpassword);  //密码
		mail.setToaddress(toadd);
		
		MailDAO md = new MailDAO();
		md.saveMail(mail);
//		System.out.println("此时保存");
		request.getRequestDispatcher("/admin/mailmanager.jsp").forward(request, response);
	}
	
}
