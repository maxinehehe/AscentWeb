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

<script src="sweetalert-master/dist/sweetalert.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="sweetalert-master/dist/sweetalert.css">

<base href="<%=basePath%>">
<title>AscentWeb电子商务</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="styles" rel="stylesheet" href="./css/andreas08(blue).css"
	type="text/css" media="screen,projection" />
<script charset="utf-8" type="text/javascript" src="./js/functions.js">
		</script>
<script language="javascript">
		
function addshop(str) {     // 处理购买
	var pid = str;
	send_request('./shopcart?a=add&pid=' + pid);   // 转至shopcartServlet进行处理
}


// ajax
var http_request = false;
function send_request(url) { //初始化、指定处理函数、发送请求的函数
	http_request = false;
	//开始初始化XMLHttpRequest对象
	if (window.XMLHttpRequest) { //Mozilla 浏览器 safari
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {//设置MiME类别
			http_request.overrideMimeType('text/xml');
		}
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // 异常，创建对象实例失败
		window.alert("不能创建XMLHttpRequest对象实例.");
		return false;
	}
	http_request.onreadystatechange = processRequest;   // 调用返回结果处理函数
	// 确定发送请求的方式和URL以及是否同步执行下段代码
	http_request.open("POST", url, true);
	http_request.send(null);
}
// 处理返回信息的函数
function processRequest() {
	if (http_request.readyState == 4) { // 判断对象状态
		if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
			var divhtml = http_request.responseText;
			alert(divhtml);
		}
	}

}
</script>
</head>

<body onload="getCookie()">
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

		<div id="content2">
			<table width="100%" height="400" border="0" align="center"
				cellpadding="0" cellspacing="0">

				<tr>
					<td height="4" colspan="2" align="left" valign="bottom"></td>
				</tr>
				<tr>
					<td height="15" align="left" valign="top">&nbsp;</td>
					<td height="15" align="left" valign="top" class="12">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<%
									Usr p = (Usr) session.getAttribute("productuser");
									// System.out.println("出错！");
									if (p == null) { //未注册用户
								%>
								<td width="40%">
									<div align="left">
										|&nbsp;&nbsp;欢迎,游客&nbsp;&nbsp;|&nbsp;&nbsp; <a
											href="./product/register.jsp" class="table_t">注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:history.go(-1)">&lt;&lt;&lt; 返回</a>
									</div>
								</td>
								<td width="15%">
									<div align="center">&nbsp;</div>
								</td>
								<td width="15%">
									<div align="center">&nbsp;</div>
								</td>
								<td width="15%">
									<div align="center">
										<a href="./product/Product_Search.jsp">商品查询</a>
									</div>
								</td>
								<td width="20%">
									<div align="center">
										<a href="./shopcart?a=find">查看购物车</a>
									</div>
								</td>


								<%
									} else { //注册用户
								%>
								<td width="40%">
									<div align="left">
										|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;|&nbsp; <a
											href="./loginServlet?a=out" class="table_t">注销</a>&nbsp;|&nbsp;
										<a href="javascript:history.go(-1)">&lt;&lt;&lt; 返回</a>
									</div>
								</td>
								<td width="15%">
									<div align="center">&nbsp;</div>
								</td>
								<td width="15%">
									<div align="center">
										<a href="./product/Product_Search.jsp">商品查询</a>
									</div>
								</td>

								<td width="15%">
									<div align="center">
										<a href="./order?a=all">查看订单</a>
									</div>
								</td>

								<td width="15%">
									<div align="center">
										<a href="./shopcart?a=find">查看购物车</a>
									</div>
								</td>
								<%
									}
								%>
							</tr>
						</table> <br /> <!-- 产品列表 -->
						<table width="100%" border="1" cellspacing="0" cellpadding="0"
							class="mars">
							<tr bgcolor="#fba661" height="30">
								<td>
									<div align="center">编号</div>
								</td>
								<td>
									<div align="center">名称</div>
								</td>
								<td>
									<div align="center">catalogno</div>
								</td>
								<td>
									<div align="center">cataname</div>
								</td>
								<td>
									<div align="center">MDLNumber</div>
								</td>
								<td>
									<div align="center">价格</div>
								</td>
								<td>
									<div align="center">库存</div>
								</td>
								<td>
									<div align="center">图片</div>
								</td>
								<td>
									<div align="center">购买</div>
								</td>
							</tr>
							<%
								List<Product> list = (List<Product>) request.getAttribute("productlist");
								for (Product pu : list) {
									int id = pu.getId();
									System.out.println("stock:"+pu.getStock()+"\n"+pu.getRealstock());
							%>
							<tr bgcolor="#f3f3f3" height="25">
								<td width="10%">
									<div align="center"><%=pu.getProductnumber()%></div>
								</td>
								<td width="13%">
									<div align="center"><%=pu.getProductname()%></div>
								</td>
								<td width="12%">
									<div align="center"><%=pu.getCategoryno()%></div>
								</td>
								<td width="12%">
									<div align="center"><%=pu.getCategory()%></div>
								</td>
								<td width="13%">
									<div align="center"><%=pu.getMdint()%></div>
								</td>
								<td width="10%">
									<div align="center"><%=pu.getPrice1()%></div>
								</td>
								<td width="10%">
									<div align="center"><%=pu.getRealstock()%></div>

								</td>
								<td width="12%">
									<div align="center">
										<img src="<%=path%>/images/<%=pu.getImagepath()%>" width="60"
											height="30" hspace="0" border="0" />
										<%-- <%System.out.println(request.getContextPath() + "/" + pu.getImagepath()); %> --%>
									</div>
								</td>
								<td width="13%">
									<div align="center">
										<!-- 定义按钮事件 点击 -->
										<button onclick="addshop(<%=id%>)">购买</button>
									</div>
								</td>
							</tr>
							<%
								}
							%>
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
