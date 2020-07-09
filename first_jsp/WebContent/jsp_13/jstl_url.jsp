<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core : url</title>
</head>
<body>
<h2>JSTL Core Tag : url</h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="ph1" value="paramhandle.jsp" />
<c:url var="ph2" value="paramhandle.jsp">
	<c:param name="user" value="hong"/>
</c:url>

\${ph1} = ${ph1 }
<a href="${ph2 }">${ph2 }</a>

<%--
	<c:url var="site" value="/userEl.jsp" context="/ch12" />
	<a href="${site}">${site}</a>
 --%>
</body>
</html>