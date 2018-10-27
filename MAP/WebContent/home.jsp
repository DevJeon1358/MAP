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
	<c:redirect url="login.jsp"/>
</c:if>

<h1>프로젝트 리스트</h1>
<ul>
<!-- 여기서부터  -->
<li>
<h3>나르샤</h3>
<p>D-1</p>
</li>
<li>
<h3>자료구조</h3>
<p>D-DAY</p>
</li>
<!-- 여기까지 -->
</ul>
<form action="logout" method="post">
	<input type ="submit" value="로그아웃">
</form>
</body>
</html>