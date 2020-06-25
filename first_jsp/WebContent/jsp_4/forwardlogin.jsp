<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP forwardlogin_1.jsp</title>
</head>
<body>
	<h2>forward 태그를 이용한 로그인 예제</h2>
	<% 
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
	%>
	<%
		if(userid==null && passwd==null){
	%>
	
	<jsp:forward page="forwardhandler.jsp"/>
	
	<%
		} else{
	%>
	<jsp:forward page="forwardhandler.jsp">
		<jsp:param name="snum" value="2020-0625"/>
	</jsp:forward>
	<%
		}	
	%>
</body>
</html>