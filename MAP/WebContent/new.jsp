<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
</head>
<body>
<c:if test="${empty user}">
	<c:redirect url="login.jsp"/>
</c:if>
<jsp:include page="head.jsp" flush="flase"/>

<h2>새 프로젝트 등록</h2>
<form id="newform" action="new" method="post">
	<ul>
		<li>프로젝트명 <input type="text" name="projectname"></li>
		<li>과목 <input type="text" name="subject"></li>
		<li>마감 일시
			<input type="text" name="endtime" id="endtime">
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
	     <li>멤버 초대 <input type="text" id="members" name="members" value="" onclick="popup();"></li>
		<li><input type="submit" value="등록"></li>
	</ul>
</form>   
</body>
</html>