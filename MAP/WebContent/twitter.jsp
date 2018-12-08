<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css">
<script src="js/uikit.min.js"></script>
</head>
<body class="uk-animation-fade uk-margin-left uk-margin-top uk-margin-right uk-card uk-card-default uk-card-body uk-background-muted uk-width-1-2">
	<c:if test="${empty user}">
		<c:redirect url="login.jsp" />
	</c:if>
	<jsp:include page="head.jsp" flush="false" />
	<h1>
		<span class="uk-text-lead">타임라인</span>
	</h1>
	<form action="twitter" method="post">
		<div>
			<input class="uk-input uk-form-width-medium" type="text"
				name="comment"> <input type="submit" value="등록"
				class="uk-button uk-button-primary uk-button-default">
		</div>
	</form>
	<table class="uk-table uk-table-divider uk-table-small uk-table-responsive uk-table uk-table-hover">
		<thead>
			<tr>
				<th>아이디</th>
				<th>메시지</th>
				<th>등록일</th>
			</tr>
		</thead>
		<c:if test="${not empty timeline}">
			<tbody>
				<c:forEach var="tl" items="${timeline}">
					<tr>
						<td>${tl.memberId}</td>
						<td>${tl.comment}</td>
						<td>${tl.timestamp}</td>
					</tr>
				</c:forEach>
			</tbody>
		</c:if>
	</table>
	<c:if test="${empty timeline}">
		<span class="uk-text-bottom uk-text-right">게시글이 없습니다.</span>
	</c:if>
</body>
</html>