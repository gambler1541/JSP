<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member"  class="javabean.MemberBean" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>회원 정보 결과</h3>
	<hr size="5" color="red" />
	id : <jsp:getProperty property="id" name="member"/> <br>
	password : <jsp:getProperty property="password" name="member"/> <br>
	name : <jsp:getProperty property="name" name="member"/> <br>
	addr : <jsp:getProperty property="addr" name="member"/> <br>
	tel : <jsp:getProperty property="tel" name="member"/> <br>
	hobby : <jsp:getProperty property="hobby" name="member"/> <br>
</body>
</html>