<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP 이용 : 테이블 student 레코드 삽입</title>
</head>
<body>
	
	<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
	<h2>데이터베이스 scott의 테이블 student에 학생 삽입 프로그램</h2>
	<hr size="5" color="red" />
	<h2>학생 삽입</h2>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		StringBuffer SQL = new StringBuffer("insert into student ");
		SQL.append("values(?,?,?,?,?,?,?,?,?,?)");
		String name = "백일홍";
		
		try{
			
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(SQL.toString());
			
			// 삽입할 학생 레코드 입력
			pstmt.setString(1, "DBCP1");
			pstmt.setString(2, "commons");
			pstmt.setString(3, name);
			pstmt.setInt(4, 2020);
			pstmt.setString(5, "1039653");
			pstmt.setString(6, "전산정보과");
			pstmt.setString(7, "010");
			pstmt.setString(8, "2398-9750");
			pstmt.setString(9, "인천시");
			pstmt.setString(10, "dbcp@gmail.com");
			
			int rowCount = pstmt.executeUpdate();
			if(rowCount == 1) out.println("<hr color='red' size='5'>학생[" + name + "] 레코드 하나가 성공적으로 삽입되었습니다.<hr color='cyan' size='5'>");
			else out.println("학생 레코드 삽입에 문제가 있습니다.");
			
			//다시 학생 조회
			stmt = conn.createStatement();
			ResultSet result =  stmt.executeQuery("select * from student");
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
		<%
			while(result.next()){
		%>
		<tr>
			<td align="center"><%= result.getString(1) %></td>
			<td align="center"><%= result.getString(2) %></td>
			<td align="center"><%= result.getString(3) %></td>
			<td align="center"><%= result.getString(4) %></td>
			<td align="center"><%= result.getString(5) %></td>
			<td align="center"><%= result.getString(6) %></td>
			<td align="center"><%= result.getString(7) %></td>
			<td align="center"><%= result.getString(8) %></td>
			<td align="center"><%= result.getString(9) %></td>
			<td align="center"><%= result.getString(10) %></td>
		</tr>
		<% 
			}
		result.close();
		} catch(Exception e){
			out.println("Oracle 데이터베이스의 scott의 student에 삽입 또는 조회에 문제가 있습니다.");
			out.println(e.toString());
			e.printStackTrace();
		}
		finally{
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		%>
	</table>
</body>
</html>