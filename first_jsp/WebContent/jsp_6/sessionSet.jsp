<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.setAttribute("name","parkmyengbae"); %>
<% session.setAttribute("age","29"); %>
<% session.setAttribute("addr","seoul"); %>

<script>
	location.href="sessionTest.jsp"
</script>