package com.ascent.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Usr;

public class LoginUserInfoServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		this.doPost(request, response);
	}
public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		// �Ựsession����Ϣ
		HttpSession session = request.getSession();
		int uid=0;
		//��ȡ��¼�û���
		String username = (String) session.getAttribute("username");
		
		Usr u = (Usr)session.getAttribute("usrname");
		System.out.println("u:"+u+"\n:username:"+username);
		
		String result="";
		if(username==null){
			result = "您没有登录或已经注销";
		}else{
			//��ȡ��¼�û�ID
			uid = ((Integer) session.getAttribute("uid")).intValue();
			result = "您已经登录，信息为:<br />ID:"+uid+"<br>USERNAME:"+username+"&nbsp;&nbsp;<br>"
					+"<a href='/AscentSystem/logout'>注销</a>";
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!doctype html>");
		out.println("<html>");
		out.println("<head><title>A Servlet</title></head>");
		out.println("<body>");
		out.println(result);
		out.println("</body>");
		out.println("</html>");
		out.flush();
		out.close();
		
	}
	
}
