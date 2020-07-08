<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="postdb" class="postbean.PostDBCP" scope="page" />
<jsp:useBean id="post" class="postbean.PostBean" scope="page" />

<%= post.getAddr() %>
<%= post.getName() %>
<%= post.getPasswd() %>
<%= post.getRegdate()%>
<%= post.getContent() %>
<%= post.getId() %>
<%= post.getTitle() %>

<%
	String menu = request.getParameter("menu");

	if(menu.equals("edit") || menu.equals("delete")){
		int id = Integer.parseInt(request.getParameter("id"));
		String passwd = request.getParameter("passwd");
		
		if(!postdb.is_passwd(id, passwd)){
%>
<script>
	alert("비밀번호가 다릅니다.");
	history.go(-1);
</script>
<%
		}else{
			if(menu.equals("edit")){
				postdb.editPost(post);
			}else if(menu.equals("delete")){
				postdb.deletePost(id);
			}
			response.sendRedirect("postlist.jsp");
		}
	}else if(menu.equals("create")){
%>
	<jsp:setProperty property="name" name="post"/>
	<jsp:setProperty property="title" name="post"/>
	<jsp:setProperty property="email" name="post"/>
	<jsp:setProperty property="content" name="post"/>
	<jsp:setProperty property="passwd" name="post"/>
	<jsp:setProperty property="addr" name="post"/>
<% 
		postdb.createPost(post);
	}
	response.sendRedirect("postlist.jsp");
%>
</body>
</html>