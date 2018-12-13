<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			<title>Insert title here</title>
				<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
				<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css"/>
				<script src="js/uikit.min.js"></script>
				<link rel="stylesheet" type="text/css" href="css/new.css"/>
				<script src="js/uikit-icons.min.js"></script>
				<script src="js/jquery.js"></script>
				<script>	
				    jQuery(document).ready(function () {
				    	$('.uk-radio').click(function(){
				    	var st = $(":input:radio[name=memberid]:checked").val();
				    	opener.newform.members.value+=st+";";
				    	self.close();
				    	});
				    });
				</script>
	</head>
	<body>
		<div class="uk-margin-small uk-align-center uk-width-1-1 uk-card uk-card-default uk-card-body">
		    <form action="searchmember" class="uk-margin-small-bottom">
		    	<label class="uk-form-label" for="form-stacked-text">멤버 추가</label>
					<nav class="uk-background-default uk-navbar-container uk-margin" uk-navbar>
						<div class="uk-navbar-left uk-width-2-3">
							<div class="uk-form-controls uk-width-1-1">
				      			<input class="uk-input" id="form-stacked-text" type="text" name="searchstring" onfocus="this.value=''" placeholder="아이디  or 이메일 입력" >
					    	</div>
						</div>
					<div class="uk-navbar-right uk-width-1-3">
						<input type="submit" class="uk-input addbtn uk-button-primary" value="검색">
					</div>
					</nav>
				</form>
			    	<c:if test="${not empty searchresult}">
						<c:forEach var="search" items="${searchresult}">
							<div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
								<label><input class="uk-radio" type="radio" name="memberid" value="${search.id}" class="radio">${search.id}</label><br>
							</div>
						</c:forEach>
					</c:if> 	
		</div>
	</body>
</html>