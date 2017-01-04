package com.ascent.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Time;


/**
 * 权限验证过滤器
 * 第10章例题
 * @author hehe
 *
 */
public class AuthorityFilter implements Filter {
	public void destroy(){}
	
	public void init(FilterConfig arg0) throws ServletException{}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;  //向上转
		HttpServletResponse response = (HttpServletResponse)resp;
		HttpSession session = request.getSession();
		//从session中获取用户登录权限
		String superuser = (String) session.getAttribute("superuser");
		PrintWriter out = response.getWriter();
		if(superuser==null){  // 没有登录，session中没有保存
			
			out.println("没有登录，session中无数据！");
			
			System.out.println("没有登录，session中无数据！");
			//没有登录访问管理员的资源，跳转到登录页面
			response.sendRedirect(request.getContextPath()+"/login.html");
		}else{ //登录用户
			if(superuser.equals("3")){
			//是管理员，权限通过，请求通过
			out.println("管理员");
			
			chain.doFilter(req, resp);
			}else{
				//普通用户访问管理员资源，跳转到错误页面
				out.println("普通用户，将跳转到错误页面！");
				
				response.sendRedirect(request.getContextPath()+"/authorError.html");
			}
		}
	}

}
