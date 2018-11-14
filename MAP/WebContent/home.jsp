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
<jsp:include page="head.jsp" flush="flase"/>

<h1>프로젝트 리스트</h1>
<c:if test="${empty projectlist}">
	참여중인 프로젝트가 없습니다.
</c:if>
<c:if test="${not empty projectlist}">

<c:forEach var = "p" items = "${projectlist}">
	<h3><a href="select?projectid=${p.id}">${p.name}</a></h3>
</c:forEach>

</c:if>
<form action="new" method="get">
	<input type="submit" value="프로젝트 등록">
</form>

</body>
</html>