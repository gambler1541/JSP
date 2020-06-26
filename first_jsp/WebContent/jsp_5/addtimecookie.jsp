<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제: addttimecookie.jsp</title>
</head>
<body>
<h1>현재 시간을 쿠키로 저장</h1>
<hr size="5" color="red" />
String now = new java.util.Date().toString(); <br />
Cookie cookie = new Cookie("lastconnect", now); <br />
cookie.setMaxAge(10);  <br />
response.addCookie(cookie); <br />
	<%
		String now = new java.util.Date().toString(); 
		Cookie cookie = new Cookie("lastconnect", now);
		cookie.setMaxAge(10); // 초 단위 : 10초  
		response.addCookie(cookie);  // 쿠키 값 저장
	%>
	<hr size="8" color="#44dd99" />
	
	<a href="getcookies.jsp">쿠키 조회</a>
</body>
</html>