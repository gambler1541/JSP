<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}else{
		out.println("<script>");
		out.println("location.href='loginform.jsp'");
		out.println("</script>");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 시스템 메인 페이지</title>
</head>
<body>
<h3><%= id %>로 로그인 하셨습니다.</h3>
<hr size="5" color="cyan"/>
<% if(id.equals("admin")){ %>
<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
<%} %>
</body>
</html>