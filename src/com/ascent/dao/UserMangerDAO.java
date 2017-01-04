package com.ascent.dao;

import java.sql.*;
import java.util.*;
import com.ascent.bean.Usr;
import com.ascent.util.*;

public class UserMangerDAO {
	
	public List<Usr>getAllProductUser(){
		Connection con = DataAccess.getConnection();
		String sql = "select * from usr p order by p.id";
		List<Usr>list = new ArrayList<Usr>();
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Usr pu = new Usr();
				pu.setId(rs.getInt("id"));
				pu.setUsername(rs.getString("username"));
				pu.setPassword(rs.getString("password"));
				pu.setFullname(rs.getString("fullname"));
				pu.setTitle(rs.getString("title"));
				pu.setCompanyname(rs.getString("companyname"));
				pu.setCompanyaddress(rs.getString("companyaddress"));
				pu.setCity(rs.getString("city"));
				pu.setJob(rs.getString("job"));
				pu.setTel(rs.getString("tel"));
				pu.setEmail(rs.getString("email"));
				pu.setCountry(rs.getString("country"));
				pu.setZip(rs.getString("zip"));
				pu.setSuperuser(rs.getString("superuser"));
				pu.setDelsoft(rs.getString("delsoft"));
				pu.setNote(rs.getString("note"));
				list.add(pu);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
//		System.out.println("listuser:"+list);
		return list;
	}
	
	
	
	// 添加新的
	public int addProductUser(Usr pu) {
		Connection con = DataAccess.getConnection();
		String sql = "insert into usr (username,password,fullname,title,companyname,companyaddress,city,job,tel,email,country,zip,superuser,delsoft,note) values(?,?,?,?,?,?,?,?,?,?,?,?,'1','0',?)";
		PreparedStatement pst = null ;
		try {
			pst = con.prepareStatement(sql);
//			System.out.println("username:"+pu.getUsername());
			pst.setString(1, pu.getUsername());
			pst.setString(2, pu.getPassword());
			pst.setString(3, pu.getFullname());
			pst.setString(4, pu.getTitle());
			pst.setString(5, pu.getCompanyname());
			pst.setString(6, pu.getCompanyaddress());
			pst.setString(7, pu.getCity());
			pst.setString(8, pu.getJob());
			pst.setString(9, pu.getTel());
			pst.setString(10, pu.getEmail());
			pst.setString(11, pu.getCountry());
			pst.setString(12, pu.getZip());
			pst.setString(13, pu.getNote());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally{
			try {
				if(pst!=null){
					pst.close();
					
				}
				if(con!=null){
					con.close();
					
				}
			} catch (Exception e2) {
				e2.printStackTrace();
				return 0;
			}
		}
		return 1;
	}

	
	/**
	 * 通过id拿到数据库对应数据 
	 * @param uid
	 * @return
	 */
	
	public Usr getProductUserByid(int uid) {
		Connection con = DataAccess.getConnection();
		String sql = "select * from usr p where p.id=?";
		PreparedStatement pst = null ;
		Usr pu = null;
		ResultSet rs = null ;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, uid);
			rs = pst.executeQuery();
			if (rs.next()) {
				pu = new Usr();
				pu.setId(rs.getInt("id"));
				pu.setUsername(rs.getString("username"));
				pu.setPassword(rs.getString("password"));
				pu.setFullname(rs.getString("fullname"));
				pu.setTitle(rs.getString("title"));
				pu.setCompanyname(rs.getString("companyname"));
				pu.setCompanyaddress(rs.getString("companyaddress"));
				pu.setCity(rs.getString("city"));
				pu.setJob(rs.getString("job"));
				pu.setTel(rs.getString("tel"));
				pu.setEmail(rs.getString("email"));
				pu.setCountry(rs.getString("country"));
				pu.setZip(rs.getString("zip"));
				pu.setSuperuser(rs.getString("superuser"));
				pu.setDelsoft(rs.getString("delsoft"));
				pu.setNote(rs.getString("note"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null){
					rs.close();
				}
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return pu;
	}
	
	
	
	
	
	public void updateProductuser(Usr pu) {
		Connection con = DataAccess.getConnection();
		String sql = "update usr set username=?,password=?,fullname=?,title=?,companyname=?,companyaddress=?,city=?,job=?,tel=?,email=?,country=?,zip=?,note=? where id=?";
		PreparedStatement pst = null ;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, pu.getUsername());
			pst.setString(2, pu.getPassword());
			pst.setString(3, pu.getFullname());
			pst.setString(4, pu.getTitle());
			pst.setString(5, pu.getCompanyname());
			pst.setString(6, pu.getCompanyaddress());
			pst.setString(7, pu.getCity());
			pst.setString(8, pu.getJob());
			pst.setString(9, pu.getTel());
			pst.setString(10, pu.getEmail());
			pst.setString(11, pu.getCountry());
			pst.setString(12, pu.getZip());
			pst.setString(13, pu.getNote());
			pst.setInt(14, pu.getId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/**
	 * by hehe
	 * @param uid
	 * @param superuser
	 * 更新用户
	 */
	public void updateSuperuser(int uid, String superuser) {
		// 利用id进行更新
		Connection con = DataAccess.getConnection();
		String sql = "update usr set superuser=? where id=?";
		PreparedStatement pst = null ;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, superuser);   // 设置 用户状态【管理员 普通用户】
			pst.setInt(2, uid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/**
	 * by hehe
	 * @param uid
	 * @param delsoft
	 * 删除   
	 * note :此删除为软删除 ，【可恢复】
	 */
	public void delSoftuser(int uid, String delsoft) {
		// 删除用户  软删除
		Connection con = DataAccess.getConnection();
		String sql = "update usr set delsoft=? where id=?";
		PreparedStatement pst = null ;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, delsoft);   // 更改delsoft
			pst.setInt(2, uid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
}


