<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request3.jsp</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
	<h2>취미와 가보고 싶은 국가 좋아하는 꽃의 결과</h2>
	<% 
		// Enumeration e = request.getParameterNames();
		Enumeration<String> e = request.getParameterNames();
		
		// getParameterNames() : html으로 전송되어온 name 속성들만
		// Enumeration 타입으로 받아온 후,
		// 각 name을 하나씩 가져와 전송된 값을 출력한다.
		
		while(e.hasMoreElements()){
			// String name = (String) e.nextElement();
			String name = e.nextElement();
			String[] data = request.getParameterValues(name);
			
			if(data != null){
			//	for(String eachdata : data)
			//		out.println(eachdata + " ");
			for(int i =0; i < data.length; i++)
				out.println(data[i] + " ");
			}
			out.println("<p>");
		}
	%>
</body>
</html>