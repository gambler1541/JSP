<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Tag : forTokens</title>
</head>
<body>
<h2>JSTL Core Tag : forTokens</h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="str" value="JSTL은 표준태그로서 코어, XML
						국제화, SQL, 함수 관련 태그로 구성된다." />
${str } <p/>

<hr size="5" color="green" />

위 문장은 forTokens의 속성 delims= ,.은로" 지정으로
다음 단어로 나뉘어진다. <hr /><p/>

<c:forTokens items="${str }" delims=" .,은로" var="token">
	${token } <br />
</c:forTokens>

</body>
</html>