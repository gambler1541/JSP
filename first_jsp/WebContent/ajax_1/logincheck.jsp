<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logincheck.jsp Test</title>
</head>
<body>
입력한 아이디는 ${param.username }이며
<c:choose>
	<c:when test="${param.username=='admin' && param.password=='1234' }">
		당신은 접근 권한이 있습니다.
	</c:when>
	<c:otherwise>
		죄송합니다. 당신은 접근 권한이 없습니다.
	</c:otherwise>
</c:choose>
</body>
</html>