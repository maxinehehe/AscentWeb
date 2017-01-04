<%@ page language="java" import="com.ascent.bean.*,java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=gb2312" errorPage="./error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()  // 返回当前页面使用的协议，http 或是 https
				+"://"+request.getServerName()   // 获取网站的域名，如果是在本地的话就是localhost 
 				+":"+request.getServerPort()     // 使用的端口，比如8080或者80
 				+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>AscentWeb电子商务</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link id="styles" rel="stylesheet" href="./css/andreas08(blue).css" type="text/css" media="screen,projection" />
		<script type="text/javascript" src="./js/functions.js">
		</script>
	</head>

	<body onload="getCookie()">
		<form name="form" method="post" action="">
			<div id="container">

				<div id="header">

				</div>

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
						<li></li>
					</ul>
				</div>
				<%
					
					Usr p = (Usr) session.getAttribute("productuser");
					if (p != null && p.getSuperuser().equals("3")) {
						 
				%>
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
						</tr> 
						<tr>
							<td height="4" colspan="2" align="left" valign="bottom"></td>
						</tr>
								-->
						<tr>
							<td height="15" align="left" valign="top">
								&nbsp;
							</td>
							<td height="15" align="left" valign="top" class="12">
								<table width="100%" height="20" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="20">
											<div class="table_t">
												|&nbsp;&nbsp;欢迎,
												<%=p.getUsername()%>
												&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
											</div>
										</td>
										<td>
										<div>
										<a href="./user?a=all"><img src="./images/userlist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="./product?a=all"><img src="./images/productslist.jpg" border="0" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="./admin/mailmanager.jsp"><img src="./images/mailmanager.jpg" border="0" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									    </div>
										</td>
									</tr>
								</table>
								<br />
								
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="mars">
									<tr bgcolor="#fba661" height="25">
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												用户名
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												Email
											</div>
										</td>
										<td width="12%" bgcolor="#fba661">
											<div align="center">
												电话
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												公司名称
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												角色
											</div>
										</td>
										<td width="9%" bgcolor="#fba661">
											<div align="center">
												修改
											</div>
										</td>
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												角色修改
											</div>
										</td>
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												状态
											</div>
										</td>
									</tr>
									<%
											// 拿到用户集合 来自LoginServlet
											List<Usr> list = (List<Usr>) request.getAttribute("allproductUsrsList");
									// System.out.println("1.超级管理员");
											for(Usr pu : list){  // for 高级循环
												String state = pu.getSuperuser();
												String del = pu.getDelsoft();
									%>
												<tr bgcolor="#f3f3f3" height="25">
													<td width="10%">
														<div align="center">
															<%=pu.getUsername()%>
														</div>
													</td>
													<td width="13%">
														<div align="center">
															<%=pu.getEmail()%>
														</div>
													</td>
													<td width="12%">
														<div align="center">
															<%=pu.getTel()%>
														</div>
													</td>
													<td width="13%">
														<div align="center">
															<%=pu.getCompanyname()%>
														</div>
													</td>
													<%
														if (state.equals("3")) {   // 3为高级管理员
													%>
															<td width="13%">
																<div align="center">
																	高级管理员
																</div>
															</td>
													<%
														} else if(state.equals("2")){    // 2 为普通管理员
													%>	
															<td width="13%">
																<div align="center">
																	管理员
																</div>
															</td>
													<%
														} else if(state.equals("1")){     // 1 为普通用户
													%>			
															<td width="13%">
																<div align="center">
																	普通用户
																</div>
															</td>
													<%
														}
													%>
													<td width="9%">
														<div align="center">
															<a href="user?a=finduser&uid=<%=pu.getId()%>"><img src="./images/update1.gif"
																	width="20" height="20" border="0" alt="修改" />
															</a>
														</div>
													</td>
													<%
														if (state.equals("3")) {
													%>
															<td width="10%">
																<div align="center">
																	无操作
																</div>
															</td>
															<td>
																<div align="center">
																	无操作
																</div>
															</td>
													<%
														} else{
															if (del.trim().equals("1")) {
													%>
															<td width="10%">
																<div align="center">
																	<!-- 将用户Id 和 身份状态 【是否是管理员】 传递至新的页面进行更改 -->
																	<!-- 一方面可以进行ajax技术修改 相比于ajax传递至新的页面更容易且方便 -->
																	<a href="./admin/changesuperuser.jsp?uid=<%=pu.getId()%>&superuser=<%=state%>"><img src="./images/Changeuser.gif" width="20" height="20" border="0" alt="角色修改" />
																	</a>
																</div>
															</td>
														
															<td>
																<div align="center">
																	<a href="user?a=delsuser&uid=<%=pu.getId()%>&value=0" onclick="return confirm_oper();"><img src="./images/sz_tu02.gif" border="0" alt="恢复" />
																	</a>
																</div>
															</td>
													<%
															} else if(del.trim().equals("0")) {
													%>
															<td width="10%">
																<div align="center">
																	<a href="./admin/changesuperuser.jsp?uid=<%=pu.getId()%>&superuser=<%=state%>"><img src="./images/Changeuser.gif" width="20" height="20" border="0" alt="角色修改" />
																	</a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="user?a=delsuser&uid=<%=pu.getId()%>&value=1" onclick="return confirm_oper();"><img src="./images/sz_tu01.gif" border="0" alt="删除" />
																	</a>
																</div>
															</td>
													<%
														 	}
														 }
													%>
												</tr>
									<%
										}
									%>
								</table>
								<table width="100%" height="100" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td valign="top" class="12">
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div> <!-- 结束content2 -->
					
				<%
					}else if(p != null && "2".equals(p.getSuperuser())){   // 开始循环普通管理员
						
				%>
				<div id="content2">
					<table width="100%" height="41" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td width="15" height="18" align="left" valign="top">
								<div align="left"></div>
							</td>
							<td width="385" align="left" valign="bottom" class="12">
								&nbsp;
							</td>
						</tr>
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
											<div class="table_t">
												|&nbsp;&nbsp;欢迎,
												<%=p.getUsername()%>
												&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="./login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
											</div>
										</td>
										<td>
										<div>
										<a href="./user?a=all"><img src="./images/userlist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="./product?a=all"><img src="./images/productslist.jpg" border="0" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="./product/mailmanager.jsp"><img src="./images/mailmanager.jpg" border="0" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									    </div>
										</td>
									</tr>
								</table>
								<br />
								
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="mars">
									<tr bgcolor="#fba661" height="25">
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												用户名
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												Email
											</div>
										</td>
										<td width="12%" bgcolor="#fba661">
											<div align="center">
												电话
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												公司名称
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												角色
											</div>
										</td>
										<td width="9%" bgcolor="#fba661">
											<div align="center">
												修改
											</div>
										</td>
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												状态
											</div>
										</td>
									</tr>
									<%
											
											List<Usr> list = (List<Usr>) request.getAttribute("allproductUsrsList");
									System.out.println("2.普通管理员");
											for(Usr pu : list){
												String state = pu.getSuperuser();
												String del = pu.getDelsoft();
									%>
												<tr bgcolor="#f3f3f3" height="25">
													<td width="10%">
														<div align="center">
															<%=pu.getUsername()%>
														</div>
													</td>
													<td width="13%">
														<div align="center">
															<%=pu.getEmail()%>
														</div>
													</td>
													<td width="12%">
														<div align="center">
															<%=pu.getTel()%>
														</div>
													</td>
													<td width="13%">
														<div align="center">
															<%=pu.getCompanyname()%>
														</div>
													</td>
													<%
														if (state.equals("3")) {
													%>
															<td width="13%">
																<div align="center">
																	高级管理员
																</div>
															</td>
													<%
														} else if(state.equals("2")){
													%>	
															<td width="13%">
																<div align="center">
																	管理员
																</div>
															</td>
													<%
														} else if(state.equals("1")){
													%>			
															<td width="13%">
																<div align="center">
																	普通用户
																</div>
															</td>
													<%
													}
													%>
													<%if(!state.equals("3")){ %>
														<td width="9%">
															<div align="center">
																<a href="user?a=finduser&uid=<%=pu.getId()%>"><img src="./images/update1.gif"
																		width="20" height="20" border="0" alt="修改" />
																</a>
															</div>
														</td>
													<%}else{ %>
														<td width="9%">
															<div align="center">
																无操作
															</div>
														</td>
													<% }%>
													<%
														if (!state.equals("3")&&del.trim().equals("1")) {
													%>
															<td>
																<div align="center">
																	<a href="user?a=delsuser&uid=<%=pu.getId()%>&value=0" onclick="return confirm_oper();"><img src="./images/sz_tu02.gif" border="0" alt="恢复" />
																	</a>
																</div>
															</td>
													<%
														} else if(!state.equals("3")&&del.trim().equals("0")) {
													%>
															<td>
																<div align="center">
																	<a href="user?a=delsuser&uid=<%=pu.getId()%>&value=1" onclick="return confirm_oper();"><img src="./images/sz_tu01.gif" border="0" alt="删除" />
																	</a>
																</div>
															</td>
													<%
														}else{
													%>
														<td width="9%">
															<div align="center">
																无操作
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
								<table width="100%" height="100" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td valign="top" class="12">
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				
				<%
					} else {//最上面的if的else 
				%>
						<center>
							<h3>
								
								<% System.out.println("普通用户无法查看！"); %>
							</h3>
						</center>
				<%
					}
				%>
				
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
