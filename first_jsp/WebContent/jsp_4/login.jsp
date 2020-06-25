<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP login.jsp</title>
</head>
<body>
	<h2>로그인 예제</h2>
	<% 
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String tel = request.getParameter("tel");
	%>
	<%
		if(userid.equals("")){
	%>
		<jsp:include page="loginhandler.jsp">
			<jsp:param name="userid" value="guest"/>
			<jsp:param name="passwd" value="anonymous"/>
			<jsp:param name="tel" value="01045191005"/>
		</jsp:include>
	<%
		}else{
	%>
		<jsp:include page="loginhandler.jsp" />
	<%
		}	
	%>
</body>
</html>