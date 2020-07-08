<%@page import="java.util.ArrayList"%>
<%@page import="postbean.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="postDB" class="postbean.PostDBCP" scope="page" />
<%
	ArrayList<PostBean> postlist = postDB.getList();
%>
<h2>게시판 입니다.</h2>
<table align="center" border="1" width="100%">
	<tr>
		<th>ID</th>
		<th>제목</th>
		<th>작성자</th>
		<th>주소</th>
		<th>작성일</th>
		<th>전자메일</th>
	</tr>
<% 
	for(PostBean post : postlist){
%>
	<tr>
		<td align="center"><a href="postedit.jsp?id=<%= post.getId() %>"> <%= post.getId() %> </a></td>
		<td align="center"><%= post.getTitle() %></td>
		<td align="center"><%= post.getName() %></td>
		<td align="center"><%= post.getAddr() %></td>
		<td align="center"><%= post.getRegdate() %></td>
		<td align="center"><%= post.getEmail() %></td>
	</tr>
<%
	}
%>
</table>
<hr size="5" color="green">
<form action="postedit.jsp" method="post">
	<input type="submit" value="글쓰기" />
</form>
</body>
</html>