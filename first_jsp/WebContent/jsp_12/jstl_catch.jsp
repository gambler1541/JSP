<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core tag : catch</title>
</head>
<body>
<h2>JSTL Core Tag : catch</h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="errMessage">
	<%= 2/ 0 %>
</c:catch>

<p/>

<c:if test="${!(empty errMessage)}">
	예외가 발생하였습니다. 예외 메시지 : 
	<hr size="5" color="green" width="50%" />
	${errMessage}
</c:if>

</body>
</html>