package sample;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorldServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>HelloWorldServlet</title></head>");
		out.println("<body bgcolor=\"#ffffff\">");
		out.println("<p>Hello World!</p>");
		out.println("</body></html>");
	}

}
