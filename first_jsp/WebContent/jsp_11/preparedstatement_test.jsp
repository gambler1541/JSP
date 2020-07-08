<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<% 
	Connection conn = null;
	String sql ="INSERT INTO student_1 (num, name) values (?,?)";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		for(int i =3; i<=9; i++){
			pstmt.setInt(1, i);
			pstmt.setString(2, "강길동" + i);
			if(pstmt.executeUpdate()!=0){
				out.print("<hr color='green' size='5'>");
				out.print("<h3>"+i+"번 레코드를 등록하였습니다.</h3>");
			}
		}
	} catch(Exception e){
		out.println("<hr color='red' size='5'>");
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
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

</body>
</html>