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
			<title>AscentWeb��������</title>
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
							<a href="./index.jsp">��ҳ</a>
						</li>
						<li>
							<a href="./product/itservice.jsp">IT����</a>
						</li>
						<li>
							<a href="./product/products.jsp">��������ϵͳ</a>
						</li>
						<li>
							<a href="./product/employee.jsp">Ա����Ƹ</a>
						</li>
						<li>
						<a href="./product/ContactUs.jsp">��������</a>
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
										��˼�ɿƼ���˾��������Լ��ô������ȹ��ҵ��ڶຣ����ѧ��Ա������˾��չ��Ҫ����������������ʿ���ˣ���ͬ��չ��
									</td>
								</tr>
								<tr bgcolor="#E2EBEF">
									<td>
										&nbsp;
										<img src="./images/arrow2.gif" alt="JAVA�������ʦ��" width="14"
											height="14" />
										<strong>C++��������ʦ��</strong><span class="style1"><strong
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
											����ְ��
											<br />
											1����Ӧ��Ʒ����Э�������֤ȯ����PC�ͻ��˵Ŀ�����
											<br />
											2�������������¼���Ԥ��,Э����ɷ���ѡ�ͺ����;
											<br />
											3����Ŀ�Ŀ�������ִ�С�
											<br />
											ְλҪ��:
											<br />
											1�����Ƽ�����ѧ����3������C++����������飬��֪���ͻ��˿�������������
											<br />
											2����ͨC/C++��������ͨSTL C++��׼�⣬��Ϥ�������ݽṹ���㷨����Ϥ�������Э��
											<br />
											3����ͨWindows��VC++/MFC/WTL/ATL/SDK��������Ϥ���̡߳��ڴ������Ϣ���ƿ���
											<br />
											4���зḻ��UI�������飬��ϤDirectUI��Qt�ȳ���UI���κ�һ�֡�
											<br />
											5������Ӧ��ǿ�Ĺ���ѹ����������������ǿ���и߶ȵľ�ҵ����
											<br />
											6���������õ��ŶӺ������񣬹���̬�Ȼ���������������ǿ��
											<br />
											<br />
										</p>
									</td>
									
								</tr>
								<tr bgcolor="#E2EBEF">
									<td>
										&nbsp;
										<img src="./images/arrow2.gif" alt="JAVA�������ʦ��" width="14"
											height="14" />
										<strong>JAVA�������ʦ��</strong><span class="style1"><strong
											class="style1"><img src="./images/hot.gif"
													width="24" height="14" />
										</strong>
										</span>
									</td>
								</tr>
								<tr>
									
									<td><p align="left" class="12"><br />
            ְλ����:<br />
                ���Java��Ʒ����Ŀ����ƺͿ�����<br />
                ��ְҪ��<br />
                1����ͨ����J2EE�ܹ���Java�����﷨��Java Web��EJB�߼���̣���ϤWebLogic/WebSphere/Struts���ȿ��ǡ�<br />
                2����ǿ�����ı���������Ȱ����������<br />
                3������Ӧ��ǿ�Ĺ���ѹ����������������ǿ���и߶ȵľ�ҵ����<br />
                <br />
            </p>
              </td>
									
									
								</tr>
								<tr>
									<td bgcolor="#E2EBEF">
										&nbsp;
										<img src="./images/arrow2.gif" width="14" height="14" />
										<strong>python��������ʦ</strong><span class="style1"><strong
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
											��ְҪ��
											<br />
											1����Ϥ python ���ԣ���3�����Ϻ�̨��������
											<br />
											2����Ϥ flask ��ܼ���ĳ�����չ���
											<br />
											3����Ϥ�ֲ�ʽ�洢���������첽��ܡ���Ⱥ�븺�ؾ��⣬��Ϣ�м���ȼ���
											<br />
											4����ϤSQL����̼��Ż�����Ϥmysql��sqlserver���������ݿ⿪�����������
											<br />
											5����ϤLinux����ϵͳ��shell��̣���ͨPython���Կ�����web���򣩣���Ϥweb������ܣ�Django������ϤBootStrap��HighChart������ʹ��HTML��CSS��JavaScript
											<br />
											6���д��ͷֲ�ʽ���߲������߸��ء��߿���ϵͳ�ܹ�����ơ������͵��ž��顣
										</p>
									</td>
								</tr>
								<tr>
									<td bgcolor="#E2EBEF">
										&nbsp;
										<img src="./images/arrow2.gif" width="14" height="14" />
										<strong>PHP��������ʦ:</strong><span class="style1"><strong
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
											��ְҪ��:
											<br />
											1�� �������ϵ�LINUX + PHP + MYSQL�������顣
											<br />
											2�� ��ϤHTML��CSS��ҳ��֪ʶ������Ӧ��JS��Ajax��Web��ؼ�����
											<br />
											3�� ��MYSQL���������ʶ���������չ�ϵ���ݿ����ۣ���ϤLinux����ϵͳ��Shell�� 
											<br />
											4�� �����õı���ϰ�ߺ�׫д�ĵ�ϰ�ߣ� �н�����⡢���м�������Ȥ�����������ڹ�ͨ�ͱ�
											<br />
										</p>
									</td>
								</tr>
								<tr class="12">
									<td>
										<font color="#FF0000">��˾��ַ�������к�������ҵ��·36����ѧ��Ա��ҵ԰306<br/>��ϵ�绰:��010��82780848/62969799<br/> E-mail:javalinda@163.com</font>
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
					<a href="http://www.socwall.com" >��Ȩ���У�������˼������Ƽ����޹�˾
						&copy;2004-2008|��ICP��05005681</a>
				</p>
			</div>

		</div>
	</body>
</html>
