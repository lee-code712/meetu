<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>MEETU</title>
    <link rel="stylesheet" href="/index/css/index.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="/index/js/jquery.bxslider.min.js"></script>
    <link href="/index/css/jquery.bxslider.css" rel="stylesheet"/>
    <script src="/index/js/index.js"></script>
</head>

<body>
	<div id="blank"></div>
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
	            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/>
	            <div id="noticeCount">${count_alert}</div>
	        </div>
	    </div>
	</div>
	
	<div id="banner_wrap">
	    <ul class="banner_slide">
	        <li class="banner_01">
	            <div id="banner1Title">간편한 상담 일정 관리 시스템 &nbsp; <span id="logo1">MEETU</span></div>
	            <div id="banner1Text">MEETU를 사용하여 상담 일정을 관리해보세요!</div>
	            <button id="reservationBtn" onclick="location.href='reservation.do'">예약하러 가기</button>
	        </li>
	        <li class="banner_02">
	            <div id="banner02Wrap">
	                <div id="banner02Title">간편한 상담 일정 관리 시스템 &nbsp; <span id="logo2">MEETU</span></div>
	                <div id="banner02Text">상담 예약일을 알고 싶다면 캘린더를 통해 상담일정을 확인해보세요!</div>
	                <button id="banner02Btn" onclick="location.href='#target_cal'">캘린더 보러가기</button>
	            </div>
	        </li>
	        <li class="banner_03">
	            <div id="banner03Wrap">
	                <div id="banner03Title">간편한 상담 일정 관리 시스템 &nbsp; <span id="logo3">MEETU</span></div>
	                <div id="banner03Text">소통을 하고 싶다면 상담 승인 후 쪽지 기능을 통해 대화를 주고받아보세요!</div>
	                <button id="banner03Btn" onclick="location.href='message.do'">쪽지함 가기</button>
	            </div>
	        </li>
	    </ul>
	</div>
	
	<div id="infoWrap">
	    <div id="infoTit">MEETU 서비스</div>
	    <div id="infoSubTit">MEETU 서비스에는 어떤 기능이 있나요?</div>
	    <div id="greenLine"></div>
	
	    <div id="infoIconWrap">
	        <div id="infoIcon">
	            <img src="/images/calendarImg.svg" id="calendarImg"/>
	            <div id="iconTit">상담일정</div>
	            <div id="iconSubTit">캘린더를 통해 상담일정을 확인해 볼 수 있습니다.</div>
	        </div>
	
	        <div id="infoIcon">
	            <img src="/images/messageImg.svg" id="calendarImg"/>
	            <div id="iconTit">쪽지기능</div>
	            <div id="iconSubTit">상담예약이 확정된 후 메시지를 주고 받을 수 있습니다.</div>
	        </div>
	
	        <div id="infoIcon">
	            <img src="/images/locationImg.svg" id="calendarImg"/>
	            <div id="iconTit">위치기능</div>
	            <div id="iconSubTit">위치기능을 사용하여 만나는 위치를 확인할 수 있습니다.</div>
	        </div>
	
	        <div id="infoIcon">
	            <img src="/images/alarmImg.svg" id="calendarImg"/>
	            <div id="iconTit">알림기능</div>
	            <div id="iconSubTit">알림기능을 통해 소식을 받을 수 있습니다.</div>
	        </div>
	    </div>
	</div>
	
	<a name="target_cal"></a>
	
	<div id="manageWrap">
	    <div id="manage">
	        <div id="manageHeader">
	        	<div id="infoTit">MEETU 상담일정</div>
	    		<div id="infoSubTit">캘린더를 통해 상담일정을 관리해보세요.</div>
	            <div id="greenLine"></div>
	        </div>

	        <div id="calWrap">
	            <div id="calendar_wrap"></div>
	            <div class="cal_body">
	                <div class="cal_top">
	                    <div id="cal_top_left">
	                        <span id="cal_top_year"></span>.
	                        <span id="cal_top_month"></span>
	                        <a href="#target_cal" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><img
	                                src="/images/prevImg.svg"/></span></a>
	                        <a href="#target_cal" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img
	                                src="/images/nextImg.svg"/></span></a>
	                    </div>
	                </div>
	                <div id="cal_tab" class="cal"></div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div id="footer">
	    Copyrights © 2021 by 시나브로. All Rights Reserved.
	</div>
</body>
</html>
