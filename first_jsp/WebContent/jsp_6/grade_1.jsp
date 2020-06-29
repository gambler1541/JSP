<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javabean.GradeBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP grade_1.jsp Test</title>
</head>
<body>
	<hr size="5" color="red" />
	<h2>JavaBeans를 이용한 학생의 점수에 따른 성적 처리 예제</h2>
		<% request.setCharacterEncoding("UTF-8"); %>
		<jsp:useBean id="score" class="javabean.GradeBean" scope="page"></jsp:useBean>
		<% // GradeBean score = new GradeBean(); %>
	<hr size="5" color="green" />
	
	<h3>폼에서 전달받은 이름과 성적을 JavaBeans GradeBean에 저장</h3>	
	
	이름 : <%= request.getParameter("name") %>,
	성적 : <%= request.getParameter("point") %>,
	전화번호 : <%= request.getParameter("tel") %><p>
	<% // score.setName(request.getParameter("name")); %>
	<% // score.setPoint(Integer.parseInt(request.getParameter("point"))); %>
	<jsp:setProperty property="name" name="score" param="name"/>
	<jsp:setProperty property="point" name="score" param="point"/>
	<jsp:setProperty property="tel" name="score" param="tel"/>

	<hr size="5" color="cyan" />
	<h3>JavaBeans GradeBean에 저장된 정보를 조회 출력</h3><p>
	<%--이름 : <%= score.getName() %> <Br>
	점수 : <%= score.getPoint()%> <br>
	등급 : <%= score.getGrade()%> <br> --%>
	이름 : <jsp:getProperty property="name" name="score"/><br>
	성적 : <jsp:getProperty property="point" name="score"/><br>
	전화번호 : <jsp:getProperty property="tel" name="score"/><br>
	등급 : <jsp:getProperty property="grade" name="score"/>
</body>
</html>