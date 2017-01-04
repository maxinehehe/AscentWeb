package sample;

import java.io.*;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;



public class DBServlet extends HttpServlet {
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		try{
			Context initCtx = new InitialContext();
//			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mysql");
//			System.out.println("ds:"+ds);
			Connection con = ds.getConnection();
//			System.out.println("con:"+con);
			PrintWriter out = res.getWriter();
			Statement stmt = con.createStatement();
			String query = "select *"+"from usr";
			ResultSet rs = stmt.executeQuery(query);
			dispResultSet(rs,out);
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){e.printStackTrace();}
	}

	private void dispResultSet(ResultSet rs, PrintWriter out) throws SQLException{
		
		out.println("<html><head><title>Students</title></head><body>");
		while(rs.next()){
		out.println("id:"+rs.getString(1));
		out.println("name:"+rs.getString(2));
		out.println("<p>");
		}
		out.println("</body></html>");
	}
	
}
