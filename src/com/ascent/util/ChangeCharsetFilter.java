package com.ascent.util;


import java.io.IOException;
import javax.servlet.*;

public class ChangeCharsetFilter implements Filter{
	protected String encoding=null;	//要制定的编码，在web.xml中配置
	protected FilterConfig filterConfig=null;
	public void destroy(){
		this.encoding=null;
		this.filterConfig=null;
	}
	public void doFilter(ServletRequest request,ServletResponse response,
			FilterChain chain) throws IOException,ServletException{
		String encoding=getEncoding();		// 得到指定的编码名字
		if(request.getCharacterEncoding()==null){ 
			request.setCharacterEncoding(encoding);  	//设置request的编码
			//response.setCharacterEncoding(encoding);
//			System.out.println("encoding="+encoding);
		}
		chain.doFilter(request,response);	//有机会执行下一个filter
		//如果没有filter，那就是请求的资源。
	}
	
	//通过FilterConfig对象获取配置文件中设定的字符。
	
	public void init(FilterConfig filterConfig)throws ServletException{
		this.filterConfig=filterConfig;
//		System.out.println("this.filterConfig:"+this.filterConfig);
//		ApplicationFilterConfig[name=encodingfilter, filterClass=com.ascent.util.ChangeCharsetFilter]
		this.encoding=filterConfig.getInitParameter("encoding");		//得到在web.xml中配置的编码
//		System.out.println("this.encoding:"+this.encoding);
//		UTF-8
		// utf-8
	}
	public String getEncoding(){
		return(this.encoding);
	}
}
