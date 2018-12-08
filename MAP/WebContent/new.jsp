<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
		<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css">
		<script src="js/uikit.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/new.css"/>
		<script src="js/uikit-icons.min.js"></script>

</head>
<body>
<c:if test="${empty user}">
	<c:redirect url="login.jsp"/>
</c:if>
<jsp:include page="head.jsp" flush="flase"/>
<div class="uk-align-center uk-width-1-2">
<h2 class="new_title">새 프로젝트 등록</h2>
<form id="newform" action="new" method="post">
	<ul class="uk-list uk-list-striped">
		<li class="uk-margin-small-bottom">
				<div class="uk-margin">
		        <label class="uk-form-label" for="form-stacked-text">프로젝트명</label>
		        <div class="uk-form-controls">
		            <input class="uk-input" id="form-stacked-text" type="text" name="projectname" placeholder="프로젝트명을 입력해주세요">
		        </div>
		   		</div>
		</li>
		<li class="uk-margin-small-bottom">
			<input type="text" name="subject" style="text-align:center; width:300px; height:28px; text-align:center"></li>
		<li class="uk-margin-small-bottom">
			<input type="text" name="endtime" id="endtime"style="text-align:center; width:300px; height:28px;">
				<script src="js/jquery.js"></script>
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
		      <input type="text" id="members" name="members" value="" onclick="popup();" style="text-align:center; width:300px; height:28px; "text-align:center">
		</li>
		<li><input type="submit" value="등록"></li>
	</ul>
</form>   
</div>
</body>
</html>