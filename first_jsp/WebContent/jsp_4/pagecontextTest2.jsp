<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : pagecontextTest2.jsp</title>
</head>
<body>
<% 
	pageContext.include("pagecontextTest3.jsp");
%>
	<hr size="8" color="red" />
	<h2>pageContext의 forward 메소드로 포워딩된 페이지입니다.</h2>
</body>
</html>