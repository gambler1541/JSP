<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% session.setAttribute("id", request.getParameter("id")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : sessionLogin2.jsp</title>
</head>
<body>
	<h3>로그인되었습니다.</h3>
	<h3>로그인 아이디 : <%= request.getParameter("id") %></h3>
	
	<a href="sessionLogout.jsp">로그아웃</a>
	<a href="main.jsp">메인으로</a>
</body>
</html>