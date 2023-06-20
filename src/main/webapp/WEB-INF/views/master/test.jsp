<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>principal : <sec:authentication property="principal" /></p>
	<p>memberDTO : <sec:authentication property="principal.member" /></p>
	<p>사용자ID : <sec:authentication property="principal.member.id" /></p>
	<p>사용자권한 : <sec:authentication property="principal.member.classification" /></p>
</body>
</html>