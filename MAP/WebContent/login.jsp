<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css">
<script src="js/uikit-icons.min.js"></script>
<script src="js/uikit.min.js"></script>
<script src="js/uikit-icons.js"></script>
<script>
function check(){
	if(document.loginform.userid.value == ""){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if(document.loginform.password.value == ""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	return true;
	
}
</script>
<meta charset="UTF-8">
<title>MAP</title>
</head>
<body>
<c:if test="${not empty user}">
	<c:redirect url="main.jsp"/>
</c:if>

<div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
	<div class="uk-width-1-1">
		<div class="uk-container">
			<div class="uk-grid-margin uk-grid uk-grid-stack" uk-grid>
				<div class="uk-width-1-1@m">
					<div class="uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
						<h3 class="uk-card-title uk-text-center fonted">MAP</h3>
						<form action="login" method="post" name="loginform">
							<div class="uk-margin">
								<div class="uk-inline uk-width-1-1">
									<span class="uk-form-icon" uk-icon="icon: user"></span>
									<input class="uk-input uk-form-large" type="text" name="userid" id="userid"placeholder="ID">
								</div>
							</div>
							<div class="uk-margin">
								<div class="uk-inline uk-width-1-1">
									<span class="uk-form-icon" uk-icon="icon: lock"></span>
									<input class="uk-input uk-form-large" type="password" name="password" id="password" placeholder="PW">	
								</div>
							</div>
							<div class="uk-margin">
								<input type="submit" class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="로그인" onClick="return check()"></input>
							</div>
						</form>
						<form action="join" method="post">
							<input class="uk-button uk-button-default uk-button-large uk-width-1-1" type="submit" value="회원가입" >
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>