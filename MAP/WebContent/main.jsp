<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="uk-background-muted">

<head>
	<title>MAP</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>MAP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/main.css" />
    <script src="js/uikit.min.js"></script>
    <script src="js/uikit-icons.min.js"></script>
    <script src="js/jquery.js"></script>
</head>

<body>
	<c:if test="${empty user}">
		<c:redirect url="login.jsp" />
	</c:if>
	<jsp:include page="head.jsp" flush="flase" />
    <div class="uk-container uk-container-expand uk-margin-top uk-animation-fade">
        <!-- Directory -->
        <ul class="uk-breadcrumb">
            <li><a href=""></a>Project</li>
            <li><span>${project.name}</span></li>
        </ul>
        <div class="uk-grid-medium uk-flex-wrap uk-flex-wrap-around uk-child-width-expand@s uk-grid-match" uk-grid>
            <!-- 프로젝트 이름 -->
            <div class="uk-width-1-3">
                <div class="uk-card uk-card-primary uk-card-body uk-card-hover">
                    <h2 class="uk-text-large fonted">${project.name}</h2>
                    <p id="end-date" class="text-size-2">마감 : ${project.due.time}</p>
                </div>
            </div>
            <!--마감일-->
            <div class="fl-left uk-margin-left uk-height-2-3 uk-margin-remove-left">
                <div class="uk-card uk-card-default uk-card-body uk-height-2-3 uk-card-hover">
                    <h3 class="uk-card-title uk-card-large fonted">마감일까지 남은 시간</h3>
                    <div id="time" class="uk-grid-small uk-child-width-auto" uk-grid uk-countdown="date: 2018-12-18T02:50:32+00:00">
                        <div>
                            <div id="time-day" class="uk-countdown-number uk-countdown-days">00</div>
                            <div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Days</div>
                        </div>
                        <div class="uk-countdown-separator">:</div>
                        <div>
                            <div id="time-hour" class="uk-countdown-number uk-countdown-hours">00</div>
                            <div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Hours</div>
                        </div>
                        <div class="uk-countdown-separator">:</div>
                        <div>
                            <div id="time-minute" class="uk-countdown-number uk-countdown-minutes">00</div>
                            <div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Minutes</div>
                        </div>
                        <div class="uk-countdown-separator">:</div>
                        <div>
                            <div id="time-second" class="uk-countdown-number uk-countdown-seconds">00</div>
                            <div class="uk-countdown-label uk-margin-small uk-text-center uk-visible@s">Seconds</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
        	$(document).ready(function(){
        		dayGap();
        	});
            var ddaytimer = setInterval(dayGap, 1000)
            function dayGap() {
                var nowday = new Date();
                var dday = new Date(${ project.due.time });
                var ddayAttr="마감: " + dday.toLocaleDateString() + " " + dday.toLocaleTimeString();
                var realattr="date: " + dday.toISOString();
                var realdday = dday.toLocaleDateString() + " " + dday.toLocaleTimeString();
                document.getElementById("time").setAttribute("uk-countdown", realattr);
                document.getElementById("end-date").innerHTML = ddayAttr;
                var ddayChange = dday.getTime();
                nowday = nowday.getTime();
                var distance = ddayChange - nowday;
        
                if (distance <= 0) {
                    document.getElementById("dday-timer").innerHTML = "D-day";
            	}
            }
        </script>


        <!-- 기능 구역 -->
        <div class="uk-grid-medium uk-flex-wrap uk-flex-wrap-around uk-child-width-expand@s uk-margin-top" uk-grid>
            <div class="uk-width-1-3">
                <div class="uk-card uk-card-default uk-card-body uk-card-hover">
                    <h3 class="uk-card-title uk-card-large"> <span uk-icon="icon: users; ratio: 2"></span> <span class="uk-text-middle fonted">멤버</span></h3>
                    <hr />
                    <c:if test="${empty projectmember}">
                        	멤버가 없습니다.
                    </c:if>
                    <c:if test="${not empty projectmember}">
                        <table class="uk-table uk-table-hover uk-table uk-table-divider">
                            <tbody>
                                <c:forEach var="pm" items="${projectmember}">
                                    <tr>
                                        <td>
                                            ${pm.name} (${pm.email})
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
            <a href="twitter" class="uk-width-1-3 no-line">
                <div class="uk-card uk-card-default uk-card-body uk-card-hover">
                    <h3 class="uk-card-title uk-card-large"> <span uk-icon="icon: twitter; ratio: 2"></span> <span class="uk-text-middle fonted">타임라인</span> <span class="uk-align-right uk-text-middle" uk-icon="icon: plus"></span></h3>
                    <hr />
                    <ul class="uk-list uk-list-divider">
                        <c:forEach var="tl" items="${timeline}">
                            <li>${tl.memberId} : ${tl.comment}<br />${tl.timestamp}</li>
                        </c:forEach>
                    </ul>
                </div>
            </a>
            <a href="file" class="uk-width-1-3 no-line">
                <div class="uk-card uk-card-default uk-card-body uk-card-hover">
                    <h3 class="uk-card-title uk-card-small uk-text-middle"> <span uk-icon="icon: file-text; ratio: 2"></span> <span class="uk-text-middle fonted">파일</span> <span class="uk-align-right uk-text-middle" uk-icon="icon: plus"></span></h3>
                    <hr />
                    <c:if test="${not empty files}">
                        <table class="uk-table uk-table-hover uk-table uk-table-divider">
                            <tbody>
                                <c:forEach var="f" items="${files}">
                                    <tr>
                                        <td>
                                            ${f.originalFileName}<br />(${f.timestamp})
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </a>
        </div>
    </div>
</body>

</html>