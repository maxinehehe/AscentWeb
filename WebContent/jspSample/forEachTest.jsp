<%@ page language="java" pageEncoding="utf-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List list = new ArrayList();
	list.add("无语");
	list.add("冰儿");
	list.add("小明");
	request.setAttribute("list",list);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>测试·forEach</title>
</head>
<body>
	<h2>利用&lt;c:forEach&gt;标签遍历List集合的结果 </h2>
	<c:forEach items="${list }" var="tag" varStatus="id">
	<h3>${id.count }&nbsp;${tag}<br></h3>
	</c:forEach>
	
	<c:forEach begin="1" end="6" step="1" var="str">
		<c:out value="${str }" />编程词典
	</c:forEach>
</body>
</html>