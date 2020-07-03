<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 예제 : 테이블 student name으로 조회</title>
</head>
<body>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<h2>테이블 student에서 이름으로 조회하는 프로그램</h2>
<hr size="5" color="cyan" />
<h2>학생정보 조회</h2>
<% 
	Connection con = null;
	PreparedStatement pstmt = null;
	int year = Integer.parseInt(request.getParameter("year"));
	String sql = "select * from student where year= ?" ;
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@localhost:1521:ORCL";
	// String name = "%" +request.getParameter("sname") + "%";
	
	int rowCount = 0;
	
	try{
		Class.forName(driverName); // 드라이버 로드
		con = DriverManager.getConnection(dbURL,"scott","tiger"); // 데이터베이스 연결
		pstmt = con.prepareStatement(sql); // statement 객체를 만든다(쿼리를 담아서 실행 할 수 있는객체)
		pstmt.setInt(1, year);
		ResultSet result = pstmt.executeQuery(); // 쿼리를 날림
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
		while(result.next()){ // ResultSet으로 저장된 데이터를 뽑아온다.
	%>
	<tr>
		<td align="center"><%=result.getString(1) %></td>
		<td align="center"><%=result.getString(2) %></td>
		<td align="center"><%=result.getString(3) %></td>
		<td align="center"><%=result.getInt(4)%></td>
		<td align="center"><%=result.getString(5)%></td>
		<td align="center"><%=result.getString(6)%></td>
		<td align="center"><%=result.getString(7)%></td>
		<td align="center"><%=result.getString(8)%></td>
		<td align="center"><%=result.getString(9)%></td>
		<td align="center"><%=result.getString(10)%></td>
	</tr>
		
	<%
			rowCount++;
		}
		result.close();
	}
	catch(Exception e){
		out.println("Oracle 데이터베이스 scott의 student 조회에 문제가 있습니다.");
		out.println(e.toString());
		e.printStackTrace();
	}
	finally{
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
%>
</table> 
<p><hr size="5" color="#dd6688" />
<font color="blue">
	<%
		if(rowCount == 0)
			out.println("조회된 결과가 없습니다");
		else
			out.println("조회된 결과가 " + rowCount + "건 입니다.");
			
	%>
</font>
</body>
</html>