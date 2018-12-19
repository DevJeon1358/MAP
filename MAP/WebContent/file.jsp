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
	if(document.fileform.memo.value == ""){
		alert("메모를 입력해주세요.");
		return false;
	}
	if(document.fileform.uploadFile.value == ""){
		alert("파일을 선택해주세요.");
		return false;
	}
	return true;
	
}

function checkRadio(){
	var radios = document.querySelectorAll('input[type="radio"]:checked');
	if(radios.length>0)
		return true;
	else{
		alert("파일을 선택하세요.");
		return false;
	}
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
						<span uk-icon="icon: file-text; ratio: 2"></span>
						<span class="uk-text-middle fonted">파일</span>
						<span class="uk-align-right uk-text-middle" uk-icon="icon: plus"></span>
					</h3>
					<form action="file" method="post" name="fileform" enctype="multipart/form-data" class="uk-search uk-search-default">
						<input class="uk-search-input" type="text" placeholder="메모" name="memo">
						<div class="uk-margin" uk-margin>
							<div uk-form-custom="target: true">
								<input type="file" name="uploadFile">
								<input class="uk-input uk-form-width-medium" type="text" placeholder="파일 선택" disabled>
							</div>
							<button onClick="return check()" class="uk-button uk-button-primary">등록</button>
						</div>
					</form>
					<hr>
					<form action="deletefile">
						<input type="submit" onClick="return checkRadio()" class="uk-button uk-button-danger uk-align-right uk-button-small" value="삭제">
						<table class="uk-table uk-table-divider uk-table-responsive">
							<thead>
								<tr>
									<th>선택</th>
									<th>파일이름</th>
									<th>메모</th>
									<th>아이디</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="fl" items="${files}">
									<c:if test="${not empty files}">
										<tr>
											<td><input type="radio" value="${fl.id}" name="fileId"></td>
											<td><a href="upload/${fl.savedFileName}" download>${fl.originalFileName}</a></td>
											<td>${fl.memo}</td>
											<td>${fl.uploaderId}</td>
											<td>${fl.timestamp}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${empty files}">
							<span class="uk-text-bottom uk-text-right">파일이 없습니다.</span>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>