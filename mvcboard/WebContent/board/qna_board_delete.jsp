<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
</head>
<body>
<form name="deleteForm" action="./BoardDeleteAction.bo?num=<%= num %>" method="post">
	<table border="1">
		<tr>
			<td>
				<font size="2">글 비밀번호: </font>
			</td>
			<td>
				<input type="password" name="BOARD_PASS" />
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:deleteForm.submit()">삭제</a>
				&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">돌아가기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>