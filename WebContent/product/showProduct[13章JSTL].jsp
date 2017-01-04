<!-- 第十三章利用JSTL改进 -->
<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!-- 引入标签库 --> 

<%@page language="java" import="java.util.*,com.ascent.bean.*"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP' showProduct.jsp starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 
			<link rel="stylesheet" type="text/css" href="style.css">
		 -->
</head>

<body>
	<center>
		<h1>商品列表</h1>
		<table cellspacing="1" cellpadding="0" width="40%" border="0">
			<tbody>
				<tr bgcolor="#fba661" height="20">
					<td><div align="center">编号</div></td>
					<td><div align="center">名称</div></td>
					<td><div align="center">药品分类</div></td>
					<td><div align="center">价格</div></td>
					<td><div align="center">图片</div></td>
					<td><div align="center">购买</div></td>
				</tr>
				<c:forEach var="p" items="${allProduct}" >
					<tr bgcolor="#f3f3f3" height="25">
						<td width="10%">
							<div align="center">${p.productnumber}</div>
						</td>
						<td width="13%">
							<div align="center">${p.productname}</div>
						</td>
						<td width="12%">
							<div align="center">${p.category}</div>
						</td>
						<td width="10%">
							<div align="center">${p.price1}</div>
						</td>
						<td width="12%">
							<div align="center">
								<img height="25" hspace="0"
									src="<%=path%>/images/${p.imagepath}" width="83" border="0">
							</div>
						</td>
						<td width="13%">
							<div align="center">
								<a href="cart?pid=${p.id}">购买</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</center>
</body>


</html>


<!-- 第十二章实现方式 -->                                                                          
<%-- <%@ page language="java" import="java.util.*,com.ascent.bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String path=request.getContextPath()+"/images";
String basePath=request.getScheme()+
"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
/* System.out.println("path:"+path);
System.out.println("basepath:"+basePath); */
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<base href="<%=path %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My JSP 'showProduct.jsp' starting page</title>

</head>
<body>
	<center >
		<h1>商品列表</h1>
		<table cellspacing="1" cellpadding="0" width="40%" border="0">
			<tbody> <!-- 表体 --> <!-- th:表头 -->
				<tr bgcolor="#fba661" height="20">
					<td><div align="center">编号</div></td>
					<td><div align="center">名称</div></td>
					<td><div align="center">药品分类</div></td>
					<td><div align="center">价格</div></td>
					<td><div align="center">图片</div></td>
					<td><div align="center">购买</div></td>
				</tr>
				<%
					List<Product>list = (List<Product>)request.getAttribute("allProduct"); // 返回指定属性
					Iterator<Product>it = list.iterator(); // 迭代器
					Product p = null;
					while(it.hasNext()){
						p = it.next();   // }
				%>
				
				<tr bgcolor="#f3f3f3" height="25">
				    <td width="10%">
				    	<div align="center"><%=p.getProductnumber() %></div>
				    </td>
				    <td width="13%">
				    	<div align="center"><%=p.getProductname() %></div>
				    </td>
				     <td width="12%">
				    	<div align="center"><%=p.getCategory() %></div>
				    </td>
				    <td width="10%">
				    	<div align="center"><%=p.getPrice1() %></div>
				    </td>
				    
				     <td width="12%">
				    	<div align="center"><img height="25" hspace="0" src="<%=path%>/<%=p.getImagepath() %>" width="83" border="0" /></div>
				    </td>
				    <%System.out.println("图片地址："+p.getImagepath()); %>
				    
				     <td width="13%">
				    	<div align="center"><a href="cart? pid=<%=p.getId() %>">购买</a></div>
				    </td>
				    
				</tr>
				<% } %> <!-- end while -->
			</tbody>
		</table>
	</center>
	
</body>
</html> --%>