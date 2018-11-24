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
<jsp:include page="head.jsp" flush="false"/>
<h1>문서</h1>
<form action="file" method="post" enctype="multipart/form-data">
	<input type="text" name="memo">
	<input type="file" name="uploadFile">
	<input type="submit" value="업로드">
</form>
<c:if test="${empty files}">
	파일이 없습니다.
</c:if>
<c:if test="${not empty files}">
	<form action="deletefile">
		<table>
			<thead>
				<tr>
					<th>선택</th><th>파일이름</th><th>메모</th><th>아이디</th><th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fl" items="${files}">
					<tr>
					<td><input type="radio" value="${fl.id}" name="fileId"></td>
					<td><a href = "upload/${fl.savedFileName}">${fl.originalFileName}</a></td>
					<td>${fl.memo}</td><td>${fl.uploaderId}</td><td>${fl.timestamp}</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
		<input type="submit" value="삭제">
	</form>
</c:if>
</body>
</html>