<%@page import="com.ascent.util.CartItem"%>
<%@ page language="java" import="java.util.*,com.ascent.bean.*"
	contentType="text/html;charset=UTF-8" errorPage="./error.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--
Create By:
@Author:maxineHehe
@time:2016/12/12 9:09
  -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>AscentWeb电子商务</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link id ="styles" rel="stylesheet" href="./css/andreas08(blue).css"
			type="text/css" media="screen,projection" />
		<script charset="utf-8" type="text/javascript" src="./js/functions.js">
		</script>
		
		<script language="javascript" type="text/javascript">
		
		function updateQuantity(obj, str) {   // 更新
			var pid = str;
			var quantity = obj.value;
			/* alert("updateQuantity"); */
			send_request("./shopcart?a=updateNum&pid=" + pid + "&quantity=" + quantity);
		}
		
	/* 	var http_request = false;
		function createRequest(url){
			http_request = false;
			if(window.XMLHttpRequest){   // Mozilla浏览器
				http_request = new XMLHttpRequest();
				if(http_request.overrideMimeType){
					http_request.overrideMimeType('text/xml'); // 设置MIME类别
				}
			}else if(window.ActiveXObject){ // IE浏览器
				try{
					http_request = new ActiveXObject("Msxm12.XMLHTTP");
				}catch(e){
					try{
						http_request = new ActiveXObject("Microsoft.XMLHTTP");
					}catch(e){}
				}
			}
			
			if(!http_request){
				alert("不能创建XMLHttpRequset对象实例！");
				return false;
			}
			// 调用返回 结果处理函数
			http_request.onreadystatechange = processRequest; 
			http_request.open("POST",url,true);   // 异步执行
			http_request.send(null);
			
		} */
		
		var http_request = false;
		function send_request(url) { //初始化、指定处理函数、发送请求的函数
			http_request = false;
			//开始初始化XMLHttpRequest对象
			if (window.XMLHttpRequest) { //Mozilla 浏览器
				http_request = new XMLHttpRequest();
				if (http_request.overrideMimeType) {//设置MiME类别
					http_request.overrideMimeType('text/xml');
				}
			} else if (window.ActiveXObject) { // IE浏览器
				try {
					http_request = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						http_request = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
					}
				}
			}
			if (!http_request) { // 异常，创建对象实例失败
				window.alert("不能创建XMLHttpRequest对象实例.");
				return false;
			}
			http_request.onreadystatechange = processRequest;
			// 确定发送请求的方式和URL以及是否同步执行下段代码
			http_request.open("POST", url, true);
			http_request.send(null);
		}
		
		function processRequest(){
			if(http_request.readyState == 4){ // 判断对象请求状态
				if(http_request.status==200){ // 请求成功，开始处理返回结果
					var divhtml = http_request.responseText;
					alert(divhtml);
				}
			}
		}
		
		</script>
		
	</head>
	
	<body onload="getCookie()">
		<div id="container">
			<div id="header"></div>
			<div id="navigation">
				<ul>
					<li class="selected"></li>
					<li>
						<a href="./index.jsp">首页</a>
					</li>
					<li>
						<a href="./product/itservice.jsp">IT服务</a>
					</li>
					<li>
						<a href="./product/products.jsp">电子商务系统</a>
					</li>
					<li>
						<a href="./product/employee.jsp">员工招聘</a>
					</li>
					<li>
						<a href="./product/ContactUs.jsp">关于我们</a>
					</li>
				</ul>
			</div>
			
			<div id="content2">
				<table width="100%" height="400" border="0" align="center"
					cellpadding="0" cellspacing="0">

					<!-- <tr>
						<td height="4" colspan="2" align="left" valign="bottom"></td>
					</tr> -->
					
					<!-- <tr>
						<td height="15" align="left" valign="bottom"></td>
						
					</tr> -->
					
					<tr>
					<td height="15" align="left" valign="top">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" class="12">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<%
										// 拿到此时用户
										Usr usr = (Usr)session.getAttribute("productuser");
										if(usr==null){  // 未注册用户
									%>
									<td width="40%">
										<div align="left">
											|&nbsp;&nbsp;欢迎,游客&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="./product/register.jsp"
												class="table_t">注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:history.go(-1)">&lt;&lt;&lt; 返回</a>
										</div>
									</td>
									
									<td width="20%">
										<div align="center">&nbsp;</div>
									</td>
									<td width="15%">
										<div align="center">&nbsp;</div>
									</td>
									<td width="15%">
										<div align="center">
											<a href="./product?a=all">继续购物</a>
										</div>
									</td>
									<td width="15%">
										<div align="center">
											<a href="./shopcart?a=checkout">结算中心</a>
										</div>
									</td>
									
									<%
										}else{   // 注册用户
									%>
									<td width="40%">
										<div align="left">
											|&nbsp;&nbsp;欢迎,<%=usr.getUsername()%>&nbsp;|&nbsp;
											<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;|&nbsp;
											<a href="javascript:history.go(-1)">&lt;&lt;&lt; 返回</a>
										</div>
									</td>
									<td width="20%">
										<div align="center">
											&nbsp;
										</div>
									</td>
									<!-- 订单处理 -->
									<td>
										<div align="center">
											<a href="./order?a=all">查看订单</a>
										</div>
									</td>
									
									<td width="15%">
										<div align="center">
											<a href="./product?a=all">继续购物</a>
										</div>
									</td>
									
									<td width="15%">
										<div align="center">
											<a href="./shopcart?a=checkout">结算中心</a>
										</div>
									</td>
									<% } %>
								</tr>
							<tr>
								<td height="15" align="left" valign="bottom"></td>
							</tr>
							</table>
						
						
							<!-- 产品列表 -->
							<table width="100%" border="1" cellspacing="0" cellpadding="0"
								class="mars">
								<tr bgcolor="#fba661" height="30">
									<td>
										<div align="center">
											编号
										</div>
									</td>
									<td>
										<div align="center">
											名称
										</div>
									</td>
									<td>
										<div align="center">
											catalogno
										</div>
									</td>
									<td>
										<div align="center">
											库存
										</div>
									</td>
									<td>
										<div align="center">
											质量
										</div>
									</td>
									<td>
										<div align="center">
											删除
										</div>
									</td>
								</tr>

								<%
									Collection<CartItem> list = (Collection<CartItem>) session.getAttribute("shopcartlist");
									for(CartItem item : list){
										Product pu = item.getProduct(); // 获取集合中的产品
										int id = pu.getId();    // 获取产品号
										String num = item.getQuantity() + "";  // 产品质量 数量
								%>
								<tr bgcolor="#f3f3f3" height="25">
									<td width="10%">
										<div align="center"><%=pu.getProductnumber()%></div>
									</td>
									<td width="13%">
										<div align="center"><%=pu.getProductname()%></div>
									</td>
									<td width="12%">
										<div align="center"><%=pu.getCategoryno()%></div>
									</td>
									<td width="13%">
										<div align="center"><%=pu.getRealstock()%></div>
									</td>
									<%
										if (num == null || num.equals("")) {
									%>
									<td width="13%">
										<div align="center">
											<input name="number" value="5g"
												onchange="updateQuantity(this,<%=id%>)" />
										</div>
									</td>
									<%
										} else {
									%>
									<td width="13%">
										<div align="center">
											 <input name="number" value="<%=num%>"
												onchange="updateQuantity(this,<%=id%>)" />
												<%-- <input name="number" value="<%=num%>"
												onpropertychange="updateQuantity(this,<%=id%>)"
												oninput="updateQuantity(this,<%=id%>)" /> --%>
										</div>
									</td>
									<%
										}
									%>
									<td width="13%">
										<div align="center">
											<a href="./shopcart?a=move&pid=<%=id%>">删除</a>
										</div>
									</td>
								</tr>
								<%
									}
								%>


							</table>
						
			
						
						
						
						</td>
					</tr>
					
				</table>
			</div>
			
			<div id="footer">
				<p>
					<a href="http://www.socwall.com" >版权所有：北京亚思晟商务科技有限公司
						&copy;2004-2008|京ICP备05005681</a>
				</p>
			</div>
			
			
		</div>
	
	</body>
	
</html>