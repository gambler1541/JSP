<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제 sendredirect.jsp</title>
</head>
<body>

<%
//	String URL = "https://search.daum.net/search?";
//   String URL = "http://search.google.com/search?";	
//  String URL = "http://search.naver.com/search?"
	String url_param = request.getParameter("url");
	String keyword = request.getParameter("word");
	String URL = "";
	if(url_param.equals("1")){
		URL = "http://search.google.com/search?";
		URL += "q=" + keyword;
	}else if(url_param.equals("2")){
		URL = "https://search.daum.net/search?";
		URL += "q=" + keyword;
	} else{
		URL = "http://search.naver.com/search.naver?";
		URL += "query=" + keyword;
	}
	
	response.sendRedirect(URL);
	/*
		response 기본 객체에서 많이 사용되는 기능 중의 하나는
		리다이렉트 기능입니다. 리다이렉트 기능이란 웹 서버가
		웹 브라우저에게 다른 페이지로 이동하라고 지시하는 것을 의미합니다.
		예를 들어 사용자가 로그인에 성공한 후 메인 페이지로 자동으로
		이동하는 사이트가 많은데 이처럼 특정 페이지를 실행한후,
		지정한 페이지로 이동하길  원할때 리다이렉트 기능을 사용하면 됩니다.
		
		리다이렉트 기능은 웹 서버 측에서 웹 브라우저에게
		어떤 페이지로 이동하라고 지정하는 것입니다.
		리다이렉트를 지시한 JSP페이지가 있을 경우 웹 브라우저는
		실질적으로 요청을 두번하게 됩니다.
	*/
%>
</body>
</html>