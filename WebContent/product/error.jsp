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
			
			<div id="content2" style="background-image:url('./images/error2.png');
					background-size:100% 120%;">
				<table width="100%" height="370" border="0" align="center"
					cellpadding="0" cellspacing="0">

					
					
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
									<td width="60%">
										<div align="left">
											|&nbsp;欢迎,游客&nbsp;|&nbsp;
											<a href="./product/register.jsp"
												class="table_t">注册</a>&nbsp;|&nbsp;
											已注册用户请&nbsp;<a href="./index.jsp" class="table_t">登录</a>&nbsp;|&nbsp;
											<a href="javascript:history.go(-1)">&lt;&lt;&lt; 返回上一级</a>
										</div>
									</td>
									
									<td width="20%">
										<div align="center">&nbsp;</div>
									</td>
									<td width="15%">
										<div align="center">&nbsp;</div>
									</td>
									
									
									
									<%
										}else{   // 注册用户
									%>
									<td width="40%">
										<div align="left">
											|&nbsp;&nbsp;欢迎,<%=usr.getUsername()%>&nbsp;|&nbsp;
											<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;|&nbsp;
											<a href="javascript:history.go(-1)">&lt;&lt;&lt; 返回上一级</a>
										</div>
									</td>
									<td width="20%">
										<div align="center">
											&nbsp;
										</div>
									</td>
								
									<% } %>
								</tr>
							<tr>
								<td height="15" align="left" valign="bottom"></td>
							</tr>
							</table>
						
						
						<center>
							<h3><font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;出了点小错误。。。！！！</font></h3>
							<!-- <a href="./index.jsp">
								<img src="./images/error.jpg"/>
							</a> -->
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<h4><a href="./index.jsp"><font color="blue">&lt;&lt;&lt;返回首页</font></a></h4>
						</center>
			
						
						
						
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