<%@ page language="java" import="com.ascent.bean.Usr" contentType="text/html; charset=utf-8" errorPage="./error.jsp"%>

<% 
	String path = request.getContextPath(); // 拿到路径
	String basePath = request.getScheme() +"://"
		+ request.getServerName() +":"+request.getServerPort()
		+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<script src="sweetalert-master/dist/sweetalert.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="sweetalert-master/dist/sweetalert.css">
	
		<base href="<%=basePath %>">
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<meta name="description" content="your website's description"/>
		<meta name="keywords" content="your,keywords,goes,here" />
		<link rel="stylesheet" id="styles" href="./css/andreas08(blue).css"
				type="text/css" media="screen,projection" />
		<script charset="utf-8" type="text/javascript" src="./js/functions.js">
		</script>
	</head>
	<body onload="getCookie()">
		<div id="container"> <!-- 定义容器 -->
			<div id="header"> <!-- 盒子头部 -->
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
			</div> <!-- 盒子头部 end:navigation -->
			
			<div id="content"> <!-- 定义页面内容体 -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr> <!-- 开一行 -->
						<td>  <!-- 开一列【在一行中】 -->
							我的位置&gt;&gt;医药商务管理
						</td>
					</tr>
					<tr>
						<td>
							<!-- 加阴影 noshade -->
							<hr noshade="noshade" />  
						</td>
					</tr>
					
					<tr>
						<td>
							商品信息
						</td>
					</tr>
				</table>
				<br />
				<div class="md_wenzi">
					astaTech， Inc.提供全世界配药，生物科技和agroche mical药物研究&amp;发展的先进和新颖的中间体。
					我们的编目是最新与1500年药物象产品。 超过五十种新的化合物每个月增加到产品名单。我们先进的中间体的宽广的类型，
					包括积木，新颖的胺物、被保护的胺物、不自然的氨基酸、酮、醋醛、heterocycles、isatoic酐、boroinc酸和手性
					的中间体可能加速您的药物研究过程。AstaTech也提供半大块中间体(10公斤)，大块中间体(对吨)，使原材料和他们的
					中间体服麻醉剂进入合理的价格和优良品质。 请参观
					<a href="./product?a=all">浏览产品</a>。
					<br/>
					编目可以在网上被观看或者由
					<a href="./product/Product_Search.jsp">查询产品浏览产品</a>
					或您喜欢电子上接受我们的编目的(以PDF或SD格式)，请电子邮件我们.
				</div>
				<p> &nbsp;</p>
				
			</div>  <!-- 定义页面内容体 -->
			
			<div id="subcontent"> <!-- 定义第二内容体 -->
				<form name="form" method="post" action= "./loginServlet?a=login">
					<!--如果已经登录则在次显示登录状态  -->
					<div class="small box">
						<%
							Usr usr = (Usr)session.getAttribute("productuser"); 
							String islogin = (String)session.getAttribute("islogin");
							
							if(usr==null){   // 请进行注册
						%>
						
						<%if(islogin!=null&&islogin.equals("false")){ %>
							
							<script language="javascript">
								//swal("恭喜您", "您已注册成功", "success");
								sweetAlert("警告", "用户名或密码错误!", "warning");
							</script>
						
						<%} %>
						
						<!-- start:装有用户状态的容器表 -->
					<table width="150" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="30%" colspan="2" valign="middle">
							<img src="./images/username.jpg" width="63" height="17"
							  align="bottom" />
							 <input name="username" type="text" size="7" />
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="middle">
								<img src="./images/password.jpg" width="63" height="17">
							<input name="password" type="password" size="7" />
							</td>
						</tr>
						
						<tr>
							<td height="30" valign="bottom">
								点击这里
								<a href="./product/register.jsp">注册</a>
							
							</td>
							<td align="left" valign="bottom">
								<a href="#"> <input name="image" type="image"
									onclick="return checkLogin(form);" 
									src="./images/login_1_7.jpg" alt="登录" width="44" height="17"/></a>
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="bottom">&nbsp;</td>
						</tr>
					</table>
					<!-- end:装有用户状态的容器表 -->
					<%}else{ %>
					<table width="150" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="30%" colspan="2" valign="middle">
								欢迎您，<%=usr.getUsername() %>
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="middle">
								邮箱：<%=usr.getEmail()  %>
							</td>
						</tr>
						<tr>
							<td height="30" valign="bottom">
								<span class="big_k">
									<a href="./loginServlet?a=out">注销</a>
								</span>
							</td>
							<%
								if(usr.getSuperuser().equals("3")&&"0".equals(usr.getDelsoft().trim()) ||usr.getSuperuser().equals("2")&&"0".equals(usr.getDelsoft().trim()) ){
									session.setAttribute("super3", usr.getSuperuser());
									session.setAttribute("username3", usr.getUsername());
									session.setAttribute("delsoft3", usr.getDelsoft());
									
							%>
							<td align="left" valign="bottom">
								<span class="managerUsers">
								<a href="./loginServlet?a=managerUsers">管理用户</a>
								</span>
							</td>
							<%
								}
					}
							%>
						</tr>
						<tr>
							<td colspan="2" valign="bottom">&nbsp;</td>
						</tr>
					</table>
					</div>
				</form>
				<h2>
					<ul class="menublock">
						<li>
							<a href="#">项目实战精解</a>
							<a href="#"><img src="./images/buy.gif"
								width="20" height="16" border="0"/>
								</a>
						</li>
						<li>
						<a href="#">java核心技术</a><a href="#"><img
								src="./images/buy.gif" width="20" height="16" border="0" />
						</a>
					</li>
					</ul>
				</h2>
			</div>  <!-- 定义第二内容体 -->
			
			<div id="footer"> <!-- 定义最底部栏足 -->
				<p>
					<a href="http://www.socwall.com" >版权所有：北京亚思晟商务科技有限公司
						&copy;2004-2008|京ICP备05005681</a><a href="#"></a>
				</p>
			</div>  <!-- 结束最底部栏足 -->
			
		</div><!--定义容器  -->
		
	</body>
</html>
