<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 로그인 페이지</title>
</head>
<body>

<form action="loginProcess.jsp" name="loginform" method="post">
	<table border="1">
		<tr>
			<td colspan="2" align="center">
				<b><font size="5">로그인 페이지</font></b>
			</td>
		</tr>
		<tr>
			<td>아이디 :</td>
			<td><input type="text" name="id"  /></td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td><input type="password" name="pass" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
				<a href="joinForm.jsp">회원가입</a>
			 </td>
		</tr>
	</table>
</form>

</body>
</html>