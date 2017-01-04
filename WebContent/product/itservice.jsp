<%@ page language="java" import="java.util.*,com.ascent.bean.*"
	contentType="text/html;charset=gb2312" errorPage="./error.jsp"%>
<%
	String path = request.getContextPath(); 
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head >
	
		<base href="<%=basePath%>">
			<title>AscentWeb电子商务</title>
			<!-- "./css/andreas08(blue).css" -->
			<link rel="stylesheet" id="styles" href="./css/andreas08(blue).css" 
				type="text/css" media="screen,projection" />
			<script type="text/javascript" src="./js/functions.js">
</script>
	</head>

	<body onload="getCookie()">
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
							<table width="100%" height="100" border="0" cellpadding="0"
								cellspacing="0">

								<tr>
									<td valign="top" class="12">
										亚思晟科技（Ascent
										Technologies）公司，是由海外归国IT专业技术人士在中关村留学生海淀创业园创办成立。凭借着卓越的技术水平、经验丰富的管理团队，强大的资源整合能力和多年服务众多企业所积累的丰富经验，亚思晟科技奠定了公司在本地和海外IT服务市场的优势地位，获得了客户的一致认可和好评，并与客户建立了长期的战略合作伙伴关系。
										<p>
											亚思晟立足于中国IT的现实和特点，利用国际先进成熟的技术和经验，提供高端优质的IT服务，包括软件高端培训、软件开发及维护、软件外包、软件产品研发和本地化等。
										</p>
										<table width="600" border="0" cellspacing="8" cellpadding="0">

											<tr>
												<td colspan="5">
													<span class="style2">亚思晟提供的IT服务覆盖以下领域：</span>
												</td>
											</tr>
											<tr>
												<td>
													<a href="http://www.ascenttech.com.cn/itpxunfw.htm"
														target="_blank"><img src="./images/pic1.jpg"
															width="150" height="103" border="0" /> </a>
												</td>
												<td>
													&nbsp;
												</td>
												<td>
													<a
														href="http://www.ascenttech.com.cn/ruanjianwaibaofuwu.htm"
														target="_blank"><img src="./images/pic2.jpg"
															width="150" height="103" border="0" /> </a>
												</td>
												<td>
													&nbsp;
												</td>
												<td>
													<a
														href="http://www.ascenttech.com.cn/ruanjianjishufuwu.htm"
														target="_blank"><img src="./images/pic3.jpg"
															width="150" height="103" border="0" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<div align="left" class="style3">
														<span class="shang"><font class="i"><font
																class="biaoti"><a
																	href="http://www.ascenttech.com.cn/itpxunfw.htm"
																	target="_blank" class="i">IT培训服务</a> </font> </font> </span>
													</div>
												</td>
												<td>
													<div align="left">
														<span class="style4"></span>
													</div>
												</td>
												<td>
													<div align="left" class="style4">
														<strong><font class="i"><font
																class="biaoti"><a
																	href="http://www.ascenttech.com.cn/ruanjianwaibaofuwu.htm"
																	target="_blank" class="i">软件外包服务</a> </font> </font> </strong>
													</div>
												</td>
												<td>
													<div align="left">
														<span class="style4"></span>
													</div>
												</td>
												<td>
													<div align="left" class="style4">
														<strong><a
															href="http://www.ascenttech.com.cn/ruanjianjishufuwu.htm"
															target="_blank" class="i">软件技术服务</a> </strong>
													</div>
												</td>
											</tr>
										</table>
										<p>
											&nbsp;
										</p>
									</td>
								</tr>
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
