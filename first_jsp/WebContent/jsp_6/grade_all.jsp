<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : grade_all.jsp</title>
</head>
<body>
	
	<h2>JavaBeans를 이용한 학생의 점수에 따른 성적 처리 예제</h2>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="score" class="javabean.GradeBean" scope="page" />
	
	<hr size="5" color="green" />
	<h3>폼에서 전달받은 이름과 성적을 JavaBeans GradeBean에 저장</h3><p>
	이름 : <%= request.getParameter("name") %>,
	성적 : <%= request.getParameter("point") %>,
	전화번호 : <%= request.getParameter("tel") %><p>
	<jsp:setProperty property="*" name="score"/>
	
	<hr size="5" color="#dd7777" />
	<h3>JavaBeans GradeBean에 저장된 정보를 조회 출력</h3>
	이름 : <jsp:getProperty property="name" name="score"/><br>
	점수 : <jsp:getProperty property="point" name="score"/><br>
	전화번호: <jsp:getProperty property="tel" name="score"/><br>
	등급 : <jsp:getProperty property="grade" name="score"/><br>

</body>
</html>