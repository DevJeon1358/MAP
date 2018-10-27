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

<h1>Main</h1>
<ul>
	<li>
		<h2>마감일 카운터</h2>
		<p>D-100</p>
	</li>
	<li>
		<h2>파일</h2>
		<p>자료구조.hwp</p>
		<p>연결리스트.hwp</p>
		<p>선형구조.hwp</p>
		<p>헤더파일.hwp</p>
		<p>14번 문제 소스.hwp</p>
	</li>
	<li>
		<h2>멤버</h2>
		<p>최정민</p>
		<p>이소은</p>
		<p>이주영</p>
		<p>곽현준</p>
		<p>전광용</p>
		<p>신민수</p>
	</li>
	<li>
		<h2>타임라인</h2>
	</li>
</ul>
</body>
</html>