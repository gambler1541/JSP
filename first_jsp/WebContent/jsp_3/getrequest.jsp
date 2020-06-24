<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 getreuqest.jsp</title>
</head>
<body>
	<h2>메소드 get 방식에서 한글처리</h2>
	
	<hr size="5" color="red" />
	한글 성명 : <%= request.getParameter("korname") %> <br />
	영문 성명 : <%= request.getParameter("engname") %>
</body>
</html>