<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 연산자 empty test</title>
</head>
<body>
\${null} = ${null } <p/>
\${n } = ${n } <p/>

\${empty null } = ${empty null } <p/>
\${empty n} = ${empty n } <p/>

\${param.user } = ${param.user } <p/>
\${empty param.user } = ${empty param.user }
</body>
</html>