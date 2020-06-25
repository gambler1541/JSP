<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 page.jsp</title>
</head>
<body>
<%@ page info ="내장 객체 page : page 자기 자신의 객체" %>
<%= this.getServletInfo() %> <p></p>
<%=((org.apache.jasper.runtime.HttpJspBase)(page)).getServletInfo() %>

<%--
	내장 객체 page는 java에서 자기 자신을 나타내는 키워드 this로 사용한다.
	톰켓에서 this는 자료유형 org.apache.jasper.runtime.HttpJspBase의 객체로서
	메소드 getServletInfo()를 제공하며 	JSP페이지 지시자의 속성 info에 지정한 값을 저장 한다.
--%>
</body>
</html>