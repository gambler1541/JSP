<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Tag : import</title>
</head>
<body>
	<h2>JSTL Core Tag : import</h2>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:import url="./jstl_if.jsp" />
	
	<c:import url="./jstl_choose.jsp" var="choose" />
	${choose }
	
	<c:import url="./paramhandle.jsp" >
		<c:param name="user" value="kang"/>
	</c:import>
	
<p/>
<hr size="5" color="red" />
<p/>
<%-- <c:import url="http://java.sun.com/products/jsp/jstl/1.1/docs/tlddocs/c/import.html" var="java"/>  --%>
<%--${java } --%>
	
</body>
</html>