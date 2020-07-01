<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<% 
	String uploadPath = request.getRealPath("/upload");
	
	int size = 10*1024*1024;
	String name = "";
	String subject="";
	String filename1="";
	String filename2="";
	String filename3="";
	String origfilename1="";
	String origfilename2="";
	String origfilename3="";

	try{
		MultipartRequest multi = new MultipartRequest(
				request, uploadPath, size,
				"UTF-8", new DefaultFileRenamePolicy());
		
		/*
			MultipartRequest multi = new MultipartRequest(
					1,
					2,
					3,
					4,
					5);
		1. request 대입
		2. 업로드할 경로
		3. 한번에 업로드 가능한 용량
		4. 제목, 인코딩시킬때(UTF-8)
		5. 중복 이름 정책
		*/
		
		
		
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration<String> files = multi.getFileNames();
		
		String file1 = files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);
		
		String file2 = files.nextElement();
		filename2 = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2);
		
		String file3 = files.nextElement();
		filename3 = multi.getFilesystemName(file3);
		origfilename3 = multi.getOriginalFileName(file3);
		
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="fileCheck.jsp" name="filecheck" method="post">
	<input type="hidden" name="name" value="<%= name %>" />
	<input type="hidden" name="subject" value="<%= subject %>" />
	<input type="hidden" name="filename1" value="<%= filename1 %>" />
	<input type="hidden" name="filename2" value="<%= filename2 %>" />
	<input type="hidden" name="origfilename1" value="<%= origfilename1 %>" />
	<input type="hidden" name="origfilename2" value="<%= origfilename2 %>" />
	<input type="hidden" name="origfilename3" value="<%= origfilename3 %>" />
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>