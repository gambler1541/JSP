<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%

	Connection conn = null;
	String sql = "SELECT * FROM student_1";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.println("<h3>"+rs.getInt("num") + "," +rs.getString("name")+"</h3>");
		}
		rs.close();
	}catch(Exception e){
		out.println("<hr color='red' size='5'>");
		out.println("<h3> 데이터 가져오기에 실패하였습니다. </h3>");
		e.printStackTrace();
	} 
%>