<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core : set</title>
</head>
<body>
<h2>JSTL Core Tag : set</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="foo" value="set Tag 테스트 입니다."/>
\${foo} = ${foo } <br />

<c:set var="n">
24
</c:set>
\${n} = ${n} <br />

<c:set var="d">
31.54
</c:set>
\${d } = ${d } <br />
\${n + b } = ${n+b } <br />

<c:set var="b" value="true" />
\${!b} = ${!b } <br />

<c:set var="str" value="Hello set Tag!!" scope="session" />
\${str}=${str } <br />
\${sessionScope.str } = ${sessionScope.str} <br />

<c:set var="kbs" value="박명배" />
\${kbs} = ${kbs} <br />

<c:set var="mbc">
박명배
</c:set>

\${mbc} = ${mbc }
</body>
</html>