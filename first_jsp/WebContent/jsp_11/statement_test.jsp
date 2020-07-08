
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Connection conn = null;
	String sql = "INSERT INTO student_1(num,name) VALUES (3,'강길동')"; 

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		
		int result = stmt.executeUpdate(sql);
		
		if(result != 0){
			out.println("<hr color='green' size='5'> ");
			out.println("<h3>레코드가 등록되었습니다.</h3> ");
		} 
	} catch(Exception e){
			out.println("<hr color='red' size='5'> ");
			out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
			e.printStackTrace();
	}
%>
</body>
</html>