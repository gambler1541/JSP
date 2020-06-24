<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP application.jsp</title>
</head>
<body>
	<%! int application = 0; %>
	<%! int  count = 0; %>
	
	<% 
		String scount = (String) application.getAttribute("count");
		if(scount != null){
			count = Integer.parseInt(scount);
		}else{
			count = 0;
		}
		
		application.setAttribute("count", Integer.toString(++count));
		application.log("현재까지 조회 수: " + count);
	%>
	서버 컨테이너 정보 : <%= application.getServerInfo() %> <p>
	현재까지 조회 수 : <%= count %>
</body>
</html>