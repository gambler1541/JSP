<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터페이스 ResultSetMetaData 이용</title>
</head>
<body>
	<h2>테이블 student의 테이블 메타데이터 조회 프로그램</h2>
	<hr size="5" color="red" />
	<h2>인터페이스 ResultMetaData 이용</h2>
<% 
	Connection con = null;
	Statement stmt = null;
	
	// mysql을 썼을때 드라이브
	// String driverName = "org.gjt.mm.mysql.Driver";
	// String driverName = "com.mysql.Driver";
	// String dbURL = "jdbc:mysql://localhost:3306/univdb"; 
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@localhost:1521:ORCL";
	
	try{
		Class.forName(driverName);
		con =DriverManager.getConnection(dbURL, "scott", "tiger");
		stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("select * from student");
		ResultSetMetaData rsmd = result.getMetaData();
		int cCount = rsmd.getColumnCount();
%>
<table width="100%" border="2">
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
	</tr>
	<tr>
<% 
	for(int i = 1; i<= cCount; i++){
%>
	<td align="center"><%= rsmd.getColumnName(i) %></td>
<%
	}
%>
	</tr>
	<tr>2
<%
	for(int i = 1; i<=cCount; i++){
%>
	<td align="center"><%= rsmd.getColumnTypeName(i) %></td>
<%
	}
%>
	</tr>
	<tr>
<%
	for(int i = 1; i<=cCount; i++){
%>	
	<td align="center"><%= rsmd.getPrecision(i) %></td>
<%
	}
%>
	</tr>
	<tr>
<%
	for(int i = 1; i<= cCount; i++){
%>
	<td align="center"><%= i %></td>
<%
	}
%>
	</tr>
<%
	result.close();
	}
	catch(Exception e){
		out.println("Oracle 데이터베이스 scott의 student 조회에 문제가 생겼습니다.");
		out.println(e.toString());
		e.printStackTrace();
	}
	finally{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	}
%>
</table>
</body>
</html>