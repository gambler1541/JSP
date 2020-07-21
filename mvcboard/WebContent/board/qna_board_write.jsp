<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>

<script>
	function addBoard(){
		boardform.submit();
	}
</script>

</head>
<body>
	<!--  게시판 등록 -->
	<form action="./BoardAddAction.bo" method="post" enctype="multipart/form-data" name="boardform">
		<table>
			<tr align="center" valign="middle">
				<td colspan="2">MVC 게시판</td>
			</tr>
			<tr>
				<td style="font-family:돋움 ;font-size:12pt">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<input type="text" name="BOARD_NAME" size="10" maxlength="10" value="" />
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12pt;" height="16">
					<div align="center">비밀번호</div>
				</td>
				<td>
					<input type="password" name="BOARD_PASS" size="10" maxlength="10" value="" />
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12pt" height="16">
					<div align="center">제 목</div>
				</td>
				<td>
					<input type="text" name="BOARD_SUBJECT" size="50" maxlength="100" value=""/>
				</td>	
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12pt;" height="16">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12pt;" height="16">
					<div align="center">파일 첨부</div>
				</td>
				<td>
					<input type="file" name="BOARD_FILE" />
				</td>
			</tr>
			<tr bgcolor="#cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;
				</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="2">
					<a href="javascript:addBoard()">[등록]</a> &nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>