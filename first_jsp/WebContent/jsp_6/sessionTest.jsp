<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name, age, addr;
	if(session.getAttribute("name")!=null){
		name=(String)session.getAttribute("name");
		age = (String)session.getAttribute("age");
		addr = (String)session.getAttribute("addr");
	}else{
		name="세션 값 없음";
		age = (String)session.getAttribute("age");
		addr = (String)session.getAttribute("addr");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP예제 : sessionTest.jsp</title>
</head>
<body>
	<h2>세션 값 테스트</h2>
	<input type="button" onclick="location.href='sessionSet.jsp'" value="세션 값 저장" />
	<input type="button" onclick="location.href='sessionDel.jsp'" value="세션 값 삭제"/>
	<input type="button" onclick="location.href='sessionInvalidate.jsp'" value="세션 값 초기화" />
	<h3><%= name %><br>
		<%= age %><br>
		<%= addr %>
	</h3>
	
</body>
</html>