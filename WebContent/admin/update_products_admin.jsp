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
		<script language="javascript">
function updateProducts() {
	if (form.productId.value == "") {
		alert("编号不能为空 ！");
		form.productId.focus();
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
	if (form.mw.value == "") {
		alert("MW 必须输入 ！");
		form.mw.focus();
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
	return true;
}
</script>
		

	</head>

	<body onload="getCookie()">
	<!-- 执行更新 -->
	<form name="form" method="post" action="./product?a=update" enctype="multipart/form-data">
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
												我的位置&gt;&gt;电子商务管理&gt;商品修改
												<br />
											</div>
											
													<%
														Usr p = (Usr) session.getAttribute("productuser");
														if ((p != null && p.getSuperuser().equals("3"))||p != null && p.getSuperuser().equals("2")) {
															Product product = (Product) request.getAttribute("pid_product");
															String newproduct = product.getIsnewproduct();
													%>
													<table width="100%">
														<tbody>
															<tr>
																<td height="10">
																	<div class="table_t">
																		|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
																		<a href="./login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;
																		<a href="javascript:history.back()"><<< 返回</a>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
													<table class="mars" cellspacing="1" cellpadding="0"
														width="100%" border="0">
														<tbody>
															<tr>
																<td height="10" colspan="4">
																	<input name="pid" type="hidden" value="<%=product.getId()%>">
																</td>
															</tr>

															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		编号:
																	</div>
																</td>
																<td width="122">
																	<input name="productnumber" type="text"
																		value="<%=product.getProductnumber()%>"/>
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		名称:
																	</div>
																</td>
																<td width="163" height="15">
																	<input name="productname" type="text"
																		value="<%=product.getProductname()%>" />
																</td>
															</tr>
															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		CatalogNo:
																	</div>
																</td>
																<td width="122">
																	<input name="categoryno" type="text"
																		value="<%=product.getCategoryno()%>" />
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		CAS:
																	</div>
																</td>
																<td width="163" height="15">
																	<input name="cas" type="text"
																		value="<%=product.getCas()%>" />
																</td>
															</tr>

															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		MDL Number:
																	</div>
																</td>
																<td width="122">
																	<input name="mdlnumber" type="text"
																		value="<%=product.getMdint()%>" />
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		新产品:
																	</div>
																</td>

																<%
																	if ("0".equals(newproduct)) {
																%>
																<td height="15" class="table_c">
																	是:
																	<input type="radio" name="newproduct" value="1" />
																	否:
																	<input type="radio" name="newproduct" value="0" checked />
																</td>
																<%
																	}else {
																%>
																<td height="15" class="table_c">
																	是:
																	<input type="radio" name="newproduct" value="1" checked />
																	否:
																	<input type="radio" name="newproduct" value="0" />
																</td>
																<%
																	}
																%>
															</tr>
															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		Formula:
																	</div>
																</td>
																<td width="122">
																	<input name="formula" type="text"
																		value="<%=product.getFormula()%>" />
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		重量:
																	</div>
																</td>
																<td width="163" height="15">
																	<input name="weight" type="text"
																		value="<%=product.getWeight()%>" />
																</td>
															</tr>
															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		类型:
																	</div>
																</td>
																<td width="122">
																	<input name="category"
																		value="<%=product.getCategory()%>" type="text" />
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		备注:
																	</div>
																</td>
																<td width="163" height="15">
																	<%
																		if (product.getNote() == null) {
																	%>
																	<input name="note" type="text" value="" />
																	<%
																		} else {
																	%>
																	<input name="note" id="" type="text"
																		value="<%=product.getNote()%>" />
																	<%
																		}
																	%>
																</td>
															</tr>
															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		价钱1:
																	</div>
																</td>
																<td width="122">
																	<input name="price1" type="text"
																		value="<%=product.getPrice1()%>" />
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		Stock:
																	</div>
																</td>
																<td width="163" height="35">
																	<input name="stock" type="text"
																		value="<%=product.getStock()%>" />
																</td>
															</tr>
															<tr>
																<td width="122" height="15" class="table_c">
																	<div align="right">
																		价格2:
																	</div>
																</td>
																<td width="122">
																	<input name="price2" type="text"
																		value="<%=product.getPrice2()%>" />
																</td>
																<td width="85" class="table_c">
																	<div align="right">
																		Real Stock:
																	</div>
																</td>
																<td width="163" height="15">
																	<input name="realstock" type="text"
																		value="<%=product.getRealstock()%>" />
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
																	<div class="img">
																		<img src="<%=path%>/images/<%=product.getImagepath() %>" width="100" height="50" />
																	</div>
																</td>
															</tr>
															<tr>
																<td height="15" colspan="4">
																	<div align="center">
																		<div class="loading_ll">
																			<input type="image" src="./images/update1.jpg" onclick="return updateProducts();" border="0" alt="修改" />
																		</div>
																	</div>
																</td>
															</tr>

														</tbody>
													</table>
													<%
														} else { //最上面的if的else
													%>
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<center>
														<h3>
															对不起，您没有权限查看！！！
														</h3>
													</center>
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<br />
													<%
														}
													%>
												
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
		
		
		
		
		  <!-- content2 -->
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





























	