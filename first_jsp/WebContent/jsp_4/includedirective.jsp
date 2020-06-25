<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP예제 : includedirective.jsp</title>
</head>
<body>
	<% int i = 12; %>
	<% //int n = 365; %>
	<% int days = 365; %>
	1년은 <%= i %> 달 입니다.
	<%@ include file="includesub.jsp" %>
	1 년은 <%= days %> 일 입니다.
	최우석은 바보입니다. <%= n %>
</body>
</html>