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

<c:if test="${empty timeline}">
	게시글이 없습니다.
</c:if>
<c:if test="${not empty timeline}">
<table>
		<thead>
			<tr>
				<th>닉네임</th><th>아이디</th><th>등록일</th>
			</tr>
		</thead>
</table>
<ul>
	<hr>
		<li>총공 후원금 모금합니다</li>
		<li>후원금은 다운과 스밍등 음원을 위한 결제용으로만 사용합니다.</li> 
		<li>해외후원 페이팔가능 , 토스 가능</li>
		<li>모금 기간 확인해주세요</li>
		<li>모금기간 이후 들어온 금액은 다음에 공개되는 음원에 사용됩니다.</li>
	<hr>
</ul>
<ul>
	<hr>
		<li>입문자의 가장 큰 고충은 '무엇을 모르는지 모르는 상태'일 겁니다.</li>
		<li>온라인에는 프로그래밍을 익히는 데 필요한 거의 모든 정보가 있지만,</li>
		<li>이 지식들은 게시판이나 블로그 또는 커뮤니티에 포스팅 단위로 파편화되어 있습니다.</li>
		<li>그래서 최소한 무엇을 검색해야 하는지를 아는 사람들을 위해서는 더 없이 좋은 공간이지만,</li>
		<li>'무엇을 모르는지 모르는 상태'의 입문자에게는 그림의 떡으로 남아 있습니다.</li> 
		<li>다시말해서 전문가를 더욱 전문가답게 만드는 혁신에 머물고 있는 것이죠.</li>
	<hr>
</ul>
</c:if>
</body>
</html>