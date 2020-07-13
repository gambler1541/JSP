<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Function Tag </title>
</head>
<body>

<h2>JSTL Tag : function </h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="addr" value="http://www.korea_books.co.kr"/>
\${addr } = "${addr }" <br />
\${fn:length(addr)} = ${fn:length(addr) } <p/>
\${fn:toUpperCase(addr) } +"${fn:toUpperCase(addr) }" <p/>

\${fn:substring(addr,8,11)} = "${fn:substring(addr, 8, 11)}" <br />
\${fn:substringBefore(addr,":")} = "${fn:substringBefore(addr,":") }" <br />
\${fn:substringAfter(addr, "//")} = "${fn:substringAfter(addr, "//") }" <p/>

\${fn:trim(addr)} = "${fn:trim(addr)}" <br />
\${fn:replace(addr, "co.kr", "com")} = ${fn:replace(addr,"co.kr","com")} <br />
\${fn:indexOf(addr,":")} = ${fn:indexOf(addr,":")} <p/>

\${fn:startsWith(addr, "http")} = ${fn:startsWith(addr,"http")} <br />
\${fn:endsWith(addr,"r")} = ${fn:endsWith(addr,"r")} <br />
\${fn:contains(addr, "www")} = ${fn:contains(addr,"www")} <br />
\${fn:containsIgnoreCase(addr,"KR")} = ${fn:containsIgnoreCase(addr,"KR")} <p/>

<c:set var="telNum" value="82-2-011-8754-8725" />
<c:set var="subNum" value="${fn:split(telNum,'-')}" />
\${telNum } = "${telNum }"<br />
\${fn:join(subNum, ":")} = ${fn:join(subNum, ":")} <br />
\${fn:escapeXml("<hr>")} = ${fn:escapeXml("<hr>")} <br />
</body>
</html>