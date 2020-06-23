<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 : declaration</title>
</head>
<body>
<%! double radius = 4.8; %>
	<%! 
		public double getArea(double r){
			return r * r * 3.14;
		}
	
		public double getRound(double r){
			return r * 2 * 3.14;
		}
	
	%>
	반지름이 <%= radius %> 인 원의 면적은 <%= getArea(radius) + "\u33a0" %> 이다. <br />
	반지름이 <%= radius %> 인 원의 둘레는 <%= getRound(radius) + "\u339d" %> 이다.	
</body>
</html>