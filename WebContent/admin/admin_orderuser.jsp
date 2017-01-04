<%@ page language="java" import="java.util.*,com.ascent.bean.*"
	contentType="text/html;charset=UTF-8" errorPage="./error.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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

			<div id="content2">
				<table width="100%" height="41" border="0" align="center"
					cellpadding="0" cellspacing="0">
					
					
					<tr>
						<td height="15" align="left" valign="top">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" class="12">
							<table width="100%" height="20" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="20">
										<div class="right_proaducts">
											我的位置&gt;&gt;电子商务管理&gt;&gt;用户信息
										</div>
									</td>
								</tr>
							</table>
							<br />

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<%
										Usr p = (Usr) session.getAttribute("productuser");
										if (p != null && p.getSuperuser().equals("3")) { //管理员
									%>
									<td width="40%">
										<div align="left">
											|&nbsp;欢迎,<%=p.getUsername()%>&nbsp;|&nbsp;
											<a href="./loginServlet?a=out"
												class="table_t">注销</a>&nbsp;|&nbsp;
											<a href="javascript:history.back()">&lt;&lt;&lt;返回</a>
										</div>
									</td>
									<td width="20%">
										<div align="center">
											<a href="./product?a=all"><img
													src="./images/productslist.jpg"
													width="75" height="17" border="0" />
											</a>
										</div>
									</td>
									<td width="15%">
										<div align="center">
											<a href="./order?a=all">订单管理</a>
										</div>
									</td>
									<td width="15%">
										<div align="center">
											<a href="./product?a=all">继续购物</a>
										</div>
									</td>
									<td width="15%">
										<div align="center">
											<a href="./product/checkout.jsp">结算中心</a>
										</div>
									</td>
									<%
										}
									%>
								</tr>
							</table>
							<br>
							<br>
							<%
								Usr orderuser = (Usr) session.getAttribute("Orderuser");
								if (orderuser == null) {
							%>

							<center>
								<h3>
									没找到该用户
								</h3>
							</center>
							<%
								} else {
							%>
							<!-- 订单列表 -->
							<center>
								<table width="100%" border="1" cellspacing="0" cellpadding="0"
									class="mars">
									<tr bgcolor="#fba661" height="30">

										<td>
											<div align="center">
												用户ID
											</div>
										</td>
										<td>
											<div align="center">
												用户名称
											</div>
										</td>
										<td>
											<div align="center">
												用户电话
											</div>
										</td>
										<td>
											<div align="center">
												用户公司名称
											</div>
										</td>
										<td>
											<div align="center">
												用户公司地址
											</div>
										</td>
										<td>
											<div align="center">
												用户角色
											</div>
										</td>
										<td>
											<div align="center">
												Email
											</div>
										</td>
									</tr>
									<tr bgcolor="#e4f1fe">
										<td>
											<div align="center"><%=orderuser.getId()%></div>
										</td>
										<td>
											<div align="center"><%=orderuser.getUsername()%></div>
										</td>
										<td>
											<div align="center"><%=orderuser.getTel()%></div>
										</td>
										<td>
											<div align="center"><%=orderuser.getCompanyname()%></div>
										</td>
										<td>
											<div align="center"><%=orderuser.getCompanyaddress()%></div>
										</td>
										<td>
											<%
												String role = orderuser.getSuperuser();
												if (role.equals("1")){
											%>
											<div align="center">普通用户</div>
											<%}else if(role.equals("2")) {%>
											<div align="center">管理员</div>
											<%}else if(role.equals("3")){ %>
											<div align="center">超级管理员</div>
											<%} %>
										</td>
										<td>
											<div align="center"><%=orderuser.getEmail()%></div>
										</td>
									</tr>
								</table>
							</center>
							<%
							}
							%>
						</td>
					</tr>
				</table>
				<br />
				<div class="table_wz"></div>

			</div>
		
		
		
		
		
		  <!-- content2 -->
			<div id="footer">
				<p>
					<a href="http://www.socwall.com/" >版权所有：北京亚思晟商务科技有限公司
						&copy;2004-2008|京ICP备05005681</a>
				</p>
			</div>
		</div>
		
	</body>
</html>


