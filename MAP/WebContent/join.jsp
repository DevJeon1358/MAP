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
<h1>회원가입</h1>
<form action="join" method="post">
	ID <input type="text" name="userid"> <br>
	PW <input type="password" name="password"> <br>
	이름 <input type="text" name="name"> <br>
	E-Mail <input type="text" name="email"> <br>
	<input type="submit" value="회원가입">
</form>
</body>
</html>