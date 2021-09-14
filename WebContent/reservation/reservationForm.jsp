  
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>예약</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBO59kYyP7M8RIYNDEcF6_ftc1rZDQfT-A&callback=buildMap&region=kr"></script>
    <script src="/reservation/js/reservationForm.js"></script>
    <link rel="stylesheet" href="../reservation/css/reservationForm.css"/>

    <script>
    	var p_user_id = "${param.p_user_id}";
    	var office = "${param.office}";
    	var schedules = ${consultable_times};
    </script>
    
    <style>
		#noticeCount {
    		position: relative;
    		right: 10px;
    		top: -4px;
    		font-size: 4px;
    		color: white;
    	}
    	
    	#noticeImg {
    		width: 20px;
    		height: 20px;
    		
		}
		
		#noticeOnImg {
			cursor: pointer;
			width: 24px;
    		height: 20px;
		}
	</style>
</head>
<body>
<%
	String date_check = request.getParameter("date_ck");
	if(date_check != null) {
		out.println("<script>alert('동일한 시간대에 예약 내역이 존재합니다.');</script>");
	}
%>
<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title"><a href="index.do">MEETU</a></div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <c:if test="${mem_dto.getRole()=='0'}">
                    <div><a id="reserveIcon" href="reservation.do">상담예약</a></div>
                    <div><a id="messageIcon" href="message.do">쪽지함</a></div>
                </c:if>
               	<c:if test="${mem_dto.getRole()=='1'}">             
                	<div><a id="messageIcon" href="message.do">쪽지함</a></div>
                	<div id="blankDiv"></div>
                </c:if>
            </div>
        </div>
        <div id="headerInnerR">
            <div id="dropdown">
                <div id="dropdown-button">${mem_dto.getName()}님 😊</div>
                <div id="dropdown-content">
                    <a href="myPage.do">마이페이지</a>
                    <a href="logout.do">로그아웃</a>
                </div>
            </div>
            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/><div id="noticeCount">${count_alert}</div>
        </div>
    </div>
</div>

    <form method="post" name="reservation_form" action="makeReservation.do?p_user_id=${param.p_user_id}" onsubmit="return ck_reservation_form()">
    <div id="navWrap">
        <div id="navL">
            <div id="navLTit">상담예약</div>
            <div id="navListWrap">
            	<div class="navListName">교수명</div>
                <div class="navList" id="name">${param.name}</div>
                <div class="navListName">학과</div>
                <div class="navList" id="dept">${param.dept}</div>
                <div class="navListName">전공</div>
                <div class="navList" id="major">${param.major}</div>
                <div class="navListName">담당과목</div>
                <div class="navList" id="course">${param.course}</div>
                <div class="navListName">이메일</div>
                <div class="navList" id="email">이메일: ${param.email}</div>
                <div class="navListName">연구소 위치</div>
                <div class="navList" id="office">${param.office}</div>
                <div id="office_map"></div>
            </div>
        </div>

        <div id="navR">
            <div id="navRTit">날짜 및 시간 선택</div>
            <div id="navRContentWrap">
                <table class="scriptCalendar">
                    <thead>
                    <tr>
                        <td id="prevMonth" onClick="buildCalendar();" style="cursor:pointer; color: #1abc9c;">◀</td>
                        <td colspan="5">
                            <span id="calYear">YYYY</span>년
                            <span id="calMonth">MM</span>월
                        </td>
                        <td id="nextMonth" onClick="buildCalendar();" style="cursor:pointer; color: #1abc9c;">▶</td>
                    </tr>
                    <tr>
                        <td style="background: white;">일</td>
                        <td style="background: white;">월</td>
                        <td style="background: white;">화</td>
                        <td style="background: white;">수</td>
                        <td style="background: white;">목</td>
                        <td style="background: white;">금</td>
                        <td style="background: white;">토</td>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>

            <div id="navRTit">상담 시간</div>
            <div id="navRContentWrap">
                <div id="timeBoxesWrap">
                    <div class="timeTitle" id="startTimeTitle"><span style="color: #1abc9c;">◈</span> 상담 시작
                        시간
                    </div>
                    <div>
                        <div class="timeBoxWrap">
                            <div class="startTimeBox" id="09:00"><a>09:00</a></div>
                            <div class="startTimeBox" id="10:00"><a>10:00</a></div>
                            <div class="startTimeBox" id="11:00"><a>11:00</a></div>
                        </div>
                        <div class="timeBoxWrap">
                            <div class="startTimeBox" id="12:00"><a>12:00</a></div>
                            <div class="startTimeBox" id="13:00"><a>13:00</a></div>
                            <div class="startTimeBox" id="14:00"><a>14:00</a></div>
                        </div>
                        <div class="timeBoxWrap">
                            <div class="startTimeBox" id="15:00"><a>15:00</a></div>
                            <div class="startTimeBox" id="16:00"><a>16:00</a></div>
                            <div class="startTimeBox" id="17:00"><a>17:00</a></div>
                        </div>
                    </div>
                    <br/>
                    <div class="timeTitle" id="timeTitle"><span style="color: #1abc9c;">◈</span> 상담 시간</div>
                    <div class="timeBoxWrap">
                        <div class="timeBox" id="1h"><a>1시간</a></div> &nbsp;&nbsp;
                        <div class="timeBox" id="2h"><a>2시간</a></div>
                    </div>
                </div>
            </div>

            <div id="navRTit">상담 신청 사유</div>
            <div id="navRContentWrap">
                <div id="reasonWrap">
                    <div>
                        <input id="radio1" type="radio" name="radio" value="1" checked="checked"><label for="radio1">전담 교수 상담</label>
                    </div>
                    <div>
                        <input id="radio2" type="radio" name="radio" value="2"><label for="radio2">진로 상담</label>
                    </div>
                    <div>
                        <input id="radio3" type="radio" name="radio" value="3"><label for="radio3">휴학 상담</label>
                    </div>
                    <div>
                        <input id="radio4" type="radio" name="radio" value="4"><label for="radio4">대학원 상담</label>
                    </div>
                    <div>
                        <input id="radio5" type="radio" name="radio" value="5"><label for="radio5">기타:</label>
                        <input type="text" placeholder="내용을 적어주세요." id="anotherReason">
                    </div>
                </div>
            </div>

            <div id="navRTit">상담 유형</div>
            <div id="navRContentWrap">
                <div class="typeBtnWrap">
                    <div id="typeBtnOff" class="typeBtn"><a>오프라인</a></div>
                    <div id="typeBtnOn" class="typeBtn"><a>온라인</a></div>
                </div>
            </div>

            <div>
                <input class="reservationBtn" type="submit" value="예약하기" />
            </div>
        </div>
    </div>
	</form>
</body>
</html>
