<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : forward_1.jsp</title>
</head>
<body>
	<jsp:forward page="send.jsp"/>
	
	
	<% 
	//	pageContext.forward("send.jsp");
	%>
	
</body>
</html>