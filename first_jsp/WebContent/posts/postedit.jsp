<%@page import="postbean.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="postscript.js"></script>
<style>
table{
		width: "100%";
		text-align: "center"
	}
</style>
<body>
<jsp:useBean id="postDB" class="postbean.PostDBCP" scope="page" />
<%
	String name = "";
	String email = "";
	String title = "";
	String content = "";
	String addr ="";
	String headline = "등록";
	String id = request.getParameter("id");
	
	if(id != null){
		int idnum = Integer.parseInt(id);
		PostBean post = postDB.getPost(idnum);
		
		name = post.getName();
		email = post.getEmail();
		title = post.getTitle();
		content = post.getContent();
		addr = post.getAddr();
		headline = "수정/삭제";
	}
%>

<h2>게시글 <%= headline %></h2>
<hr size="5" color="blue" />
<form action="postprocess.jsp" method="post" name="postform">
	<input type="hidden" name="id" value="<%= id %>"/>
	<input type="hidden" name="menu" value="insert"/>
	<table>
		<tr>
			<td>이름 :
				<input type="text" value="<%= name %>" name="name" />
				&nbsp;&nbsp;&nbsp;이메일 : 
				<input type="email" value="<%= email %>" name="email" />
				&nbsp;&nbsp;&nbsp;주소 : 
				<input type="text" value="<%=addr%>" name="addr" />
			</td>
			
		</tr>
		<tr>
			<td colspan="2">제목 : 
				<input type="text" value="<%= title %>" size="80" name="title" />
			</td>		
		</tr>
		<tr>
			<td colspan="2"> 
				<textarea name="content" id="content" cols="100" rows="10"><%= content %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr size="5" color="red"></td>
		</tr>
		<tr>
			<td>
			비밀번호 : <input type="password" name="passwd"/>
			<font color="red">비밀번호를 입력하지 않으면 <%= headline %>되지 않습니다.</font>
			</td>
		</tr>
	</table>
	<% if(id != null){ %>
		<input type="button" value="수정" name="edit" onclick="editpost()"/>
		<input type="button" value="삭제" name="delete" onclick="deletepost()"/>
	<% }else{ %>
		<input type="button" value="글쓰기" name="create" onclick="createpost()" />		
	<% } %>
		<input type="reset" value="취소" />
		<input type="button" value="목록"onclick="location.href='postlist.jsp'" />
</form>
</body>
</html>