<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Test </title>
</head>
<body>

<% 
	Boolean res = (Boolean)request.getAttribute("resultlogin");
	String userid = request.getParameter("userid");
	if(res.booleanValue()){
		out.println("사용자 " + userid + "님, 로그인 하셨습니다. 반갑습니다.");
	}else{
		out.println("사용자 " + userid + "님, 암호 또는 전화번호가 다릅니다. ");
	}
%>

<hr size="5" color="red"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="result" value="${requestScope.resultlogin }" />
<c:choose>
	<c:when test="${result }">
		사용자 ${param.userid }님, 로그인 하셨습니다. 반갑습니다.
	</c:when>
	<c:otherwise>
		사용자 ${param.userid }님, 암호 또는 전화번호가 다릅니다.
		<jsp:include page="index.html"/>
	</c:otherwise>
</c:choose>
</body>
</html>