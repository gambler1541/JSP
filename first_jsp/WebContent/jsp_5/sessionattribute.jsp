<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 sessionattribute.jsp</title>
</head>
<body>
	<%@ page import = "java.util.Enumeration, java.util.Date" %>
	
	<h1>세션 예제</h1>
	
	<hr size="5" color="red" />
	
	<h2>세션 만들기</h2>
	<%
		session.setAttribute("id", "kingjava");
		session.setAttribute("pwd", "queentomcat");
		session.setAttribute("park", "myengbae");
		
	%>
	
	<hr size="5" color="cyan" />
	
	<h2>세션 조회</h2>
	세션 ID : <%= session.getId() %> <br />
	세션 CreationTime : <%= new Date(session.getCreationTime()) %> <br /><br />
	<%
		Enumeration<String> e = session.getAttributeNames();
	
	while(e.hasMoreElements()){
		String name = e.nextElement();
		String value = (String) session.getAttribute(name);
		out.println("세션 name: " + name + ", ");
		out.println("세션 value: "+ value + "<br>");
		
	}
	%>
	<br />세션 Invalidate : <% session.invalidate(); %>
	
</body>
</html>