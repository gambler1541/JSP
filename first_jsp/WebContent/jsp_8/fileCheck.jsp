<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
	String origfilename1 = request.getParameter("origfilename1");
	String origfilename2 = request.getParameter("origfilename2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
올린 사람 : <%= name %> <br />
제목 : <%= subject %> <br />
파일명 1: <a href="file_down.jsp?file_name=<%=filename1%>"><%=origfilename1 %></a> <br>
파일명 2: <a href="file_down.jsp?file_name=<%=filename2%>"><%=origfilename2 %></a>
</body>
</html>