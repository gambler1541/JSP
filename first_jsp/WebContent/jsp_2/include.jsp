<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP예제 include.jsp</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<hr color="red" size="5"/>
	<p>include 지시자 &lt;include file="file_name"&gt;</p>
	<hr color="red" size="5"/>
	<p><%@ include file="footer.html" %></p>
</body>
</html>