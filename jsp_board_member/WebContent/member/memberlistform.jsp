<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List memberlist = (List)request.getAttribute("memberlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판 memberlist(admin으로 로그인)</title>
</head>
<body>
	<table border="1" width="300" align="center">
		<tr align="center">
			<td colspan="2">
				회원 목록
			</td>
		</tr>
		<%
			for(int i = 0; i < memberlist.size(); i++){
				MemberBean member = (MemberBean)memberlist.get(i);
		%>
		<tr align="center">
			<td>
				<a href="MemberViewAction.me?id=<%= member.getMEMBER_ID() %>"><%= member.getMEMBER_ID() %></a>
			</td>
			<td>
				<a href="MemberDeleteAction.me?id=<%= member.getMEMBER_ID() %>">[삭제]</a>
			</td>
		</tr>
		<% } %>
		<tr align="center">
			<td colspan="2">
				<a href="./BoardList.bo">[게시판 이동]</a>
			</td>
		</tr>
	</table>
</body>
</html>