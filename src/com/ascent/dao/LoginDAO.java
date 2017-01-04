package com.ascent.dao;

import java.sql.*;

import sample.MD5Util;

import com.ascent.bean.Usr;
import com.ascent.util.DataAccess;

/**
 * @by 刘贺贺
 * @author hehe
 *
 */
public class LoginDAO {
	/**
	 * 登录
	 * @param user 
	 * @param password 
	 * @return 
	 */
	public Usr login(String user, String password){
		Connection con = DataAccess.getConnection();
		
//		System.out.println("con:"+con);
//		System.out.println("user:"+user+"\n password:"+password);
		
		MD5Util md5 = new MD5Util();
		String passwordMd5 = null ;
		if(password!=null)
			passwordMd5 = md5.string2MD5(password);
		
		String sql = "select * from usr where username=? and password=?";
		String sql2 = "select * from usr where username=? and password=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		Usr pu = null;
		int i=0;
		try{
			pst = con.prepareStatement(sql);
			pst.setString(1, user);    //getObject(1)
			pst.setString(2, password);
			rs = pst.executeQuery(); //
			if(rs.next()){
				pu = new Usr();
				i++;
				pu.setId(rs.getInt("id"));
				pu.setSuperuser(rs.getString("superuser"));
				pu.setUsername(rs.getString("username"));
				pu.setEmail(rs.getString("email"));
				pu.setTel(rs.getString("tel"));
				pu.setCompanyname(rs.getString("companyname"));
				pu.setCompanyaddress(rs.getString("companyaddress"));
				pu.setDelsoft(rs.getString("delsoft"));
				
			}
			
			if(i==0){
				pst = con.prepareStatement(sql2);
				pst.setString(1, user);    //getObject(1)
				pst.setString(2, passwordMd5);
				rs = pst.executeQuery(); //
				if(rs.next()){
					pu = new Usr();
					
					pu.setId(rs.getInt("id"));
					pu.setSuperuser(rs.getString("superuser"));
					pu.setUsername(rs.getString("username"));
					pu.setEmail(rs.getString("email"));
					pu.setTel(rs.getString("tel"));
					pu.setCompanyname(rs.getString("companyname"));
					pu.setCompanyaddress(rs.getString("companyaddress"));
					pu.setDelsoft(rs.getString("delsoft"));
					
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			}catch (Exception e2){
				e2.printStackTrace();
			}
		}
		
		return pu;
	}
	
}
