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
<jsp:include page="head.jsp" flush="false"/>
<h1>로그인</h1>
<form action="login" method="post">
	ID <input type="text" name="userid"> <br>
	PW <input type="password" name="password"> <br>
	<input type="submit" value="로그인">
</form>
<form action="join" method="post">
	<input type="submit" value="회원가입">
</form>
</body>
</html>