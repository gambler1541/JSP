<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : score.jsp</title>
</head>
<body>
	<h2>Javabeans를 이용한 학생의 이름과 성적의 저장과 조회 예제</h2>
	<jsp:useBean id="score" class="javabean.ScoreBean" scope="page" />
	<!-- ScoreBean score = new ScoreBean() -->
	<hr color="red" size="5" />
	<h3>이름과 성적을 JavaBeans ScoreBean에 저장</h3>

	이름 : <%= "수선화" %>,
	성적: <%= "85" %>,
	전화번호 : <%= "01045191005" %><p></p>
	
	
	<jsp:setProperty property="name" name="score" value="수선화"/>
	<jsp:setProperty property="point" name="score" value="85"/>
	<jsp:setProperty property="tel" name="score" value="01045191005"/>
	<!-- score.setName("수선화")
		 score.setPoint("85")
	 -->
	<hr color="green" size="5" />
	
	<h3>JavaBeans ScoreBean에 저장된 정보를 조회 출력</h3><p>
	이름 : <jsp:getProperty property="name" name="score"/><br>
	성적 : <jsp:getProperty property="point" name="score"/><br>
	전화번호 : <jsp:getProperty property="tel" name="score"/><br>
	<!--  score.getName() -->
</body>
</html>