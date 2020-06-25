<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : forwardhandler.jsp</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String tel = request.getParameter("tel");
		String studentnum = request.getParameter("snum");
	%>
	<% 
		if(userid ==null ? true : userid.equals("")){
	%>
		<h2>로그인</h2>
		<form action="forwardlogin.jsp" method="post">
			아이디 : <input type="text" name="userid" /> <br />
			암호 : <input type="text" name="passwd" /> <p></p>
			전화번호 : <input type="tel" name="tel" /><br>
			<input type="submit" value="로그인" />
			<input type="reset" value="다시입력" />
		</form>
	<%
		} else{
	%>
		아이디 : <%= userid %>
		암호 : <%= passwd %>
		학번 : <%= studentnum %>
		전화번호 : <%= tel %>
		<hr color="green" size="5" />회원님, 반갑습니다.
	<%
		}
	%>
</body>
</html>