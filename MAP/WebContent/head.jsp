<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty user}">
	<form action="login" method="post">
		<input type="submit" value="로그인">
	</form>
	<form action="join" method="post">
		<input type="submit" value="회원가입">
	</form>
</c:if>
<c:if test="${not empty user}">
	<a href = "home">홈</a>
	<a href = "main">프로젝트메인</a>
	<form action="logout" method="post">
		${user.id} 님
		<input type="submit" value="로그아웃">
	</form>
</c:if>
</body>
</html>