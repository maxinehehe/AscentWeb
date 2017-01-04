<%@ page language="java" import="java.util.*,com.ascent.bean.*"
	contentType="text/html;charset=utf-8" errorPage="./error.jsp"%>
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
				<br />
				

				<table width="755"  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="10"></td>
						<td align="left" valign="top">
							<div id=demo9 style="OVERFLOW: hidden; WIDTH: 700" align="center">
								<table width="100%" border=0 align=left cellPadding=0 cellSpacing=0 >
									<TBODY>
									<tr>
										<td id=demo10 vAlign=top>
										<table width="735" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td align="center" valign="top">
													<img src="./images/gun1.jpg"/><img src="./images/gun2.jpg"/><img src="./images/gun3.jpg"/><img src="./images/gun4.jpg"/><img src="./images/gun5.jpg"/><img src="./images/xgun1.jpg"/><img src="./images/xgun2.jpg"/><img src="./images/xgun3.jpg"/>  
										
												</td>
											</tr>
										</table>
										</td>
										<td id=demo11 valign=top>
										</td>
									</tr>
									</TBODY>
								</table>
							</div>

<script>  /* 图片滚动展示 */
	var speed4=25  // 速度数值越大速度越慢
	document.getElementById("demo11").innerHTML=document.getElementById("demo10").innerHTML
	
	function Marquee4(){
	if(document.getElementById("demo11").offsetWidth-document.getElementById("demo9").scrollLeft<=0)
	document.getElementById("demo9").scrollLeft-=document.getElementById("demo10").offsetWidth
	else{
	document.getElementById("demo9").scrollLeft++     // 从右往左
	}
	}
	var MyMar4=setInterval(Marquee4,speed4)
	document.getElementById("demo9").onmouseover=function() {clearInterval(MyMar4)}
	document.getElementById("demo9").onmouseout=function() {MyMar4=setInterval(Marquee4,speed4)}
</script>
</td>
<td width="10"></td>
</tr>
</table>
				
				
				
				
				
				
				<table width="720" height="100" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="15" height="18" align="left" valign="top"
							bgcolor="#a5a5a5">
							<div align="left"></div>
						</td>
						<td width="385" align="left" valign="bottom" bgcolor="#a5a5a5"
							class="12">
							<strong>联系我们</strong>
						</td>
					</tr>
					<tr>
						<td height="4" colspan="2" align="left" valign="bottom"
							bgcolor="#eeeeee"></td>
					</tr>
					<tr>
						<td height="4" align="left" valign="bottom" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="4" align="left" valign="bottom" bgcolor="#eeeeee"
							class="12">
							<strong>亚思晟科技</strong>
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							<strong>BEIJING ASCENT TECHNOLOGIES INC.</strong>
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							地址:北京市海淀区上地东路29号留学人员创业园303-306室
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							Add:Room 303-306,29Shangdi East Road,Overseas Student Pioneer
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							Park,Beijing,P.R.China
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							邮编Post Code:100085
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							传真Fax:010-62969799
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							电话Tel:010-82780848/82780167
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							E-mail:ascent@ascenttech.com.cn
						</td>
					</tr>
					<tr>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" bgcolor="#eeeeee"
							class="12">
							Java技术讨论群： 3307453
						</td>
					</tr>
					<tr>
						<td height="15" colspan="2" valign="top" bgcolor="#eeeeee">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td height="15" colspan="2" valign="top" bgcolor="#a5a5a5"></td>
					</tr>
				</table> 
				
				
				<p>
					&nbsp;
				</p>
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
