<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postrequest.jsp</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
	<h2>메소드 post 방식에서 한글 처리</h2>
	<hr size="5" color="red" />
	한글 성명 : <%= request.getParameter("korname")%> <p></p>
	영문 성명 : <%= request.getParameter("engname") %> <p></p>
</body>
</html>