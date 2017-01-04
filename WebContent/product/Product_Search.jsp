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
		
		<script language="javascript" type="text/javascript">
function check() {  // 检查输入是否不为空
	if (form.searchValue.value == "") {
		alert("请输入查询条件！");
		form.searchValue.focus();
		return false;
	}
	return true;
}
</script>

	</head>

	<body onload="getCookie()">
	<form name="form" method="post" action="./product?a=search">
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
				<table width="100%" height="400" border="0" align="center"
					cellpadding="0" cellspacing="0">
					
					<tr>
						<!-- 空一行 -->
						<td height="2" colspan="2" align="left" valign="bottom"></td>
					</tr>	
					
					<tr>
						
						<td height="15" align="left" valign="top" class="12">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="40%">
														<div align="left">
															我的位置>>医药商务管理>>商品查询	
														</div>
													</td>
									</tr>
									
									<tr>
										<td width="40%">
														<div align="left">
															<a href="javascript:history.go(-1)"> &lt;&lt;&lt; 返回</a>
														</div>
										</td>
									</tr>
							</table>	
						</td>
					</tr>
					
					<!-- <tr>
						<td height="15" align="left" valign="top" class="12">
							
						</td>
					</tr> -->
					
					
					
					<tr>
						<td height="15" align="left" valign="top" class="12">
						
						<table width="680" height="100" border="0" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td width="184" height="10" class="table_hui">
													<div align="right"></div>
												</td>
												<td width="204"></td>
											</tr>
											<tr>
												<td class="table_hui">
													<div align="right">
														请选择:
													</div>
												</td>
												<td class="table_hui">
													<select name="searchName">
														<option value="category" selected="selected">
															商品分类
														</option>
														<option value="cas">
															摘要
														</option>
														<option value="productname">
															商品名称
														</option>
														<option value="mdlint">
															MDLNumber
														</option>
														<option value="formula">
															药品化学方程式
														</option>
													</select>
												</td>
												<td>
													<input type=text name="searchValue" />
												</td>
											</tr>

											<tr>
												<td height="30" class="table_hui">
												</td>
												<td height="30" class="table_hui">
													<input type="submit" name="Submit" value="查询"
														onclick="return check();" />
												</td>
												<td height="30" class="table_hui">
													<input type="reset" name="Reset" value="取消" />
												</td>

											</tr>

										</tbody>
									</table>
									
						
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
