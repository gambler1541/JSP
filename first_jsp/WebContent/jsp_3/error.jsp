<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
</head>
<body>
<%@ page isErrorPage="true" %>
<h1>예외 처리 페이지</h1>

오류 문자열[exception.toString()] : <%=exception.toString() %><br>
오류 메시지[exception.getMessage()] : <%=exception.getMessage() %>
<div>
	<img src="../img/fix.png" alt="에러 수정 중 입니다." />
</div>
</body>
</html>