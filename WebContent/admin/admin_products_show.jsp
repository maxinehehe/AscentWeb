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
	<form name="form" method="post" action="">
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
							<td height="4" colspan="2" align="left" valign="bottom"></td>
						</tr>
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
												我的位置&gt;&gt;电子商务管理&gt;商品列表
											</div>
											<br />
											<%
												Usr p = (Usr) session.getAttribute("productuser");
												if ((p != null && p.getSuperuser().equals("3"))||p != null && p.getSuperuser().equals("2")) {
											%>
											<table width="100%">
												<tbody>
													<tr>
														<td height="20" width="30%">
															<div class="table_t">
																|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
																<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
															</div>
														</td>
														<td width="70%">
															<div>
																<a href="./user?a=all"><img src="./images/userlist.jpg" border="0" />
																</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<a href="./product?a=all"><img src="./images/productslist.jpg" border="0" />
																</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<a href="./order?a=all"><img src="./images/ShowOrders.jpg" border="0" />
																</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<a href="./admin/add_products_admin.jsp"><img src="./images/addProduct.jpg" border="0" />
																</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</div>
														</td>
													</tr>
													<!-- 产品列表 -->
												</tbody>
											</table>
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
														<td>
															<div align="center">
																修改
															</div>
														</td>
														<td>
															<div align="center">
																删除
															</div>
														</td>
													</tr>
													<%
														List<Product> list = (List<Product>) request.getAttribute("productlist");
															for (Product pu : list) {
																int id = pu.getId();
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
															if (pu.getImagepath() == null
																			|| pu.getImagepath().equals("")) {
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
														<td>
															<div align="center">
																<a
																	href="./product?a=updateProduct&pid=<%=id%>"><img
																		src="./images/update1.gif"
																		width="20" height="20" border="0" alt="修改" />
																</a>
															</div>
														</td>
														<td>
															<div align="center">
																<a
																	href="./product?a=del&pid=<%=id%>"
																	onclick="return confirm_oper();"><img
																		src="./images/sz_tu02.gif"
																		border="0" alt="删除" />
																</a>
															</div>
														</td>
													</tr>
													<%
														}
													%>
												</tbody>
											</table>
											<%
												} else { //最上面的if的else
											%>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<center>
												<h3>
													对不起，您没有权限查看！！！
												</h3>
											</center>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
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
				
			</div>  <!-- content2 -->
			<div id="footer">
				<p>
					<a href="http://www.socwall.com" >版权所有：北京亚思晟商务科技有限公司
						&copy;2004-2008|京ICP备05005681</a>
				</p>
			</div>
		</div>
		</form>
	</body>
</html>
