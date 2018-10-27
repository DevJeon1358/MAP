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
<form action="file" method="post">
	<input type="submit" value="업로드">
</form>
<form action="delfile" method="post">
	<table>
		<thead>
			<tr>
				<th>선택</th><th>파일이름</th><th>아이디</th><th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<!-- 여기부터 루프 -->
			<tr>
				<td><input type="checkbox" name="fileid"></td>
				<td>a.hwp</td>
				<td>user1</td>
				<td>2018-10-10</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="fileid"></td>
				<td>abc.hwp</td>
				<td>user2</td>
				<td>2018-10-10</td>
			</tr>
			<!-- 여기까지 루프 -->
		</tbody>
	</table>
	<input type="submit" value="삭제">
</form>
</body>
</html>