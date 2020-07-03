<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, studentbean.StudentEntity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈즈 StudentDatabaseCP를 이용한 테이블 student 조회 프로그램</title>
</head>
<body>
<h2>자바 빈즈 StudentDatabaseCP를 이용한 테이블 student 조회 프로그램</h2>
<hr size="5" color="red" />
<h2>학생정보 조회</h2>
	<jsp:useBean id="stdtdb" class="studentbean.StudentDatabaseCp"></jsp:useBean>
	<%
		ArrayList<StudentEntity> list = stdtdb.getStudentList();
		int counter = list.size();
		if(counter > 0){
	%>
	<table width="100%" border="2" cellpadding="1">
		<tr>
			<td align="center"><b>아이디</b></td>
			<td align="center"><b>암호</b></td>
			<td align="center"><b>이름</b></td>
			<td align="center"><b>입학년도</b></td>
			<td align="center"><b>학번</b></td>
			<td align="center"><b>학과</b></td>
			<td align="center"><b>휴대폰1</b></td>
			<td align="center"><b>휴대폰2</b></td>
			<td align="center"><b>주소</b></td>
			<td align="center"><b>이메일</b></td>
			<td align="center"><b>성별</b></td>
		</tr>
	<%
		for(StudentEntity stdt : list){
	%>
	<tr>
		<td><%= stdt.getId() %></td>
		<td><%= stdt.getPasswd() %>
		<td><%= stdt.getName() %></td>
		<td><%= stdt.getYear() %></td>
		<td><%= stdt.getSnum() %></td>
		<td><%= stdt.getDepart() %></td>
		<td><%= stdt.getMobile1() %></td>
		<td><%= stdt.getMobile2() %></td>
		<td><%= stdt.getAddress() %></td>
		<td><%= stdt.getEmail() %></td>
		<td><%-- <%
			if(stdt.getSnum().charAt(0) == '1'){
				out.print("남자");
			}else{
				out.print("여자");
			} %>--%>
			<%= stdt.getGender() %>
		
	</tr>
	<%}
	}
	%>
	<hr size="5" color="red" />
	조회된 학생수 가 <%= counter %> 명 입니다.
	
</body>
</html>