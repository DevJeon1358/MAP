<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css">
<script src="js/uikit.min.js"></script>
<script src="js/uikit-icons.min.js"></script>
<script>
function check(){
	if(document.twitterform.comment.value == ""){
		alert("메모를 입력해주세요.");
		return false;
	}
	return true;
	
}
</script>
</head>
<body>
	<div class="uk-container uk-container-expand">
		<div class="uk-margin-top uk-margin-left uk-margin-top uk-margin-right">
			<div class="uk-card uk-card-default uk-card-body">
				<div class="uk-background-default uk-width-1-1 uk-animation-fade">
					<c:if test="${empty user}">
						<c:redirect url="login.jsp" />
					</c:if>
					<jsp:include page="head.jsp" flush="false" />
					<h3>
						<span uk-icon="icon: twitter; ratio: 2"></span>
						<span class="uk-text-middle fonted">타임라인</span>
						<span class="uk-align-right uk-text-middle" uk-icon="icon: plus"></span>
					</h3>
					<form action="twitter" method="post" name="twitterform">
						<div>
							<input class="uk-input uk-form-width-medium" type="text" name="comment" >
							<input type="submit" value="등록" onClick="return check()" class="uk-button uk-button-primary uk-button-default">
						</div>
					</form>
					<hr>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>