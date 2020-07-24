<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<form action="./MemberJoinAction.me" name="joinform" method="POST">
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">
					<b><font size="5">회원가입 페이지</font></b>
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
				<td>이름 : </td>
				<td><input type="text" name="MEMBER_NAME" /></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="MEMBER_AGE" /></td>
			</tr>
			<tr>
				<td>성별 : </td>
				<td>
					<input type="radio" name="MEMBER_GENDER" value="남" checked />남자
					<input type="radio" name="MEMBER_GENDER" value="여"/>여자
				</td>
			</tr>
			<tr>
				<td>이메일 주소 : </td>
				<td><input type="email" name="MEMBER_EMAIL"  size="30"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">다시작성</a>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>