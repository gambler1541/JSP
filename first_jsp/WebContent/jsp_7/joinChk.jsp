<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="join" class="javabean.JoinBean" />
<jsp:setProperty name="join" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 입력 정보 확인 페이지</title>
<style type="text/css">
	table{
		width: 400px
	}
	h1{
		text-align: center;
	}
</style>
</head>
<body>

	<table>
		<tr>
			<td><b>아이디 : </b></td>
			<td><jsp:getProperty property="id" name="join"/></td>
			   
		</tr>
		<tr>
			<td><b>비밀번호 : </b></td>
			<td><jsp:getProperty property="pass" name="join"/></td>
		</tr>
		<tr>
			<td><b>이름 : </b></td>
			<td><jsp:getProperty property="name" name="join"/></td>
		</tr>
		<tr>
			<td><b>성별 : </b></td>
			<td><jsp:getProperty property="sex33" name="join"/></td>
		</tr>
		<tr>
			<td><b>나이 : </b></td>
			<td><jsp:getProperty property="age" name="join"/></td>
		</tr>
		<tr>
			<td><b>이메일 주소 : </b></td>
			<td><jsp:getProperty property="email" name="join"/></td>
		</tr>
	</table>
</body>
</html>