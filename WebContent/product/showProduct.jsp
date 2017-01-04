<%@page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="UTF-8"%>
	<!-- 引入标签库 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("path:"+path);
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
		 
<!--javascript脚本使用  -->
<!-- 
<script type="text/javascript" language="javascript">
	function addshop(str){
		var pid = str;
		send_request('./cart?a=add&pid='+pid);
	}
	
	var http_request = false;
	function send_request(url){    // 初始化、指定处理函数、发送请求函数
		http_request = false;
		if(window.XMLHttpRequest){   // Mozilla 浏览器
			http_request = new XMLHttpRequest();
		if(http_request.overrideMimeType){   // 设置MIME类别
			http_request.overrideMimeType("text/xml");
		}else if(window.ActiveXObject){   // IE浏览器
			try{
				http_request = new ActiveXObject("Msxm12.XMLHTTP");
			}catch(e){
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				}
			}
		}
		if(!http_request){   // 异常创建实例失败
			window.alert("不能创建XMLHttpXMLRquest实例！");
			return false; 
		}
		http_request.onreadystatechange = processRequest;
		// 确定发送方的请求方式和URL以及是否同步执行以下代码
		http_request.open("POST",url,true);
		http_request.send(null);
	}
	
	// 处理返回信息的函数
	function processRequest(){
		if(http_request.readyState==4){  // 判断对象状态
			if(http_request==200){ //信息已成功返回，开始处理对象
				var divhtml = http_request.responseText;   // 以字符串的形式加以处理
				alert(divhtml);
			}			
		}
		
	}
</script> -->

</head>

<body>
<!-- <h1>商品列表</h1> -->
	<center>
		<h1>商品列表</h1>
		<table cellspacing="1" cellpadding="0" width="90%" border="0">
			<tbody>
				<tr bgcolor="#fba661" height="20">
					<td><div align="center">编号</div></td>
					<td><div align="center">名称</div></td>
					<td><div align="center">药品分类</div></td>
					<td><div align="center">价格</div></td>
					<td><div align="center">图片</div></td>
					<td><div align="center">购买</div></td>
				</tr>
				
				<%
				if(null != session.getAttribute("type") && session.getAttribute("type").toString().equals("1")){
					List<Product>list = (List<Product>)request.getAttribute("allProduct");
					Iterator<Product>it = list.iterator();
					Product p = null;
					while(it.hasNext()){
						p = it.next();
					
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
				<% } }%> <!-- end while -->
				
				
				<%-- <h1><%=path %> 商品：${allProduct }</h1>
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
								<button onclick="addshop(${p.id})">购买</button>
							</div>
						</td>
					</tr>
				</c:forEach> --%>
				
			</tbody>
		</table>
	</center>
</body>


</html>


