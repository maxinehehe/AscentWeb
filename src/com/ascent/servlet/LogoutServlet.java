package com.ascent.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet{
	
	
		public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			this.doPost(request, response);
		}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		// �����Ự session
		HttpSession session = request.getSession();
		//ע��session
		session.invalidate();
		//��ת����ҳ��
//		System.out.println("·����"+request.getContextPath());
		
		response.sendRedirect(request.getContextPath()+"/web_first/login.html");
		
	}
}

