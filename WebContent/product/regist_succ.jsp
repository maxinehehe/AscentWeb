<%@ page language="java" contentType="text/html;charset=uTF-8"
	errorPage="../error.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<script src="sweetalert-master/dist/sweetalert.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="sweetalert-master/dist/sweetalert.css">

<base href="<%=basePath%>">
<title>AscentWeb电子商务</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" id="styles" href="./css/andreas08(blue).css"
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
					<li><a href="./index.jsp">首页</a></li>
					<li><a href="./product/itservice.jsp">IT服务</a></li>
					<li><a href="./product/products.jsp">电子商务系统</a></li>
					<li><a href="./product/employee.jsp">员工招聘</a></li>
					<li><a href="./product/ContactUs.jsp">关于我们</a></li>
				</ul>
			</div>
			<%
				String username = (String) request.getAttribute("username");
			//System.out.println("username:jsp:"+username);
			%>
			
			<script language="javascript">
						
						swal("恭喜您", "您已注册成功", "success");
					
			</script>

			<div id="content2">
				<table width="100%" height="41" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="15" height="18" align="left" valign="top"><div
								align="left"></div></td>
						<td width="385" align="left" valign="bottom" class="12">&nbsp;</td>
					</tr>
					<tr>
						<td height="4" colspan="2" align="left" valign="bottom"></td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top">&nbsp;</td>
						<td height="15" align="left" valign="top" class="12">
							<table width="100%" height="20" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="20"><div class="right_proaducts">
											我的位置&gt;&gt;电子商务&gt;注册用户 <br />
										</div>
							</table>
							<table class="mars" cellspacing="1" cellpadding="0" width="100%"
								border="0">
								<tbody>


									<%
										int flag = (Integer) request.getAttribute("flag");
										/*  System.out.println("flag:"+flag); */
										if (flag == 1) {
									%>
									<tr>
										<td height="82" colspan="2" class="table_hui">
										<!-- 恭喜您注册成功了 -->
											<div align="center" class="STYLE1" style="color: #00F"><font color="green"><%=username %></font>,欢迎加入我们</div>
										</td>
									</tr>
									<%
										} else {
									%>
									<tr>
										<td height="82" colspan="2" class="table_hui">
											<div align="center" class="STYLE1" style="color: #F00">注册失败！</div>
										</td>
									</tr>
									<%
										}
									%>

									<tr>
										<td height="20" colspan="2"><div class="table_t"
												id="result_box" dir="ltr">
												<div align="center">
													<a href="./product/products.jsp">返回登录</a>
												</div>
											</div></td>
									</tr>
									<tr>
										<td width="158" height="20"></td>
										<td width="282" class="table_t">&nbsp;</td>
									</tr>
									<tr>
										<td width="158" height="20" class="table_hui_x">&nbsp;</td>
										<td width="282">&nbsp;</td>
									</tr>
									<tr>
										<td width="158" height="20" class="table_hui_x">&nbsp;</td>
										<td width="282">&nbsp;</td>
									</tr>



								</tbody>
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
	</form>
</body>
</html>

