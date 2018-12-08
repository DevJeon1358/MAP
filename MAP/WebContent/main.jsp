<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/uikit/uikit.min.css">
<script src="js/uikit-icons.min.js"></script>
<script src="js/uikit.min.js"></script>
<script src="js/uikit-icons.js"></script>
</head>
<body>
<c:if test="${empty user}">
	<c:redirect url="login.jsp"/>
</c:if>
<jsp:include page="head.jsp" flush="flase"/>

<h1>${project.name}</h1>

<ul class="uk-list">
	<li>
		<div class="counter uk-card uk-card-default uk-card-body uk-width-1-2@l">
             <h3 class="uk-card-title">프로젝트 마감일</h3>
            <!-- <span id="target-day"></span><span class="text_target">까지</span><br>-->      
		<div id="time" class="uk-grid-small uk-child-width-auto" uk-grid uk-countdown="date: 2018-12-15T02:50:32+00:00">
    		<div>
        		<div id="time-day" class="uk-countdown-number uk-countdown-days"></div>
        		<div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Days</div>
    		</div>
    		<div class="uk-countdown-separator">:</div>
    		<div>
     		   <div id="time-hour" class="uk-countdown-number uk-countdown-hours"></div>
               <div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Hours</div>
    		</div>
    		<div class="uk-countdown-separator">:</div>
    		<div>
     		   <div id="time-minute" class="uk-countdown-number uk-countdown-minutes"></div>
        	   <div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Minutes</div>
    		</div>
    		<div class="uk-countdown-separator">:</div>
    		<div>
        		<div id="time-second" class="uk-countdown-number uk-countdown-seconds"></div>
        		<div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Seconds</div>
    		</div>
		</div> 
       </div>
        <script>
        var ddaytimer = setInterval (dayGap, 1000)
        function dayGap () {
            var dday = new Date(${project.due.time});//디데이
            var ddayAttr = "date: " + dday;
            document.getElementById("time").setAttribute("uk-countdown", ddayAttr);
            var ddayChange = dday.getTime();
            var nowday = new Date();//현재
            nowday = nowday.getTime();//밀리세컨드 단위변환
            var distance = ddayChange - nowday;//디데이에서 현재까지 뺀다.
        
            var d = Math.floor(distance / (1000 * 60 * 60 * 24));//일
        
            var h = Math.floor((distance / (1000*60*60)) % 24);//시간
            var m = Math.floor((distance / (1000*60)) % 60);//분
            var s = Math.floor((distance / 1000) % 60);//초
        
            if (distance <= 0) {//당일넘어섰을때, dday로 변경
                document.getElementById("dday-timer").innerHTML = "D-day";
            } else {
                //document.getElementById("target-day").innerHTML = dday;
                document.getElementById("time-day").innerHTML = d;
                document.getElementById("time-hour").innerHTML = h;
                document.getElementById("time-minute").innerHTML = m;
                document.getElementById("time-second").innerHTML = s;

            }
        }
         </script>
		
	</li>
	<li>
		<a href="file" class="uk-icon" uk-icon="icon: file-text; ratio: 3"></a>
		<a href="file">파일</a>
	</li>
	<li>
		<a href="#" class="uk-icon uk-link-reset" uk-icon="icon: users; ratio: 3"></a>
		<a href="#">멤버</a>
		<c:if test="${empty projectmember}">
			멤버가 없습니다.
		</c:if>
		<c:if test="${not empty projectmember}">
		<table class="uk-table uk-table-hover uk-table uk-table-divider">
			<thead><tr><td>이름(이메일)</td></tr></thead>
			<tbody>
				<c:forEach var = "pm" items = "${projectmember}">
					<tr><td>
					${pm.name} (${pm.email})
					</td></tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
	</li>
	<li>
		<a href="twitter" class="uk-icon-button" uk-icon="icon: twitter; ratio: 3"></a>
		<a href="twitter">타임라인</a>
		<ul class="uk-list uk-list-divider">
		<c:forEach var = "tl" items = "${timeline}">
				<li>${tl.memberId} ${tl.comment} ${tl.timestamp}</li>	
			</c:forEach>
		</ul>
			
	</li>
</ul>
</body>
</html>