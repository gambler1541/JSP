<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP예제 out.jsp</title>
</head>
<body>
	<% 
		out.println("이 부분은 출력되지 않습니다.");
		out.clear(); //버퍼의 내용물 제거
	%>
	<h2>현재 페이지의 출력 버퍼 상태</h2>
	
	초기 출력 버퍼 크기 : <%= out.getBufferSize()%> byte<p>
	남은 출력 버퍼 크기 : <%= out.getRemaining() %> byte<p>
</body>
</html>