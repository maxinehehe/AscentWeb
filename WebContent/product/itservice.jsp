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
			<title>AscentWeb��������</title>
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
						<a href="./index.jsp">��ҳ</a>
					</li>
					<li>
						<a href="./product/itservice.jsp">IT����</a>
					</li>
					<li>
						<a href="./product/products.jsp">��������ϵͳ</a>
					</li>
					<li>
						<a href="./product/employee.jsp">Ա����Ƹ</a>
					</li>
					<li>
						<a href="./product/ContactUs.jsp">��������</a>
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
										��˼�ɿƼ���Ascent
										Technologies����˾�����ɺ�����ITרҵ������ʿ���йش���ѧ������ҵ԰���������ƾ����׿Խ�ļ���ˮƽ������ḻ�Ĺ����Ŷӣ�ǿ�����Դ���������Ͷ�������ڶ���ҵ�����۵ķḻ���飬��˼�ɿƼ��춨�˹�˾�ڱ��غͺ���IT�����г������Ƶ�λ������˿ͻ���һ���Ͽɺͺ���������ͻ������˳��ڵ�ս�Ժ�������ϵ��
										<p>
											��˼���������й�IT����ʵ���ص㣬���ù����Ƚ�����ļ����;��飬�ṩ�߶����ʵ�IT���񣬰�������߶���ѵ�����������ά�����������������Ʒ�з��ͱ��ػ��ȡ�
										</p>
										<table width="600" border="0" cellspacing="8" cellpadding="0">

											<tr>
												<td colspan="5">
													<span class="style2">��˼���ṩ��IT���񸲸���������</span>
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
																	target="_blank" class="i">IT��ѵ����</a> </font> </font> </span>
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
																	target="_blank" class="i">����������</a> </font> </font> </strong>
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
															target="_blank" class="i">�����������</a> </strong>
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
					<a href="http://www.socwall.com" >��Ȩ���У�������˼������Ƽ����޹�˾
						&copy;2004-2008|��ICP��05005681</a>
				</p>
			</div>
		</div>
	</body>

</html>
