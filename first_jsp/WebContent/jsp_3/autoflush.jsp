<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 autoflush.jsp</title>
</head>
<body>
	<%@ page autoFlush="true" buffer="1kb"%>
	<h2>현재 autoFlush = <%=out.isAutoFlush() %></h2><p></p>
	<% 
		for(int i=1; i<25; i++){
			out.println("남은 출력 버퍼 크기(out.getRemaining()): " + out.getRemaining()+ "<br>");
			
			// autoflush가 false이면 알아서 버퍼를 출력해야 한다.
			if(out.getRemaining() < 50){
				out.print("<br>");
			
			}
		}
	%>
	<hr>
	초기 출력 버퍼 크기 : <%= out.getBufferSize() %>byte<br>
	남은 출력 버퍼 크기 : <%= out.getRemaining() %>byte
</body>
</html>