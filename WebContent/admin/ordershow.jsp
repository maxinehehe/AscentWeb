<%@ page language="java" import="java.util.*,com.ascent.bean.*"
	contentType="text/html;charset=UTF-8" errorPage="./error.jsp"%>
<!-- 非管理员查看订单 -->
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
					<!-- <tr>
						<td width="15" height="18" align="left" valign="top">
							<div align="left"></div>
						</td>
						<td width="385" align="left" valign="bottom" class="12">
							&nbsp;
						</td>
					</tr> -->
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


										<table cellspacing="0" cellpadding="0" width="100%" border="0">
											<tbody>
												<tr>
													<%
														Usr p = (Usr)session.getAttribute("productuser");
														if(p!=null&&p.getSuperuser().equals("3")){  //管理员
													%>
															<td>
																<div align="left">
																	|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;
																	<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="./product?a=all"><img src="./images/productslist.jpg" width="75" height="17" border="0"/></a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="./order?a=all">订单管理</a>
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
													<%
														} else if(p!=null&&p.getSuperuser().equals("1")){  //注册用户
													%>
															<td>
																<div align="left">
																	|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;
																	<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="./order?a=all">查看订单</a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="./product?a=all">继续购物</a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="./product/checkout.jsp">结算中心</a>
																</div>
															</td>
													<%
														} else if(p==null){  //未注册用户
													%>
															<td>
																<div align="left">
																	|&nbsp;&nbsp;欢迎,游客&nbsp;&nbsp;|&nbsp;&nbsp;
																	<a href="./product/register.jsp" class="table_t">注册</a>&nbsp;&nbsp;|
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="./product?a=all">继续购物</a>
																</div>
															</td>
															<td>
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
											List orderList = (List)session.getAttribute("orderlist");
											if(orderList==null||orderList.size()<1){
										%>
												<center><br/><h3><font color="red">对不起，您还没有订单！</font></h3></center>
										<%
											} else { 
										%>
												<table class="mars" cellspacing="1" cellpadding="0"
													width="100%" border="0">
													<tbody>
														<tr bgcolor="#fba661">
															<td>
																<div align="center">
																	编号
																</div>
															</td>
															<td>
																<div align="center">
																	查看
																</div>
															</td>
														</tr>
														<%
															Iterator its= orderList.iterator();
														    while(its.hasNext()){
															    Orders pu = new Orders();
															    pu= (Orders)its.next();
															    int orderid= pu.getId();
													    %>
																<tr>
																	<td bgcolor="#f3f3f3">
																		<div align="center">
																			<%=orderid%>
																		</div>
																	</td>
																	<td bgcolor="#f3f3f3">
																		<div align="center">
																			<a href="./order?a=finditem&oid=<%=orderid %>" >查看</a>
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
										<br />
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
		<!-- </form> -->
	</body>
</html>
