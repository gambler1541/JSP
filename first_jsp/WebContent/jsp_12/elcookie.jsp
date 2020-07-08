<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어에서 내장 객체 cookie 이용</title>
</head>
<body>
<h2>표현언어 내장객체 cookie 이용</h2>
<%
	Cookie c = new Cookie("userid", "king");
	response.addCookie(c);
%>

\${cookie.userid.value} = ${cookie.userid.value }

<p/>
<hr size="5" color="green" />

<h2>스크립트릿에서 직접 Cookie 이용</h2>
<% 
	Cookie[] cs = request.getCookies();

	if(!(cs ==null)){
		for(Cookie ck : cs){
			if(ck.getName().equals("userid"))
				out.println(ck.getValue());
		}
	}
%>
</body>
</html>