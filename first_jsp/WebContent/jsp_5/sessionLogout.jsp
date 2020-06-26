<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% session.removeAttribute("id"); %>

<h3>로그아웃 되었습니다.</h3>
<%= session.getAttribute("id") %> 로 로그인중
<a href="sessionlogin_1.jsp"">로그인 페이지로 이동</a>