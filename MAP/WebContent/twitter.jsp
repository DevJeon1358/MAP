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
<jsp:include page = "head.jsp" flush = "false"/>
<h1>타임라인</h1>
<form action="twitter" method="post">
	<input type="text" name="comment">
	<input type="submit" value="등록">
</form>
<c:if test="${empty timeline}">
	게시글이 없습니다.
</c:if>
<c:if test="${not empty timeline}">
<table>
		<thead>
			<tr>
				<th>아이디</th><th>메시지</th><th>등록일</th>
			</tr>
			<c:forEach var = "tl" items = "${timeline}">
				<tr>
				<td>${tl.memberId}</td><td>${tl.comment}</td><td>${tl.timestamp}</td>
				</tr>	
			</c:forEach>
		</thead>
</table>
</c:if>
</body>
</html>