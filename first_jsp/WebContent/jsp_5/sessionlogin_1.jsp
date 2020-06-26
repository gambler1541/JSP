<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Login Test</title>

<style>
	#loginArea{
		width : 400px;
		margin : auto;
		border : 1px solid black;
	}
	table {
		margin : auto;
	}
	td {
		text-align: center;
	}
</style>

</head>
<body>
	<section id="loginArea">
	<!--  <section>요소는 HTML 문서의 독립적인 구획을 나타내며,
		더 적합한 의미를 가진 요소가 없을 때 사용합니다.
		보통<section>은 제목을 포함하지만, 항상 그런것은 아닙니다.
		 -->
		 <form action="sessionLogin2.jsp" method="post">
		<table>
			<tr>
				<td><label for="id">아이디 :</label></td>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호 :</label></td>
				<td><input type="password" name="pw" id="pw" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" />
					<input type="reset" value="다시 작성" />
				</td>
			</tr>
		</table>
		</form>
	</section>
</body>
</html>