<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL sql 라이브러리 사용 예제</title>
</head>
<body>
<h2>JSTL sql 라이브러리 사용 예제</h2>
<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:orcl"
user="scott" password="tiger"/>

<sql:update dataSource="${conn }">
	INSERT INTO student_1 (num, name) values (111, '홍길동')
</sql:update>

<sql:update dataSource="${conn }">
	INSERT INTO student_1 (num, name) values (222, '조준동')
</sql:update>

<sql:update dataSource="${conn }">
	INSERT INTO student_1 (num, name) values (333, '홍길동')
</sql:update>
<sql:update dataSource="${conn }">
	INSERT INTO student_1 (num, name) values (444, '홍길순')
</sql:update>

<sql:update dataSource="${conn}">
	UPDATE student_1 SET name= ? where name=?
	<sql:param>king</sql:param>
	<sql:param>홍길동</sql:param>
</sql:update>

<sql:update dataSource="${conn }">
	UPDATE student_1 SET num=? where num =?
	<sql:param>9898</sql:param>
	<sql:param>111</sql:param>
</sql:update>

<sql:query var="rs" dataSource="${conn }">
	SELECT * FROM student_1 WHERE name=?
	<sql:param>king</sql:param>
</sql:query>

<c:forEach var="data" items="${rs.rows }">
	<c:out value="${data['num'] }" />
	<c:out value="${data['name'] }" />
	<br />
</c:forEach>
</body>
</html>