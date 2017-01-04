package com.ascent.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.ascent.bean.Product;
import com.ascent.dao.ProductDAO;


/**
 * 项目案例 查询所有商品控制类
 * @author hehe
 *
 */
public class FindAllProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		this.doPost(request, response); // 利用Post方法
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		//控制层实现步骤
		// 1.调用业务方法查询所有商品
		List<Product>list = new ProductDAO().getAllProduct();
		System.out.println("Findall..list:"+list.size());
		// 2.商品集合保存到请求范围
		request.setAttribute("allProduct", list);
		// 3.请求转发至显示层jsp
		request.getRequestDispatcher("product/showProduct.jsp").forward(request, response);
	}
}
