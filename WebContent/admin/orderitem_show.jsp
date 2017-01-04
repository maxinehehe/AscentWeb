<%@ page language="java" import="java.util.*,com.ascent.bean.*"
	contentType="text/html;charset=UTF-8" errorPage="./error.jsp"%>
<!-- 查看订单详细 -->
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
	<!-- <form name="form" method="post" action="./product?a=search"> -->
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
							<table width="100%" height="10" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="20">
										<div class="right_proaducts">
											我的位置&gt;&gt;电子商务管理&gt;订单&gt;订单查看
											<br />
											<br />
										</div>

										<table cellspacing="0" cellpadding="0" width="100%" border="0">
											<tbody>
												<tr>
													<%
														String orderid = (String) request.getAttribute("orderid");
														Usr p = (Usr) session.getAttribute("productuser");
														if ((p != null && p.getSuperuser().equals("3"))||p != null && p.getSuperuser().equals("2")) { //管理员
													%>
													<td width="40%">
														<div align="left">
															|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|
															<a href="./loginServlet?a=out" class="table_t">注销</a>|
															<a href="javascript:history.back()">&lt;&lt;&lt;返回</a>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./product?a=all"><img src="./images/productslist.jpg" width="75" height="17" border="0" />
															</a>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./order?a=all">订单管理</a>
														</div>
													</td>
													<td height="20">
														<div align="center">
															&nbsp;
														</div>
													</td>
													<%
														} else if (p != null && p.getSuperuser().equals("1")) { //注册用户
													%>
													<td width="40%">
														<div align="left">
															|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|
															<a href="./loginServlet?a=out" class="table_t">注销</a>|
															<a href="javascript:history.back()">&lt;&lt;&lt;返回</a>
														</div>
													</td>
													<td>
														<div align="center">
															&nbsp;
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./product/Product_Search.jsp">商品查询</a>
														</div>
													</td>
													<td>
														<div align="center">
															<a href="./order?a=all">订单管理</a>
														</div>
													</td>
													<td height="50">
														<div align="center">
															<a href="./shopcart?a=find">查看购物车</a>
														</div>
													</td>
													<%
														}
													%>
												</tr>
											</tbody>
										</table>

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
														MDLNumber
													</div>
												</td>
												<td>
													<div align="center">
														价格
													</div>
												</td>
												<td>
													<div align="center">
														库存
													</div>
												</td>
												<td>
													<div align="center">
														图片
													</div>
												</td>
												<%
													if (p != null && p.getSuperuser().equals("3")) {//管理员
												%>
												<td>
													<div align="center">
														删除
													</div>
												</td>
												<%
													}
												%>
											</tr>
											<%
												List<Product> list = (List<Product>) request.getAttribute("orderitemlist");
												for(Product pu : list){
													int pid = pu.getId();
													
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
													<div align="center"><%=pu.getMdint()%></div>
												</td>
												<td width="10%">
													<div align="center"><%=pu.getPrice1()%></div>
												</td>
												<td width="13%">
													<div align="center"><%=pu.getRealstock()%></div>
												</td>
												<%
													if (pu.getImagepath() == null || pu.getImagepath().equals("")) {
												%>
												<td width="12%">
													<div align="center">
														<img
															src="<%=path%>/images/<%=pu.getImagepath() %>"
															width="60" height="30" hspace="0" border="0" />
													</div>
												</td>
												<%
													} else {
												%>
												<td width="12%">
													<div align="center">
														<img
															src="<%=path%>/images/<%=pu.getImagepath() %>"
															width="60" height="30" hspace="0" border="0" />
													</div>
												</td>
												<%
													}
												%>
												<%
													if (p != null && p.getSuperuser().equals("3")) { //管理员
												%>
												<td>
													<div align="center">
														<a href="./order?a=delitem&pid=<%=pid%>&oid=<%=orderid%>">删除</a>
													</div>
												</td>
												<%
													}
												%>
											</tr>
											<%
												}
											%>
										</table>
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
		<!-- </form> -->
	</body>
</html>


