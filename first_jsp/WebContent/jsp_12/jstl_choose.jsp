<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core tag : choose</title>
</head>
<body>
<h2>JSTL Core Tag : choose</h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="today" value="<%= new java.util.Date() %>" />
<c:choose>
	<c:when test="${today.hours < 12}">
		Good Morning!
	</c:when>
	<c:when test="${today.hours < 18 }">
		Good afternoon!
	</c:when>
	<c:otherwise>
		Good evening
	</c:otherwise>
</c:choose>

<hr size="5" color="cyan" />

<c:set var="count" value="3" />
<c:choose>
	<c:when test="${count <= 0 }">
		일치하는 것이 하나도 없습니다.
	</c:when>
	<c:otherwise>
		일치하는 것이 ${count }개 있습니다.
	</c:otherwise>
</c:choose>
<hr size="5" color="red" />
<c:set var="name" value="박명배" />

	<c:if test="${name ne '최우석' }" />
		최우석이 아닙니다.

</body>
</html>