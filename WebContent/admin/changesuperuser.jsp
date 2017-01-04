<%@ page language="java" import="com.ascent.bean.*" pageEncoding="UTF-8" errorPage="./error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>AscentWeb电子商务</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="./css/andreas08(blue).css"
			type="text/css" media="screen,projection" />
		<script charset="utf-8" type="text/javascript" src="./js/functions.js">
		</script>
	</head>
	<body onload="getCookie()">
		<form name="form" action="./user?a=updatesuper" method="post">
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
												我的位置&gt;&gt;电子商务管理&gt;&gt;用户修改
												
											</div>
										</td>
									</tr>
								</table>
								<br />
								<table width="680" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td bgcolor="#467AA7" colspan="2" height="5"></td>
										</tr>
										<tr>
											<td colspan="2" height="7"></td>
										</tr>
										<tr>
											<td width="110" height="20" bgcolor="#bbddff" class="table_c">
												修改权限
											</td>
											<td width="439" bgcolor="#ffffff">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<!-- <a href="#" onclick="window.history.back(); return false;"> --><a href="javascript:history.back()"> &lt;&lt;&lt; 返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</tbody>
								</table>
								<div class="table_wz">

									<table width="680" height="260" border="0" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td colspan="2" height="5">
													<%
														// 拿到由products_showusers.jsp界面传递来的用户id 和 superuser
														String uidd = request.getParameter("uid");
														String superuser = request.getParameter("superuser");
													%>
												
													<%
														// 获取此时用户的状态 看是否 是具有更改的权限【是否是管理员】
														Usr p = (Usr) session.getAttribute("productuser");
														if ((p != null && p.getSuperuser().equals("3"))||(p != null && p.getSuperuser().equals("2"))) {
													%>

													<%
															if ("1".equals(superuser)) {
													%>
																<INPUT type="radio" name="superuser" value="1" checked="checked">
													<%
															} else {
													%>
																<INPUT type="radio" name="superuser" value="1">
													<%
															}
													%>&nbsp;&nbsp;普通注册用户
													<br />
													<%
															if ("2".equals(superuser)) {
													%>
																<INPUT type="radio" name="superuser" value="2" checked="checked">
													<%
															} else {
													%>
																<INPUT type="radio" name="superuser" value="2">
													<%
															}
													%>&nbsp;&nbsp;管理员
													<br>
													<input type="hidden" name="uid" value="<%=uidd%>" />

													<P>
														&nbsp;
													</P>
													<P>
														&nbsp;&nbsp; &nbsp;
														<INPUT type="submit" name="submit" value="修改">
														&nbsp;
													</P>
													<P>
														&nbsp;
													</P>
													<P>
														&nbsp;
													</P>


													<%
														} else //最上面的if的else
														{
													%>
													<br>
													<br>
													<br>
													<br>
													<br>
													<br />
													<center>
														<h3>
															对不起，您没有权限查看！！！
														</h3>
													</center>

													<%
														}
													%>

												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>

						</tr>
					</table>
					<br />
					<div class="table_wz"></div>

				</div>
				<div id="footer">
					<p>
						<a href="http://www.socwall.com" >版权所有:北京亚思晟商务科技有限公司
							&copy;2004-2008|京ICP备05005681</a>
					</p>
				</div>
			</div>
		</form>
	</body>
</html>
