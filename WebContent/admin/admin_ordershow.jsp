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
						
						<td height="15" align="left" valign="top" class="12">
							<table width="100%" height="20" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="20">
										<div class="right_proaducts">
											我的位置&gt;&gt;电子商务管理&gt;订单
											<br />
											<br />
										</div>
										<%
											Usr p = (Usr) session.getAttribute("productuser");
										%>
										<table cellspacing="0" cellpadding="0" width="100%" border="0">
											<tbody>
												<tr>
													<%
														if (p != null && p.getSuperuser().equals("3")) { //管理员
													%>
													<td width="40%">
														<div align="left">
															|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
															<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
															<a href="javascript:history.back()"><<< 返回</a>
														</div>
													</td>
													<td width="19%">
														<div align="center">
															<a href="./product?a=all"> <img
																	src="./images/productslist.jpg" width="75" height="17"
																	border="0" /> </a>
														</div>
													</td>
													<td width="16%">
														<div align="center">
															<a href="./order?a=all">订单管理</a>
														</div>
													</td>
													<td width="16%">
														<div align="center">
															&nbsp;
														</div>
													</td>
													<td width="16%" height="50">
														<div align="center">
															&nbsp;
														</div>
													</td>
													<%
														} else if (p != null && p.getSuperuser().equals("1")) { //注册用户
													%>
													<td width="33%">
														<div align="left">
															|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
															<a href="./login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
														</div>
													</td>
													<td width="19%">
														<div align="center">
															&nbsp;
														</div>
													</td>
													<td width="16%">
														<div align="center">
															<a href="./order?a=all">订单管理</a>
														</div>
													</td>
													<td width="16%">
														<div align="center">
															<a href="./product?a=all">继续购物</a>
														</div>
													</td>
													<td width="16%" height="50">
														<div align="center">
															<a href="./product/checkout.jsp">结算中心</a>
														</div>
													</td>
													<%
														} else if (p == null) { //非注册用户
													%>
													<td width="33%">
														<div align="left">
															|&nbsp;&nbsp;欢迎,游客&nbsp;&nbsp;|&nbsp;&nbsp;
															<a href="./product/register.jsp" class="table_t">注册</a>&nbsp;&nbsp;|
														</div>
													</td>
													<td width="19%">
														<div align="center">
															&nbsp;
														</div>
													</td>
													<td width="16%">
														<div align="center">
															&nbsp;
														</div>
													</td>
													<td width="16%">
														<div align="center">
															<a href="./product?a=all">继续购物</a>
														</div>
													</td>
													<td width="16%" height="50">
														<div align="center">
															<a href="./product/checkout.jsp">结算中心</a>
														</div>
													</td>
													<%
														}
													%>
												</tr>
											</tbody>
										</table>
										<%
											List<Orders> adminorderList = (List<Orders>) request.getAttribute("orderlist");
											if (adminorderList == null || adminorderList.size() < 1) {
										%>
										<center>
											<h3>
												系统暂时没有订单！
											</h3>
										</center>
										<%
											} else {
										%>
										<table class="mars" cellspacing="1" cellpadding="0"
											width="100%" border="0">
											<tbody>
												<tr bgcolor="#fba661" height="30">
													<td>
														<div align="center">
															编号
														</div>
													</td>
													<td>
														<div align="center">
															用户ID
														</div>
													</td>
													<td>
														<div align="center">
															查看
														</div>
													</td>
													<td>
														<div align="center">
															删除
														</div>
													</td>
												</tr>
												<%
													for (Orders od : adminorderList) {
															int orderid = od.getId();
												%>
												<tr bgcolor="#f3f3f3">
													<td>
														<div align="center">
															<%=orderid%>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./order?a=lookuse&uid=<%=od.getUsrid()%>"><%=od.getUsrid()%></a>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./order?a=finditem&oid=<%=orderid%>">查看</a>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./order?a=delorder&oid=<%=orderid%>">删除</a>
														</div>
													</td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
										<%
											}
										%>
									</td>
								</tr>
							</table>
							<br />
							<div class="table_wz"></div>
						</td>
					</tr>
				</table>
			</div>
		
		
		
		
		
		  <!-- content2 -->
			<div id="footer">
				<p>
					<a href="http://www.socwall.com" >版权所有：北京亚思晟商务科技有限公司
						&copy;2004-2008|京ICP备05005681</a>
				</p>
			</div>
		</div>
		
	</body>
</html>












	