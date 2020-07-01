<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="beantest" class="javabean.BeanTest" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="beantest"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : beantest_1.jsp</title>
</head>
<body>
<h1>자바빈 속성 값 출력</h1>
<b>이름 1 : </b><%= beantest.getName() %>
<br />
<b>이름 2 : </b><jsp:getProperty property="name" name="beantest"/>
<br />
<b>주소 : </b><%= beantest.getAddr() %>
<br />
<b>이메일 주소 : </b> <%= beantest.getEmail()%>
<br />
<b>전화번호 : </b> <%= beantest.getTel() %>
<br />
<b>생년월일 : </b> <%= beantest.getBirthday() %>
<br />
</body>
</html>