<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리 사용 예제</title>
</head>
<body>
<h2>JSTL Format Tag : fmt </h2>

<fmt:setLocale value="ko-KR"/>
<fmt:bundle basename="test_ko">
	<fmt:message key="name" /> <br />
	<fmt:message key="say" /> <br />
	<fmt:message key="say2" >
		<fmt:param value="박명배"/>
		<fmt:param value="백일홍"/>
	</fmt:message>

</fmt:bundle>

<p/>
<fmt:formatNumber value="50000" type="currency" /> <br /> 
<fmt:formatNumber value="0.15" type="percent" /> <br /> 
<fmt:formatNumber value="500567300" pattern="###,###,###" /> <br />
<br>
<fmt:formatDate value="${date }" type="date" /> <br /> 
<fmt:formatDate value="${date }" type="time" /> <br /> 
<fmt:formatDate value="${date }" type="both" /> <br /> 
<br>
<fmt:formatDate value="${date }" type="both" timeStyle="short" dateStyle="short" /> <br /> 
<fmt:formatDate value="${date }" type="both" timeStyle="long" dateStyle="long" /> <br /> 

</body>
</html>