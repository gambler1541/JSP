<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : addCookie.jsp</title>
</head>
<body>
	<h1>쿠키 만들기 예제</h1>
	<hr size="5" color="red" />
	Cookie cookie = new Cookie("user", "kang"); <br>
	cookie.setMaxAge(2*60); <br />
	response.addCookie(cookie); <br>
	<%
	Cookie cookie = new Cookie("user", "kang");
	cookie.setMaxAge(2*60);
	response.addCookie(cookie);
	%>
	
	<hr size="5" color="cyan" />
	<a href="addtimecookie.jsp">현재 접속 시간을 쿠키로 추가</a>
</body>
</html>