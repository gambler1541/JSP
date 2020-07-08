<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Tag : forEach</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>배열 처리</h3>
<c:set var="score" value="<%= new int[]{95, 88, 77, 45, 99} %>"/>

<c:forEach var="point" items="${score }">
	\${point } = ${point } <br />
	<c:set var="sum" value="${sum + point }"/>
</c:forEach> 
합 = ${sum } <br />

<h3>1부터 100까지 합</h3>
<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum+ i }"/>
</c:forEach>

결과 = ${sum }

<c:set var="sum" value="0" />
<h3> 1부터 100까지 짝수 합 </h3>
<c:forEach var="i" begin="2" end="100" step="2">
	<c:set var="sum" value="${sum+i }"/>
</c:forEach>
결과 = ${sum }

<c:set var="sum" value="0" />
<h3> 1부터 100까지 홀수 합</h3>
<c:forEach var="i" begin="1" end="100" step="2">
	<c:set var="sum" value="${sum+i }"/>
</c:forEach>
결과 = ${sum }

<h3>1부터 100까지 3의 배수 합</h3>
<c:set var="sum" value="0" />
<c:forEach var="i" begin="3" end="100" step="3">
	<c:set var="sum" value="${sum +i }"/>
</c:forEach>
결과 = ${sum }

<h3>Map인 sessionScope 처리</h3>
<c:set target="${sessionScope }" property="name" value="홍길동" />
<c:set target="${sessionScope }" property="id" value="dong" />
<c:set target="${sessionScope }" property="passwd" value="1234" />
<c:forEach var="i" items="${sessionScope }">
	${i.key } = ${i.value } <br />
</c:forEach>
</body>
</html>