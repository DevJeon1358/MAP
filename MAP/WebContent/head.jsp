<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MAP</title>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css"/>
		<script src="js/uikit.min.js"></script>
	</head>
<body>
<c:if test="${not empty user}">
	<div id="head" class="uk-section uk-section-default uk-padding">
		<div  class="uk-flex-first uk-margin">
			<div class="uk-position-top-left">
			<img src="img/logo.svg" width="110" height="110" class="uk-margin-left" uk-svg>
			<a href = "home" class="uk-margin-left">홈</a>
			<a href = "main" class="uk-margin-left">프로젝트메인</a>
			</div>
		</div>
		<div>
			<div class="uk-position-top-right uk-padding">
			<form action="logout" method="post" >
				${user.id} 님
				<input type="submit"  class="uk-button uk-button-default" value="로그아웃">
			</form>
			</div>
		</div>
	</div>
	<div id="titlemargin"></div>
</c:if>
</body>
</html>