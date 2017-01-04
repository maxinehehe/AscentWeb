<%@ page language="java"
	import="java.util.*,com.ascent.bean.*,com.ascent.util.*"
	contentType="text/html;charset=gb2312" errorPage="./error.jsp"%>
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
			<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
			<link rel="stylesheet" id="styles" href="./css/andreas08(blue).css"type="text/css" media="screen,projection" />
			<script type="text/javascript" src="./js/functions.js"></script>
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

			<div id="content2" width="100%" height="800">
				<br />
				<table width="100%" height="41" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="15" height="18" align="left" valign="top">
							<div align="left"></div>
						</td>
						<td width="385" align="left" valign="bottom" class="12">
							<span class="style5"><img src="./images/zxnsgzhh4.png"
									width="350" height="50" />
							</span>
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
							<table width="100%" border="0" cellspacing="0" cellpadding="1">
								<tr>
									<td height="44">
										亚思晟科技公司汇聚了来自加拿大、美国等国家的众多海外留学人员。现因公司发展需要，诚邀各界优秀人士加盟，共同发展：
									</td>
								</tr>
								<tr bgcolor="#E2EBEF">
									<td>
										&nbsp;
										<img src="./images/arrow2.gif" alt="JAVA软件工程师：" width="14"
											height="14" />
										<strong>C++开发工程师：</strong><span class="style1"><strong
											class="style1"><img src="./images/hot.gif"
													width="24" height="14" />
												<img src="./images/hot.gif" width="24" height="14" />
										</strong>
										</span>
									</td>
								</tr>
								<tr >
									<td>
										<p align="left" class="12">  <!-- align="left" -->
											<br />
											工作职责：
											<br />
											1、响应产品需求、协调并完成证券交易PC客户端的开发。
											<br />
											2、互联网金融新技术预研,协助完成方案选型和设计;
											<br />
											3、项目的开发任务执行。
											<br />
											职位要求:
											<br />
											1、本科及以上学历，3年以上C++软件开发经验，有知名客户端开发经验者优先
											<br />
											2、精通C/C++开发，精通STL C++标准库，熟悉常用数据结构、算法；熟悉相关网络协议
											<br />
											3、精通Windows的VC++/MFC/WTL/ATL/SDK开发，熟悉多线程、内存管理、消息机制开发
											<br />
											4、有丰富的UI开发经验，熟悉DirectUI、Qt等常用UI库任何一种。
											<br />
											5、能适应较强的工作压力，独立工作能力强，有高度的敬业精神。
											<br />
											6、具有良好的团队合作精神，工作态度积极主动，责任心强。
											<br />
											<br />
										</p>
									</td>
									
								</tr>
								<tr bgcolor="#E2EBEF">
									<td>
										&nbsp;
										<img src="./images/arrow2.gif" alt="JAVA软件工程师：" width="14"
											height="14" />
										<strong>JAVA软件工程师：</strong><span class="style1"><strong
											class="style1"><img src="./images/hot.gif"
													width="24" height="14" />
										</strong>
										</span>
									</td>
								</tr>
								<tr>
									
									<td><p align="left" class="12"><br />
            职位描述:<br />
                完成Java产品、项目的设计和开发。<br />
                任职要求：<br />
                1、精通基于J2EE架构的Java核心语法，Java Web及EJB高级编程，熟悉WebLogic/WebSphere/Struts优先考虑。<br />
                2、较强的中文表达能力，热爱软件开发。<br />
                3、能适应较强的工作压力，独立工作能力强，有高度的敬业精神。<br />
                <br />
            </p>
              </td>
									
									
								</tr>
								<tr>
									<td bgcolor="#E2EBEF">
										&nbsp;
										<img src="./images/arrow2.gif" width="14" height="14" />
										<strong>python开发工程师</strong><span class="style1"><strong
											class="style1"><img src="./images/hot.gif"
													width="24" height="14" />
													<img src="./images/hot.gif"
													width="24" height="14" />
													<img src="./images/hot.gif"
													width="24" height="14" />
										</strong>
										</span>
									</td>
								</tr>
								<tr valign="top">
									<td>
										<p class="12">
											<br />
											任职要求：
											<br />
											1、熟悉 python 语言，有3年以上后台开发经验
											<br />
											2、熟悉 flask 框架及其的常见扩展组件
											<br />
											3、熟悉分布式存储、搜索、异步框架、集群与负载均衡，消息中间件等技术
											<br />
											4、熟悉SQL语句编程及优化，熟悉mysql、sqlserver，具有数据库开发和设计能力
											<br />
											5、熟悉Linux操作系统及shell编程，精通Python语言开发（web方向），熟悉web开发框架（Django），熟悉BootStrap、HighChart；熟练使用HTML，CSS，JavaScript
											<br />
											6、有大型分布式、高并发、高负载、高可用系统架构、设计、开发和调优经验。
										</p>
									</td>
								</tr>
								<tr>
									<td bgcolor="#E2EBEF">
										&nbsp;
										<img src="./images/arrow2.gif" width="14" height="14" />
										<strong>PHP开发工程师:</strong><span class="style1"><strong
											class="style1"><img src="./images/hot.gif"
													width="24" height="14" />
													<img src="./images/hot.gif"
													width="24" height="14" />
													<img src="./images/hot.gif"
													width="24" height="14" />
										</strong>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<p class="12">
											<br />
											任职要求:
											<br />
											1、 两年以上的LINUX + PHP + MYSQL开发经验。
											<br />
											2、 熟悉HTML，CSS等页面知识，熟练应用JS，Ajax等Web相关技术。
											<br />
											3、 对MYSQL有深入的认识，熟练掌握关系数据库理论；熟悉Linux操作系统和Shell。 
											<br />
											4、 有良好的编码习惯和撰写文档习惯； 有解决问题、钻研技术的兴趣和能力，善于沟通和表达。
											<br />
										</p>
									</td>
								</tr>
								<tr class="12">
									<td>
										<font color="#FF0000">公司地址：北京市海淀区创业中路36号留学人员创业园306<br/>联系电话:（010）82780848/62969799<br/> E-mail:javalinda@163.com</font>
										<br />
									</td>
								</tr>
							</table>
						</td>
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
