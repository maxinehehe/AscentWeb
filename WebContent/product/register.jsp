<%@ page language="java" contentType="text/html;charset=utf-8" errorPage="./error.jsp"%>
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
		<title>注册页面</title>
		<meta http-equiv="Content-Type" content="text/html; charsetutf-8" />
		<link id="styles" rel="stylesheet" href="./css/andreas08(blue).css"
			type="text/css" media="screen,projection" />
		<style type="text/css">
/* 页面字体样式 */
body,td,input {
	font-family: Arial;
	font-size: 12px;
}

/* 表格基本样式 */
table.default {
	border-collapse: collapse;
	width: 350px;
}

/* 表格单元格样式 */
table.default td {
	border: 1px solid black;
	padding: 3px;
}

/* 列头样式 */
table.default td.item {
	background: #0e59c0;
	color: #fff;
}

/* 正常信息样式 */
div.ok {
	color: #006600;
}

/* 警告信息样式 */
div.warning {
	color: #FF0000;
}
</style>

<script charset="utf-8" type="text/javascript" src="./js/functions.js">
</script>
		<script src="js/prototype-1.4.0.js" type="text/javascript">
</script>
		<script src="js/json.js" type="text/javascript">
</script>
		
		<script language="javascript">
function refresh() {
	//重新获取验证码图片的src属性
	document.getElementById("authImg").src = 'authImg?now=' + new Date();
}

function checkUserName() {
	//请求的地址
	var url = "registCheckAction.action";
	var params = Form.Element.serialize('username');
	//创建Ajax.Request对象，对应于发送请求
	var myAjax = new Ajax.Request(url, {
		//请求方式：POST
		method : 'post',
		//请求参数
		parameters : params,
		//指定回调函数
		onComplete : processResponse,
		//是否异步发送请求
		asynchronous : true
	});
}

function processResponse(request) {
	var action = request.responseText.parseJSON();
	$("usernameCheckDiv").innerHTML = action.tip;
}

function check() {
	if (form.username.value == "") {
		alert("用户名不能为空！");
		form.username.focus();
		return false;
	}
	if (form.password.value == "") {
		alert("请输入密码 ！");
		form.password.focus();
		return false;
	}
	if (form.password2.value == "") {
		alert("请再次输入密码 ！");
		form.password2.focus();
		return false;
	}
	if (form.password.value != form.password2.value) {

		alert("两次输入的密码不一致 ！");
		form.password2.focus();
		return false;
	}
	if (form.email.value == "") {
		alert("请输入邮件 ！");
		form.email.focus();
		return false;
	}

	var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//验证Mail的正则表达式,^[a-zA-Z0-9_-]:开头必须为字母,下划线,数字,
	if (form.email.value != "" && !form.email.value.match(regm)) {
		alert("邮件格式不对，检查后重新输入！");
		form.email.focus();
		return false;
	}
	
}
</script>
	</head>
	<body onload="getCookie()">
		<form accept-charset="utf-8" name="form" method="post" action="./loginServlet?a=regis" />
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
											<div class="right_proaducts">
												<font color="red">注册信息:</font>
												<br />
											</div>
											<DIV class=padding>
												<DIV id=middlebody>
													<%
														String error = (String) request.getAttribute("error");
														if (error != null) {
															request.removeAttribute("error");
													%>
													<%=error%>
													<%
														}
													%>

													<table width="70%" class="mars" cellspacing="1"
														cellpadding="0" width="100%" border="0">
														<tbody>
															<tr>

																<td class="item" width="41%">
																	<div align="right">
																		用户名:
																	</div>
																</td>
																<td width="7%"></td>
																<td width="52%">

																	<input type="text" name="username" id="username">
																	&nbsp;&nbsp;
																	<font color="red">*</font>

																	<div id="usernameCheckDiv" class="warning"></div>
																</td>
															</tr>

															<tr>

																<td class="item">
																	<div align="right">
																		密码:
																	</div>
																</td>
																<td width="7%"></td>
																<td>
																	<input type="password" name="password" id="password">
																	&nbsp;&nbsp;
																	<font color="red">*</font>
																</td>
															</tr>

															<tr>

																<td class="item">
																	<div align="right">
																		密码确认:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="password" name="password2" id="password2">
																	&nbsp;&nbsp;
																	<font color="red">*</font>
																</td>
															</tr>

															<tr>

																<td class="item">
																	<div align="right">
																		公司名称:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="companyname" id="companyname" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		公司地址:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="companyaddress"
																		id="companyaddress" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		国家:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="country" id="country" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		城市:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="city" id="city" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		工作:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="job" id="job" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		电话:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="tel" id="tel" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		Zip:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="zip" id="zip" />
																</td>
															</tr>
															<tr>

																<td class="item">
																	<div align="right">
																		Email:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="email" id="email">
																	&nbsp;&nbsp;
																	<font color="red">*</font>
																</td>
															</tr>
															<!-- <tr>
																<td class="item">
																	<div align="right">
																		验证码:
																	</div>
																</td>
																<td width="7%"></td>
																<td>

																	<input type="text" name="code" id="code">
																	&nbsp;&nbsp;
																	<font color="red">*</font>

																	<div id="codeCheckDiv" class="warning">
																		<img src="authImg" id="authImg" />
																		<a href="product/register.jsp#" onClick="refresh()">换一张</a>
																	</div>
																</td>

															</tr>
 -->
															
															
															 <tr>
																
																<td colspan="2" align="right">
																	<input type="submit" value="注册"
																		onClick="return check();" />
																	<input type="Reset" value="取消" />
																</td>
															</tr>
													</table>
								</table>
								<br />
								<div class="table_wz"></div>
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
