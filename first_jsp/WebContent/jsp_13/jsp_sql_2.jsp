<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL TAG test</title>
</head>
<body>
	<h>JSTL SQL Tag : setDataSource, query, param</h>
	<hr /><h2>전체 학생 조회</h2>
	<sql:setDataSource var="stuDS" dataSource="jdbc/OracleDB" />
	<sql:query var="studentsRS" dataSource="${stuDS }">
		select * from student
	</sql:query>
	
	<sql:query var="studentsRS" dataSource="${stuDS }" sql="select * from student" />
	<c:forEach var="studentRow" begin="0" items="${studentsRS.rows }">
		${studentRow.id }, ${studentRow.passwd },${studentRow.name }, ${studentRow.depart } <br/>
	</c:forEach>
	
	<hr size="5" color="green" />
	<h2>컴퓨터공학과 학생 조회</h2>
	<sql:query var="comRS" dataSource="${stuDS }">
		SELECT * FROM student where depart=?
		<sql:param value="컴퓨터공학과"/>
	</sql:query>
	
	<c:forEach var="studentRow" begin="0" items="${comRS.rows }">
		${studentRow.id }, ${studentRow.passwd }, ${studentRow.name },${studentRow.mobile1 }, ${studentRow.depart } <br />
	</c:forEach>
	<hr />
	<c:forEach var="studentRow" begin="0" items="${comRS.rowsByIndex }">
		${studentRow[0] },${studentRow[1] },${studentRow[2] },${studentRow[6] },${studentRow[5] } <br />
	</c:forEach>
	
</body>
</html>