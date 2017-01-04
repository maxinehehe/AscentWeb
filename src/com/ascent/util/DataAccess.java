package com.ascent.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import javax.naming.*;
import javax.sql.DataSource;

public class DataAccess{
	public static Connection getConnection(){
		Connection con = null;
		try{
			Context initCtx = new InitialContext();
//			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/mysql");
//			System.out.println("ds:"+ds);
			con = ds.getConnection();
			
//			System.out.println("con:"+con);
			
		}catch(Exception e){
			e.printStackTrace();
		}

		return con;
	}
}

//
//public class DataAccess {
//	private static String driver;
//	private static String url;
//	private static String user;
//	private static String pwd;
//	static{
//		DatabaseConfigParser databaseConfig = new DatabaseConfigParser();
//		try{
//			databaseConfig.parse("database.conf.xml");
//			Properties dbProps = databaseConfig.getProps();
//			driver = dbProps.getProperty("driver");
////			System.out.println("driver:"+driver);
//			url = dbProps.getProperty("url");
//			user = dbProps.getProperty("user");
//			pwd = dbProps.getProperty("password");
//		}catch(Exception e){
//			e.printStackTrace();
//		}		
//	}
//	
//	public DataAccess()throws Exception{
//	}
//	
//	public static Connection getConnection(){
//		Connection con = null;
//		try{
//			Class.forName(driver);
////			Class.forName("com.mysql.jdbc.Driver");
////			System.out.println("driver:"+driver);
//			con = DriverManager.getConnection(url,user,pwd);
//			System.out.println("url:"+url
//					+"user:"+user
//					+"pwd:"+pwd);
//		}catch(Exception ex){
//			ex.printStackTrace();
//		}
//		return con;
//	}
//	
//}
