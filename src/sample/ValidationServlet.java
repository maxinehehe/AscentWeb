package sample;

import java.io.IOException;
import java.text.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class ValidationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException{
		this.doPost(request,response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException{
		String username = request.getParameter("username");//.getParameter("username");
		System.out.println("username:"+username);
		if(username!=null&&username.equals("lixin"))
			response.getWriter().print("true");
		else
			response.getWriter().print("false");
	}
}
