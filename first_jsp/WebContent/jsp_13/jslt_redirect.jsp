<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core : redirect</title>
</head>
<body>
<h2>JSTL Core Tag : redirect</h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:redirect url="paramhandle.jsp">
	<c:param name="user" value="해바라기" />
</c:redirect>>

<!--  
	태그 redirect는 속성 url에 지정된 페이지로 이동시키는 태그이다.
	그러므로 redirect 태그는 내장 객체를 이용한 response.sendRedirect()와
	액션태그 &lt;jsp:forward> 기능과 유사하다.
 -->
</body>
</html>