<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_test2.jsp Test</title>
</head>
<body>
<hr size="5" color="green" />
<h3>${sessionScope.test}</h3>
<h3>${param.name}</h3>
<h3>${param['name']}</h3>
<h3>${param["name"]}</h3>
<h3>${param.addr}</h3>

<hr size="5" color="green"/>
</body>
</html>