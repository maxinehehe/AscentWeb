<%@ page language="java" import="com.ascent.bean.*" pageEncoding="UTF-8" errorPage="./error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>AscentWeb电子商务</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" href="./css/andreas08(blue).css" type="text/css" media="screen,projection" />
		<script src="./js/prototype-1.4.0.js" type="text/javascript"></script>
		<script src="./js/json.js" type="text/javascript"></script>
		<script type="text/JavaScript">
		
		</script>
		
		<script charset="utf-8" type="text/javascript" src="./js/functions.js">
		</script>

		<script language="javascript">
function addProducts() {
	if (form.productnumber.value == "") {
		alert("编号不能为空 ！");
		form.productnumber.focus();
		return false;
	}
	if (form.productname.value == "") {
		alert("产品名称不能为空 ！");
		form.productname.focus();
		return false;
	}
	if (form.catalogno.value == "") {
		alert("catalogno 不能为空 ！");
		form.catalogno.focus();
		return;
	}
	if (form.cas.value == "") {
		alert("CAS 不能为空 ！");
		form.cas.focus();
		return false;
	}
	if (form.mdlnumber.value == "") {
		alert("MDLNumber 不能为空 ！");
		form.mdlnumber.focus();
		return false;
	}
	if (form.newproduct.value == "") {
		alert("新产品必须选择 ！");
		form.newproduct.focus();
		return false;
	}

	if (form.formula.value == "") {
		alert("formula 必须输入 ！");
		form.formula.focus();
		return false;
	}
	if (form.weight.value == "") {
		alert("weight 必须输入 ！");
		form.weight.focus();
		return false;
	}
	if (form.category.value == "") {
		alert("category 必须输入！");
		form.category.focus();
		return false;
	}
	if (form.price1.value == "") {
		alert("请输入价格1 ！");
		form.price1.focus();
		return false;
	}
	if (form.stock.value == "") {
		alert("请输入 stock ！");
		form.stock.focus();
		return false;
	}
	if (form.price2.value == "") {
		alert("请输入 价格2 ！");
		form.price2.focus();
		return false;
	}
	if (form.realstock.value == "") {
		alert("请输入 realstock ！");
		form.realstock.focus();
		return false;
	}
	if (form.upload.value == "") {
		alert("请选择图片 ！");
		form.upload.focus();
		return false;
	}
	form.submit();
}
</script>
	</head>

	<body onload="getCookie()">
		<form name="form" method="post" action="./product?a=save"
			enctype="multipart/form-data" />
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
							<td width="15" height="18" align="left" valign="top"></td>
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
								<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="20">
											<div class="right_proaducts">
												我的位置&gt;&gt;电子商务管理&gt;&gt;用户信息
											</div>
										</td>
									</tr>
								</table>
								<br />

								<%
									Usr p = (Usr) session.getAttribute("productuser");
								%>
								<table width="100%">
									<tbody>
										<tr>
											<td height="20">
												<div class="table_t">
													|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
													<a href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;&nbsp;|
												</div>
											</td>
											<td>
												<div>
													<a href="./user?a=all"><img src="./images/userlist.jpg" border="0" />
													</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="./product?a=all"><img src="./images/productslist.jpg" border="0" />
													</a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="./order?a=all"><img src="./images/ShowOrders.jpg" border="0" />
													</a> &nbsp;&nbsp;&nbsp;&nbsp;
													<a href="./admin/add_products_admin.jsp"><img src="./images/addProduct.jpg" border="0" />
													</a>&nbsp;&nbsp;&nbsp;&nbsp;
												</div>
											</td>
										</tr>
										<!-- 产品列表 -->
									</tbody>
								</table>
								<table width="680" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td bgcolor="#467AA7" colspan="2" height="5"></td>
										</tr>
										<tr>
											<td colspan="2" height="7"></td>
										</tr>
										<tr>
											<td width="110" height="20" class="table_c">
												商品信息
											</td>
											<td width="439" bgcolor="#ffffff">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="javascript:history.back()">&lt;&lt;&lt; 返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</tbody>
								</table>
								<table width="500" border="0" cellspacing="0" bordercolor="#9EA7AB" bgcolor="#f3f3f3">
									<tr>
										<td height="10" colspan="4">
											
										</td>
									</tr>
									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												编号:
											</div>
										</td>
										<td width="122">
											<input name="productnumber" type="text" />
											<div id="productIdCheckDiv" class="warning"></div>
										</td>
										<td width="85" class="table_c">
											<div align="right">
												产品名称:
											</div>
										</td>
										<td width="163" height="15">
											<input name="productname" type="text" />
										</td>
									</tr>
									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												CatalogNo:
											</div>
										</td>
										<td width="122">
											<input name="catalogno" type="text" />
										</td>
										<td width="85" class="table_c">
											<div align="right">
												CAS:
											</div>
										</td>
										<td width="163" height="15">
											<input name="cas" type="text" />
										</td>
									</tr>

									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												MDL Number:
											</div>
										</td>
										<td width="122">
											<input name="mdlnumber" type="text" />
										</td>
										<td width="85" class="table_c">
											<div align="right">
												新产品:
											</div>
										</td>
										
										<td height="15" class="table_c">
											是:
											<input type="radio" name="newproduct" value="1" checked  />
											否:
											<input type="radio" name="newproduct" value="0" />
										</td>
									</tr>
									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												Formula:
											</div>
										</td>
										<td width="122">
											<input name="formula" type="text" />
										</td>
										<td width="85" class="table_c">
											<div align="right">
												weight:
											</div>
										</td>
										<td width="163" height="15">
											<input name="weight" type="text" />
										</td>
									</tr>

									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												Category:
											</div>
										</td>
										<td width="122">
											<input name="category" type="text" />
										</td>
										<td width="85" class="table_c">
											<div align="right">
												备注:
											</div>
										</td>
										<td width="163" height="30">
											<input name="note" type="text" />
										</td>
									</tr>
									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												价格1:
											</div>
										</td>
										<td width="122">
											<input name="price1" type="text" />
										</td>
										<td width="85" class="table_c">
											<div align="right">
												Stock:
											</div>
										</td>
										<td width="163" height="15">
											<input name="stock" type="text" />
										</td>
									</tr>
									<tr>
										<td width="122" height="15" class="table_c">
											<div align="right">
												价格2:
											</div>
										</td>
										<td width="122">
											<input name="price2" type="text" />
										</td>
										<td width="85" class="table_c">
											<div align="right">
												Real Stock:
											</div>
										</td>
										<td width="163" height="15">
											<input name="realstock" type="text" />
										</td>
									</tr>
									<tr>
										<td width="85" class="table_c">
											<div align="right">
												图片:
											</div>
										</td>
										<td width="163" height="15">
											<input type="file" name="upload" />
										</td>
									</tr>
									<tr>
										<td height="15" colspan="4">
											<div align="center">

												<div class="loading_ll">
													<input type="button" value="提交" onclick="addProducts()" />
												</div>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<br />
					<div class="table_wz"></div>
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
