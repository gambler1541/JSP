<%@page import="net.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	BoardBean board = (BoardBean)request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
</script>
</head>
<body>
<!-- 게시판 수정 -->
<form action="BoardModifyAction.bo" method="POST" name="modifyform">
	<input type="hidden" name="BOARD_NUM" value="<%= board.getBOARD_NUM() %>"/>
	<input type="hidden" name="BOARD_ID" value="<%= id %>"/>
	
	<table align="center">
		<tr align="center" valign="middle">
			<td colspan="5">
				MVC 게시판	
			</td>
		</tr>
		<tr>
			<td height="16" style="font-family:돋움; font-size:12">
				<div align="center">제 목</div>
			</td>
			<td>
				<input type="text" name="BOARD_SUBJECT" size="50" maxlength="100" value="<%=board.getBOARD_SUBJECT() %>" />
			</td>
		</tr>
		<tr>
			<td style="font-family:돋움; font-size:12">
				<div align="center">내 용</div>
			</td>
			<td>
				<textarea rows="15" cols="67" name="BOARD_CONTENT"><%=board.getBOARD_CONTENT() %></textarea>
			</td>
		</tr>
		<% if(!(board.getBOARD_FILE()==null)){ %>
		<tr>
			<td style="font-family:돋움; font-size:12">
				<div align="center">파일 첨부</div>
			</td>
			<td>
				&nbsp;&nbsp;<%= board.getBOARD_FILE() %>
			</td>
		</tr>
		<% } %>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height:1px;">
			</td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
				<font>
					<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</font>
			</td>
		</tr>
	</table>
</form>
</body>
</html>