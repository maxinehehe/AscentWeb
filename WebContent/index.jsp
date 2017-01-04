<%@ page language="java" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<script src="sweetalert-master/dist/sweetalert.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="sweetalert-master/dist/sweetalert.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AscentWeb电子商务</title>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
<link rel="stylesheet"  id="styles" href="<%=path %>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
<script charset="utf-8" type="text/javascript" src="./js/functions.js"></script>
<script language="javascript" type="text/javascript">
	function zhuye(){
 		swal("太抱歉了", "我还没编写", "warning");
	}
	function zhuye2(){
 		swal("都说过抱歉了", "我真的还的没编写啊！", "warning");
	}
</script>
</head>
<body onload="getCookie()">
<div id="container" >
<div id="header">

</div>
<div id="navigation">
<ul>
						<li class="selected"></li>
						<li>
							<a href="<%=path%>/index.jsp">首页</a>
						</li>
						<li>
							<a href="<%=path%>/product/itservice.jsp">IT服务</a>
						</li>
						<li>
							<a href="<%=path%>/product/products.jsp">电子商务系统</a>
						</li>
						<li>
							<a href="<%=path%>/product/employee.jsp">员工招聘</a>
						</li>
						<li>
							<a href="<%=path%>/product/ContactUs.jsp">关于我们</a>
						</li>
						
					</ul><br>
</div>
<div id="content">
<h2>Welcome To Ascent Technologies</h2>

<div class="splitcontentleft">
  <div class="box">
<h3><img src="images/lxrycyy.gif" alt="" width="184" height="124" /></h3>
</div>
</div>
<div class="splitcontentright">
  <p>亚思晟商务科技有限公司（简称   &quot;亚思晟科技&quot;），是由海外归国IT专业技术人士在中关村海淀留学生创业园创办成立。公司总部位于北京，在加拿大，美国，日本及国内的石家庄，长春，秦皇岛，吉林，廊坊等地设有分部。凭借着卓越的技术水平、经验丰富的管理团队，强大的资源整合能力和“诚信、开放、创新、卓越”的经营理念，亚思晟科技奠定了公司在本地和海外IT服务市场的优势地位，获得了客户的一致认可和好评，并与客户建立了长期的战略合作伙伴关系。公司立足于中国IT的现实和特点，利用国际先进成熟的技术和经验，提供高端优质的IT服务,包括软件高端培训、软件开发及维护、软件外包、软件产品研发和本地化等。   公司具有突出的技术优势，包括：具备北美电子应用平台技术；通过北京中关村科技园高科技产品认证，公司还具有突出的人才优势，拥有美国MBA,   纽约华尔街及加拿大证券交易中心认证管理专家；以及其它加拿大IT技术移民和海外留学人员。 </p>

  <p><strong>Good luck with your new design!</strong></p>
</div>
</div>

<div id="subcontent">
<form name="form" method="post" action="<%=request.getContextPath()%>/loginServlet?a=login">
  <div class="small box">
    <table width="150" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30%" valign="middle"><img src="images\username.jpg" width="61" height="17" align="bottom" />
            <input name="username" id="username" type="text" size="7"/>
        </td>
      </tr>
      <tr>
        <td valign="middle"><img src="images\password.jpg" width="61" height="17" />
            <input name="password" id="password" type="password" size="7" /></td>
      </tr>
      <tr>
        <td height="30" valign="bottom"><input name="image" type="image" onclick="return checkLogin(form);" src="images\login_1_7.jpg" alt="登录" width="44" height="17" border="0"/>
          &nbsp;&nbsp;
          <select name="sel" onchange="changeStyle(this)">
            <option value="andreas08(blue).css" selected="selected">默认风格</option>
			<option value="andreas08(orange).css">桔色</option>
			<option value="andreas08(green).css">绿色</option>
			<!-- <option value="andreas08(violet).css">紫色</option> -->
          </select></td>
      </tr>
    </table>
  </div>
  </form>
  <h2>最新商品列表</h2>
  <ul class="menublock"><li><a href="#">项目实战精解</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0"/></a></li>
  <li><a href="#">java核心技术</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0"/></a></li>
  </ul>

<h2>友情链接</h2>
<ul class="menublock">
  <li><button onclick="return zhuye()" border="0"><a href="#" >亚思晟视频在线</a></button></li>
  <li><button onclick="return zhuye2()" border="0"><a href="#" >亚思晟公司主页</a></button></li>
  </ul>

</div>

<div id="footer">
<p><a href="http://www.socwall.com" >版权所有：北京亚思晟商务科技有限公司 &copy;2004-2008|京ICP备05005681</a></p>
</div>

</div>
</body>
</html>