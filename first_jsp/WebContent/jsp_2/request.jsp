<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>32

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request.jsp Test</title>
</head>
<body><% request.setCharacterEncoding("utf-8");String name = request.getParameter("name");String studentNum =request.getParameter("studentNum");String sex = request.getParameter("sex");String country = request.getParameter("country");String address = request.getParameter("addr");if(sex.equalsIgnoreCase("man")){sex="남자";}else{sex="여자";}%><h2> 학생 정보 입력 결과</h2>성명 : <%= name %> <p></p>학번 : <%= studentNum %> <p></p>성별 : <%= sex %> <p></p>국적 : <%= country %> <p></p>주소 : <%= address %> <p></p></body>
</html>