<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : getcookies.jsp</title>
</head>
<body>
	<h1>쿠키 조회 예제</h1>
	<hr size="5" color="red" />
	<%
		Cookie[] cookies = request.getCookies();
	if(cookies == null){
		out.println("쿠키가 없습니다.");
	} else{
		/*
			for(int i=0; i<cookies.length;++i){
				out.println("쿠키 이름(name) : " + cookies[i].getName()+", ");
				out.println("쿠키 값(value) : " + cookies[i].getValue()+"<b>");
			}
		*/
		for(Cookie c : cookies){
			out.println("쿠키 이름(name) : " + c.getName() + ", ");
			out.println("쿠키 값(value) : " + c.getValue() + "<br>");
		}
	}
	%>
</body>
</html>