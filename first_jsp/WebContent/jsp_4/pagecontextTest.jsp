<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP pagecontextTest.jsp</title>
</head>
<body>
	<% 
		pageContext.forward("pagecontextTest2.jsp");

	/*
	1. forward() : 요청과 응답의 제어권을 다른 페이지로 넘기더라도 주소가 
	변하지 않는다.
	
	포워드 방식은 현재 페이지의 요청과 응답의 정보에 대한 제어권만이 다른페이지로
	넘어가므로 요청 정보와 응답정보가 유지되는 장점이 잇다.
	
	2. sendRidirect() : 브라우저에 표시되는 주소가 바뀌는 방식.
	
	이동할 페이지로 요청과 응답 객체를 새로 생성하여 전송하므로 요청 정보와 응답정보가
	유지되지 않는 특성이 있다.
	*/
	%>
	
</body>
</html>