<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<form action="./MemberLoginAction.me" name="loginform" method="post">
	<table border="1" align="center">
		<tr>
			<td colspan="2" align="center">
				<b><font size="5">로그인 페이지</font></b>
			</td>
		</tr>
		<tr>
			<td>아이디 : </td>
			<td><input type="text" name="MEMBER_ID" /></td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td><input type="password" name="MEMBER_PW" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:loginform.submit()">로그인</a>
				<a href="MemberJoin.me">회원가입</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>