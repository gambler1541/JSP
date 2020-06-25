<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP loginhandler.jsp Test</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String tel = request.getParameter("tel");
	%>
	
	<%
		if(userid.equals("guest")){
			
			out.println("회원이 아니시군요. 반갑습니다.<br>");
			out.println("다음으로 로그인 하세요.<br><hr>");
		}else{
			out.println("회원님, 반갑습니다.<hr color=red size=5>");
			if(tel.equals("")){
				tel = "010";
			}
		}
	%>
	
	아이디 : <%= userid %><br>
	비밀번호 :<%= passwd %><br>
	전화번호 : <%= tel %>
</body>
</html>