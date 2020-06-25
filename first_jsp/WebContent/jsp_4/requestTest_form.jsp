<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request Test</title>
<style>
	h1,#commandCell{ text-align:center;}
	
	table{
		margin : auto;
		width : 400px;
		border: 1px solid red;
	}
</style>
</head>
<body>
	<h1>Request Test</h1>
	<form method="post" action="request1.jsp">
		<table>
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" name="name" id="name" /></td>
			</tr>
			<!--  label은 폼의 양식에 이름을 붙이는 태그입니다.
				  주요 속성은 for입니다.
				  label을 클릭하면, 연결된 양식에 입력할 수 있또록 하거나 체크를 하거나
				  체크를 해제합니다.
			 -->
			<tr>
				<td><label for="gender">성별</label></td>
				<td>남 <input type="radio" name="gender" value="male" id="gender" />
				  여 <input type="radio" name="gender" value="female" /></td>
			</tr>
			<tr>
				<td><label for="hobby">취미</label></td>
				<td>
				독서<input type="checkbox" name="hobby" value="독서" id="hobby" />
				게임<input type="checkbox" name="hobby" value="게임" />
				TV시청<input type="checkbox" name="hobby" value="tv시청" />
				축구<input type="checkbox" name="hobby" value="축구" />
				기타<input type="checkbox" name="hobby" value="기타" />
				</td>
			</tr>
			<tr>
				<td><label for="mt">산</label></td>
				<td>
				한라산<input type="checkbox" name="mt" value="한라산" id="mt" />
				지리산<input type="checkbox" name="mt" value="지리산" id="mt" />
				북한산<input type="checkbox" name="mt" value="북한산" id="mt" />
				백두산<input type="checkbox" name="mt" value="백두산" id="mt" />
				</td>
			</tr>
			<tr>
				<td colspan="2" id="commandCell">
				<input type="submit" value="전송" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>