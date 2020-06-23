<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request2.jsp test</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
%>

<%
	String studentNum = request.getParameter("studentNum");
	String[] majors = request.getParameterValues("major");
%>

<h2>학생 정보 입력 결과</h2>
학번 : <%= studentNum %>
전공 : <%
		if(majors == null){
			out.println("전공 없음");
		}else{
		//	for(int i=0; i < majors.length; i++){
		//		out.println(majors[i] + " ");
			
				// jDK 1.5 이후부터 다음 코딩 가능
				 for (String eachmajor : majors)
					 out.println(eachmajor + " ");
			//}
		}
	 %>
 <h2>요청 정보 </h2>
 요청 방식 : <%= request.getMethod() %><p>
 요청 URL: <%= request.getRequestURL() %><p>
 요청 URI: <%= request.getRequestURI() %><p>
 클라이언트 주소 : <%= request.getRemoteAddr()%><p>
 클라이언트 호스트 : <%= request.getRemoteHost() %><p>
 프로토콜 방식 : <%= request.getProtocol() %><p>
 서버 이름 : <%= request.getServerName() %><p>
 서버 포트 번호 : <%= request.getServerPort() %><p>
</body>
</html>