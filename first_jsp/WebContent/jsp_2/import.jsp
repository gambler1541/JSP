<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 import.jsp</title>
</head>
<body>
	<h2>page 지시자의 import 속성</h2>
	<%@ page import="java.util.Date" %>
	현재 시각 : <%= new Date().toLocaleString() %> <br />
	현재 시각 : <%= new java.util.Date().toString() %>
	
	<%-- import 속성은 Java의 import 문장을 대체하는 속성으로
		    이용할 클래스를 지정하는 방법이다.
	
	일반 자바 프로그램과 같이 JSP 페이지는 패키지 java.lang.* 를 
	import 할 필요가 없으며 서블릿에서 기본적으로 제공되는 패키지인
	javax.servlet.* , javax.servlet.http.*, 
	javax.servlet.jsp.* 도 import 할 필요가 없다.
	  --%>
</body>
</html>