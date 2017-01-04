<%@ page language="java" pageEncoding="utf-8" %>
<script type="text/javascript" language="javascript">
	// 根据不同的浏览器创建不同的XMLHttpReauest对象
	function createXmlHttpRequest(){
		var xmlreq = false;
		if(window.XMLHttpRequest){
			xmlreq = new XMLHttpRequest();	
		}else if(window.ActiveXObject){
			try{
				xmlreq = new ActiveXObject("Msxm12.XMLHTTP");
			}catch(e1){
				try{
					xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
				}catch(e2){
					// 空
				}
			}
		}
		return xmlreq;
	}
	
	function userNameCheck(){
		var username = document.all.username.value();  // 获取text的值
		var request = createXMLHttpRequest();  // 创建request对象
		request.open("post","ValidationServlet?username="+username); // 建立到服务器的新请求
		
		request.send();   // 向服务器发送请求
		requset.onreadystatechange=function(){
			// 指定当readyState属性改变时间的事件处理句柄
			if(request.readyState==4)
				// 如果当前HTTP的就绪状态，状态从4表示响应已经完成，可以访问服务器响应并使用它
				if(requset.status==200) // HTTP状态，期望的状态吗是200，它表示一切顺利
				// 如果就绪状态是4而且状态码是200，就可以处理服务器的数据了，而且这些数据应该就是要求的数据
				{
					var value = request.responseText; // 服务器返回响应文本
					
					if(value=="true"){
						document.all.unc.innerHTML="该用户名已经存在";
					}else{
						document.all.unc.innerHTML="该用户名可以注册";
					}
				}
		}
	} 
</script>
<html>
	<head>
		<title>AjaxTest</title>
	</head>
	<body>
		用户姓名：<input type="text" name="username" onblur="userNameCheck()" />
		<font color="red" size="-1" id="unc"></font>
	</body>
</html>