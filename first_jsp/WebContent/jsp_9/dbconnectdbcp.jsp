<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jakarta DBCP를 이용한 DB scott 연결 점검 프로그램</title>
</head>
<body>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<h2>Jakarta DBCP를 이용한 DB univdb 연결 점검 프로그램</h2>
<%
	try{
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection con = ds.getConnection();
		out.println("Oracle 데이터베이스 scott에 성공적으로 접속했습니다.");
		con.close();
	}catch(Exception e){
		out.println("Oracle 데이터베이스 scott 접속에 문제가 있습니다. <HR>");
		out.println(e.getMessage());
		e.printStackTrace();
		
	}
%>

</body>
</html>