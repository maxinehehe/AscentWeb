<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="sweetalert-master/dist/sweetalert.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="sweetalert-master/dist/sweetalert.css">

<title>AscentWeb电子商务</title>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
<link rel="stylesheet" id="styles"
	href="<%=path%>/css/andreas08(blue).css" type="text/css"
	media="screen,projection" />
<script charset="utf-8" type="text/javascript" src="./js/functions.js"></script>
<script language="javascript">
	function t2(){
		swal("恭喜","添加成功","success");
	}

</script>



</head>
<body onload="getCookie()">
	<div id="container">
		<div id="header"></div>
		<div id="navigation">
			<ul>
				<li class="selected"></li>
				<li><a href="<%=path%>/index.jsp">首页</a></li>
				<li><a href="<%=path%>/product/itservice.jsp">IT服务</a></li>
				<li><a href="<%=path%>/product/products.jsp">电子商务系统</a></li>
				<li><a href="<%=path%>/product/employee.jsp">员工招聘</a></li>
				<li><a href="<%=path%>/product/ContactUs.jsp">关于我们</a></li>

			</ul>
			<br>
		</div>
		<div id="content2"></div>

		<div class="showcase sweet">
			<h4>Sweet Alert</h4>
			<button>Show error message</button>

			<h5>Code:</h5>
			<pre>
				<span class="attr">sweetAlert</span>(<span class="str">"Oops..."</span>, <span
					class="str">"Something went wrong!"</span>, <span class="str">"error"</span>);
			</pre>
		</div>
		<div >
		
			<button onclick="t2()">ok</button>
		
		</div>

		<div id="footer">
			<p>
				<a href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司
					&copy;2004-2008|京ICP备05005681</a>
			</p>
		</div>

	</div>
</body>
</html>