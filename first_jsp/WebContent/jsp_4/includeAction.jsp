<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : includeAction.jsp</title>
</head>
<body>
	<% int i = 12; %>
	<% int n = 365; %>
	
	1 년은 <%= i %>달 입니다.
	
	<jsp:include page="includesub.jsp" />
	
	1년은 <%= n %>일 입니다.
</body>
</html>