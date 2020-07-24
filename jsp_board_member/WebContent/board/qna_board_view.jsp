<%@page import="net.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("MEMBER_ID"); 
	BoardBean board = (BoardBean)request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
</head>
<body>
<input type="hidden" name="ID" value="<%= id %>" />
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0" align="center">
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12" height="16">
			<div align="center"">제 목&nbsp;&nbsp;</div>
		</td>
		<td style="font-family:돋움; font-size:12">
			<%= board.getBOARD_SUBJECT() %>
		</td>
	</tr>
	<tr bgcolor="aliceblue">
		<td colspan="2" style="height:1px"></td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12" height="16">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋움; font-size:12">
			<table border="0" width="490" height="250" style="table-layout:fixed">
				<tr>
					<td valign="top" style="font-family:돋움; font-size:12">
						<%= board.getBOARD_CONTENT() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td style="font-family:돋움; font-size:12">
			<%if(!(board.getBOARD_FILE()==null)){ %>
				<a href="./boardupload/<%= board.getBOARD_FILE() %>">
					<%= board.getBOARD_FILE() %>
				</a>
			<%} %>
		</td>
	</tr>
	<tr bgcolor="red">
		<td colspan="2" style="height:1px;"></td>
	</tr>	
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size="2">
				<a href="./BoardReplyAction.bo?num=<%= board.getBOARD_NUM() %>">[답변]</a> &nbsp;&nbsp;
				<a href="./BoardModify.bo?num=<%= board.getBOARD_NUM() %>">[수정]</a> &nbsp;&nbsp;
				<a href="./BoardDeleteAction.bo?num=<%= board.getBOARD_NUM() %>">[삭제]</a> &nbsp;&nbsp;
				<a href="./BoardList.bo">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</body>
</html>