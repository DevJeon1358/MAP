<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>MAP</title>
		<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
		<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css">
		<script src="js/uikit.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/new.css"/>
		<script src="js/uikit-icons.min.js"></script>
		<script src="js/jquery.js"></script>
		<script>
			function check(){
				if(document.newform.projectname.value == ""){
					alert("프로젝트명을 입력해주세요.");
					return false;
				}
				if(document.newform.subject.value == ""){
					alert("과목을 입력해주세요.");
					return false;
				}
				if(document.newform.endtime.value == ""){
					alert("마감일시를 입력해주세요.");
					return false;
				}
				return true;
				
			}
</script>
	</head>
	<body>
		<c:if test="${empty user}">
			<c:redirect url="login.jsp"/>
		</c:if>
		<jsp:include page="head.jsp" flush="flase"/>
		<div class="uk-align-center uk-width-1-2">
		<h2 class="uk-text-primary fonted">새 프로젝트 등록</h2>
		<form id="newform" action="new" method="post" name="newform">
			<ul class="uk-list uk-list-striped">
				<li class="uk-margin-small-bottom">
						<div class="uk-margin">
				       		<label class="uk-form-label" for="form-stacked-text">프로젝트명</label>
				       			<div class="uk-form-controls">
				            		<input class="uk-input" id="form-stacked-text" type="text" name="projectname" placeholder="프로젝트명을 입력해주세요" maxlength="45">
				       			</div>
				       	</div>
				</li>
				<li class="uk-margin-small-bottom">
					<div class="uk-margin">
				        <label class="uk-form-label" for="form-stacked-text">과목</label>
				       		<div class="uk-form-controls">
				            	<input class="uk-input" id="form-stacked-text" type="text" name="subject" placeholder="과제 담당 교과를 입력해주세요" maxlength="45">
				        	</div>
				   	</div>
				</li>
				<li class="uk-margin-small-bottom">
					<div class="uk-margin">
				    	<label class="uk-form-label" for="form-stacked-text">마감일시</label>
				        	<div class="uk-form-controls">
				            	<input class="uk-input" id="endtime" type="text" name="endtime" placeholder="마감일시를 입력해주세요">
									<script src="js/jquery.js"></script>
							</div>
					</div>
						<script src="js/jquery.datetimepicker.full.min.js"></script>
						<script>	
					    	jQuery(document).ready(function () {
					    	'use strict';
							jQuery('#endtime').datetimepicker();
			    	  		});
			    	
			    	    function popup(){
			    	    	window.open('searchmember','searchmember','width=400, height=500');
			    	    }
			        	</script> 
			     </li>       
			     <li class="uk-margin-small-bottom">
			     	<div class="uk-margin">
				    	<label class="uk-form-label" for="form-stacked-text">멤버 초대</label>
				        	<div class="uk-form-controls">
				           		<input class="uk-input" id="members" type="text" name="members" onclick="popup();" value="${user.id};">
				        	</div>
				   	</div>
				</li>
				<li>
					<input type="submit" value="등록" onClick="return check()" class="uk-button uk-button-primary">
				</li>	
			</ul>
		</form>   
		</div>
	</body>
</html>