<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int v1 = Integer.parseInt(request.getParameter("v1"));
	int v2 = Integer.parseInt(request.getParameter("v2"));
	
	System.out.print(v1 + v2);
	out.print(v1 + v2);
%>