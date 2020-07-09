<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL Tag Test</title>
</head>
<body>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<hr />
<h2>전체 게시판 조회</h2>
<sql:setDataSource var="ds" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${ds }" sql="select * from board_1" />

<c:forEach var="brdRow" begin="0" items="${rs.rows }">
	${brdRow.id }, ${brdRow.name }, ${brdRow.title }, ${brdRow.regdate } <br />
</c:forEach>

<hr size="5" color="green" />
<h3>name이 "choi"인 레코드에서 이름을 "유현진"으로, 등록일 현재시간으로 수정</h3>

<sql:update var="n" dataSource="${ds }">
	update board_1 set name=?, regdate=? where name=?
	<sql:param value="유현진"/>
	<sql:dateParam value="<%= new java.util.Date() %>" type="timestamp"/>
	<sql:param value="choi"/>
</sql:update>

<hr size="5" color="red" />

<h2>다시 게시판 전체 조회</h2>
<sql:query var="rs" dataSource="${ds }" sql="SELECT * FROM board_1" />
<c:forEach var="brdRow" begin="0" items="${rs.rows }">
${brdRow.id }, ${brdRow.name }, ${brdRow.title }, ${brdRow.regdate } <br />
</c:forEach>

<h2>rowsByIndex로 출력</h2>
<c:forEach var="brdrowidx" begin="0" items="${rs.rowsByIndex }" >
${brdrowidx[0]},${brdrowidx[1]},${brdrowidx[3]},${brdrowidx[5]} <br />
</c:forEach>
</body>
</html>