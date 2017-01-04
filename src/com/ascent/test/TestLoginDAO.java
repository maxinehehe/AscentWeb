package com.ascent.test;

import com.ascent.bean.Usr;
import com.ascent.dao.LoginDAO;

/**
 * 
 * @author hehe
 *
 */
public class TestLoginDAO {
	public static void main(String[] args) {
		LoginDAO dao = new LoginDAO();
		Usr u = dao.login("ascent", "ascent");
		
		if (u!=null){
			System.out.println("登录成功！");
			String superuser = u.getSuperuser();
			if(superuser!=null&&"3".equals(superuser) ){
				System.out.println("您是管理员！");
			}else{
				System.out.println("您是普通用户！");
			}
		}else{
			System.out.println("登录失败！");
		}
	}
}
