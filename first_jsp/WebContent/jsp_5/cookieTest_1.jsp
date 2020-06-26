<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie cookie = new Cookie("name", request.getParameter("id"));
   cookie.setMaxAge(60);
   response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : cookieTest_1.jsp</title>
</head>
<body>
	<h2><%= cookie.getName() %></h2>
	<h2><%= cookie.getValue() %></h2>
	<h2><%= cookie.getMaxAge() %></h2>
	
	<a href="cookieTest2.jsp">쿠키 값 불러오기</a>
</body>
</html>