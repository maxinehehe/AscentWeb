package com.ascent.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.lxh.smart.SmartUpload;


import com.ascent.bean.Product;
import com.ascent.bean.Usr;
import com.ascent.dao.ProductDAO;
import com.jspsmart.upload.SmartUpload;



@SuppressWarnings("serial")    // 该批注的作用是给编译器一条指令，告诉它对被批注的代码元素内部的某些警告保持静默。 
public class ProductServlet extends HttpServlet{
	private ServletContext sc = null;
	private ServletConfig config = null;
	private String uploadPath = "upload";
	
	@Override
	public void init() throws ServletException {
		super.init();
		sc = this.getServletContext();
		config = this.getServletConfig();
		
		if (!new File(uploadPath).isDirectory())
			new File(uploadPath).mkdirs();
	}
	
	public void doError(HttpServletRequest request, HttpServletResponse response,String error)
			throws ServletException, IOException {
		request.setAttribute("error", error);
		// 转发
		request.getRequestDispatcher("/product/products.jsp").forward(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		this.doGet(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String state = request.getParameter("a");
		if(state.equals("all")){   // 浏览全部商品
			// 调用方法
			this.findProduceAll(request, response);
		}else if(state.equals("search")){
			// 调用查询方法
			this.searchProduct(request, response);
		}else if(state.equals("updateProduct")){
			// 更新商品
			// 第一步：首先查询到商品
			this.productSearchbyid(request, response);
		}else if(state.equals("update")){
			// 更新商品
			// 第二步：执行更新
			this.updateProduct(request, response);
		}else if(state.equals("del")){
			// 删除商品  
			this.deleteProduct(request, response);
		}else if(state.equals("save")){
			this.addProduct(request, response);
		}
	}

	
	
	
	/**
	 *  保存产品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		SmartUpload mySmartUpload = new SmartUpload();
//		System.out.println("addProduct1");
		try {
//			System.out.println("addProduct2");
			// Initialization
			mySmartUpload.initialize(config, request, response);
			mySmartUpload.setMaxFileSize(500 * 1024);
			// Upload
			mySmartUpload.upload();
			// 取得text框中的数据
			String productnumber = mySmartUpload.getRequest().getParameter("productnumber");
			String pname = mySmartUpload.getRequest().getParameter("productname");
			String pcatalogno = mySmartUpload.getRequest().getParameter("catalogno");
			String pcas = mySmartUpload.getRequest().getParameter("cas");
			String pmdlnumber = mySmartUpload.getRequest().getParameter("mdlnumber");
			String pnewproduct = mySmartUpload.getRequest().getParameter("newproduct");
			String pformula = mySmartUpload.getRequest().getParameter("formula");
			String pcategory = mySmartUpload.getRequest().getParameter("category");
			String pstock = mySmartUpload.getRequest().getParameter("stock");
			String price1 = mySmartUpload.getRequest().getParameter("price1");
			String price2 = mySmartUpload.getRequest().getParameter("price2");
			String prealstock = mySmartUpload.getRequest().getParameter("realstock");
			String weight = mySmartUpload.getRequest().getParameter("weight");
			String pnote = mySmartUpload.getRequest().getParameter("note");
			
			Product pdt = new Product();
			pdt.setProductnumber(productnumber);
			pdt.setProductname(pname);
			pdt.setCategoryno(pcatalogno);
			pdt.setCas(pcas);
			pdt.setMdint(pmdlnumber);
			pdt.setIsnewproduct(pnewproduct);
			pdt.setFormula(pformula);
			pdt.setCategory(pcategory);
			pdt.setStock(pstock);
			pdt.setRealstock(prealstock);
			pdt.setPrice1(Float.parseFloat(price1));
			pdt.setPrice2(Float.parseFloat(price2));
			pdt.setWeight(weight);
			pdt.setNote(pnote);
			com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0);
			// 获取上传文件名称和后缀
			String fileName = myfile.getFileName();
			System.out.println("filename:"+fileName);
			if (fileName != null && !fileName.equals("")) {
				pdt.setImagepath(fileName);
				myfile.saveAs("/" + uploadPath + "/" + fileName, 1);
				System.out.println("保存成功！");
			}
			ProductDAO Pd = new ProductDAO();
			System.out.println("第二步保存！");
			Pd.saveProduct(pdt);
			
		} catch (Exception e) {
			System.out.println("Unable to upload the file.<br>");
			System.out.println("Error : " + e.toString());
		}
		try {
			this.findProduceAll(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	
	
	
	public void findProduceAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product>  productlist = new ProductDAO().getAllProduct();  // 拿到所有商品
//		System.out.println("ProductServlet:find:productlist:"+productlist);
		if(productlist==null){
			//商品为空
			this.doError(request, response, "商品为空！");
		}
		//还要判断此时的登录用户是否为管理员
		else{ // 如果商品不空 判断用户
			HttpSession session = request.getSession(false); // 没有不创建新的
			Usr usr = (Usr) session.getAttribute("productuser"); // 拿到此时登录用户
			request.setAttribute("productlist", productlist);   // 设置属性
			if(usr==null){ // 并未拿到用户
				request.getRequestDispatcher( "/product/products_show.jsp").forward(request, response);
			}else if(usr.getSuperuser().equals("2")||usr.getSuperuser().equals("3")){
				// 如果是管理员 则让管理员进入不同的页面
				
				request.getRequestDispatcher("/admin/admin_products_show.jsp").forward(request, response);
			}else if(usr.getSuperuser().equals("1")){
				// 普通注册用户
				request.getRequestDispatcher( "/product/products_show.jsp").forward(request, response);
			}else{
				System.out.println("出错！");
			}
			
		}
	}
	
	
	
	public void searchProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			String searchName= request.getParameter("searchName");
			String searchValue = request.getParameter("searchValue");
//			System.out.println("searchName:"+searchName+"\nsearchValue:"+searchValue);
			ProductDAO pd = new ProductDAO();
			List<Product>  productList = pd.searchProduct(searchName, searchValue);
//			System.out.println("ProductServlet:productlist:::"+productList);
			// 设置提交属性 以待转发至新的jsp页面使用
			request.setAttribute("searchproductlist", productList);
			// 转发至新的页面 以显示 查询结果
			request.getRequestDispatcher("/product/products_search_show.jsp").forward(request, response);
			
	}
	
	
	/**
	 * 修改产品 首先查询产品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void productSearchbyid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			// 拿到产品id
			String productid = request.getParameter("pid");
			int pid = Integer.valueOf(productid);
			ProductDAO pd = new ProductDAO();
			Product product = pd.getProductByPid(pid);
			// 为产品设置属性
			request.setAttribute("pid_product", product);
			// 转发
			request.getRequestDispatcher("/admin/update_products_admin.jsp").forward(request, response);
	}
	
	
	
	public void updateProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		SmartUpload mySmartUpload = new SmartUpload();
		//System.out.println("进入保存图1");
		try {
			//System.out.println("进入保存图2");
//			System.out.println("更新产品");
			// 图片等资源一般利用longblob保存  或者只保存其路径
			// 初始化
			mySmartUpload.initialize(config, request, response);
			// 设定上传大小
			mySmartUpload.setMaxFileSize(500 * 1024);
			// 上传
			mySmartUpload.upload();
			// 设置各个属性
			String productid = mySmartUpload.getRequest().getParameter("pid");
			int pid = Integer.valueOf(productid);
			String productnumber = mySmartUpload.getRequest().getParameter("productnumber");
			String pname = mySmartUpload.getRequest().getParameter("productname");
			String pcas = mySmartUpload.getRequest().getParameter("cas");
			String pmdlnumber = mySmartUpload.getRequest().getParameter("mdlnumber");
			String pnewproduct = mySmartUpload.getRequest().getParameter("newproduct");
			String pformula = mySmartUpload.getRequest().getParameter("formula");
			String pcategory = mySmartUpload.getRequest().getParameter("category");
			String pcategoryno = mySmartUpload.getRequest().getParameter("categoryno");
			String pstock = mySmartUpload.getRequest().getParameter("stock");
			String prealstock = mySmartUpload.getRequest().getParameter("realstock");
			String weight = mySmartUpload.getRequest().getParameter("weight");
			String price1 = mySmartUpload.getRequest().getParameter("price1");
			String price2 = mySmartUpload.getRequest().getParameter("price2");
			String pnote = mySmartUpload.getRequest().getParameter("note");
			
			Product pdt = new Product();
			pdt.setId(pid);
			pdt.setProductname(pname); 
			pdt.setProductnumber(productnumber);
			pdt.setCas(pcas); 
			pdt.setMdint(pmdlnumber);
			pdt.setIsnewproduct(pnewproduct);
			pdt.setFormula(pformula);
			pdt.setCategory(pcategory); 
			pdt.setCategoryno(pcategoryno);
			pdt.setStock(pstock);
			pdt.setRealstock(prealstock); 
			pdt.setWeight(weight);
			pdt.setPrice1(Float.parseFloat(price1));
			pdt.setPrice2(Float.parseFloat(price2));
			pdt.setNote(pnote);
			com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0);
			// 保存文件
			String fileName = myfile.getFileName();
			if (fileName != null && !fileName.equals("")) {
				pdt.setImagepath(fileName);
				myfile.saveAs("/" + uploadPath + "/" + fileName, 1); // "/" + uploadPath + "/" +
			}
			ProductDAO Pd = new ProductDAO();
			Pd.updateProduct(pdt);
		} catch (Exception e) {
			System.out.println("Unable to upload the file.<br>");
			e.printStackTrace();
			System.out.println("Error : " + e.toString());
		}
		try {
			this.findProduceAll(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
	
	/**管理员
	 * 删除商品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String productid = request.getParameter("pid");
		int pid = Integer.valueOf(productid);
		ProductDAO pd = new ProductDAO();
		pd.delProductByPid(pid);
		// 重新获取所有产品信息
		List<Product> ProcuctList = pd.getAllProduct();
		// 重新设置产品属性
		request.setAttribute("productlist", ProcuctList);
		// 转发
		request.getRequestDispatcher("/admin/admin_products_show.jsp").forward(request, response);
	}
	
	
	
	
}
