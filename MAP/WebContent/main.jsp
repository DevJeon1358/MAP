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
<jsp:include page="head.jsp" flush="flase"/>

<h1>${project.name}</h1>

<ul>
	<li>
		<h2>마감일 카운터</h2>
		<div class="counter">
            <!-- <span id="target-day"></span><span class="text_target">까지</span><br>-->
            <span id="dday-timer" class="num"></span>
            <span id="time-day" class="num"></span>
            <span class="txt">일</span>
            <span id="time-hour" class="num"></span>
            <span class="txt">시간</span>
            <span id="time-minute" class="num"></span>
            <span class="txt">분</span>
            <span id="time-second" class="num"></span>
            <span class="txt">초</span>
            <span class="txt">남았습니다.</span>
        </div>
        <script>
        var ddaytimer = setInterval (dayGap, 1000)
        function dayGap () {
            var dday = new Date(${project.due.time});//디데이
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
	
	<br>
	<li>
		<a href="file">파일</a>
		
	</li>
	<li>
		<h2>멤버</h2>
		<p>최정민</p>
		<p>이소은</p>
		<p>이주영</p>
		<p>곽현준</p>
		<p>전광용</p>
		<p>신민수</p>
	</li>
	<li>
		<a href="twitter">타임라인</a>
	</li>
</ul>
</body>
</html>