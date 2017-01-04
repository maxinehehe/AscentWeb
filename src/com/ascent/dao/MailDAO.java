package com.ascent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ascent.bean.Mailtb;
import com.ascent.util.DataAccess;
import sample.*;

public class MailDAO {
	
	public Mailtb findMail()throws SQLException{
		MD5Util md5 = new MD5Util();
		Connection con = DataAccess.getConnection(); // 获取连接
		Statement st = con.createStatement(); // 创建执行语句
		String sql = "select * from mailtb";
		ResultSet rs = st.executeQuery(sql);
		Mailtb mb =null;

		while(rs.next()){
			mb = new Mailtb();   // 创建对象
			mb.setFromaddress(rs.getString("fromaddress"));
			// MD5 反解 
//			md5.convertMD5(rs.getString("frompassword"))
			mb.setFrompassword(rs.getString("frompassword"));
			mb.setToaddress(rs.getString("toaddress"));
		}
		st.close();
		rs.close();
		con.close();
		return mb;
	}
	
	public void saveMail(Mailtb mb)throws SQLException{
		MD5Util md5 = new MD5Util();
		Connection con = DataAccess.getConnection();
		String sql = "insert into mailtb (fromaddress,frompassword,toaddress) values(?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, mb.getFromaddress());
		// 进行Md5加密  1.简单加密：md5.string2MD5  2.复杂加密：md5.convertMD5
//		 md5.convertMD5(mb.getFrompassword());
		String fpassword = md5.convertMD5(mb.getFrompassword());
		pst.setString(2, fpassword);  // 未进行复杂啾咪
		pst.setString(3, mb.getToaddress());
		
		pst.execute("truncate mailtb");
		pst.execute();
		pst.close();
		con.close();
	}
}
