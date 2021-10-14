<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상담일지</title>
    <link rel="stylesheet" href="/myPage/css/record.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/myPage/js/consultationRecord.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
</head>

<body id="cltRecordBg">
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
	
	<div id="navWrap">
	    <div id="navL">
	        <div id="navLTit">상담정보</div>
	        <div id="navListWrap">
	        	<div id="navList" class="consultSubTit">교수정보</div>
	        	<div id="navList">${prof_info.get(1)} ${prof_info.get(0)} ( ${prof_info.get(2)} )</div>
	            <div id="navList" class="consultSubTit">학생정보</div>
	            <div id="navList">${stu_info.get(1)} ${stu_info.get(0)} ( ${stu_info.get(2)}학년, ${stu_info.get(3)} )</div>
	            <div id="navList" class="consultSubTit">상담일시</div>
	            <div id="navList">
	            	<c:set var="startTime" value="${reservation_dto.getStartTime()}"/>${fn:substring(startTime, 0, 16)}
	            	 ~ 
	            	<c:set var="endTime" value="${reservation_dto.getEndTime()}"/>${fn:substring(endTime, 11, 16)}
	            </div>
	            <div id="navList" class="consultSubTit">상담신청사유</div>
	            <div id="navList">${reservation_dto.getReason()}</div>
	            <div id="navList" class="consultSubTit">상담유형</div>
	            <div id="navList">
	                <c:choose>
	                    <c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
	                    <c:otherwise>온라인</c:otherwise>
	                </c:choose>
	            </div>
	            
	        </div>
	    </div>
	
	    <div id="navR">
	        <div id="navRTit"><div>상담내용</div> <div id="writerName">작성자: ${prof_info.get(0)}</div></div>
	        <div id="navRContentWrap">
	            <c:choose>
	                <c:when test="${consult_dto.getContent() == ' '}">
	                    <textarea id="recordText" name="story" rows="30" cols="120" placeholder="내용을 입력하세요."></textarea>
	                </c:when>
	                <c:otherwise>
	                    <textarea id="recordText" name="story" rows="30" cols="120" placeholder="내용을 입력하세요.">${consult_dto.getContent()}</textarea>
	                </c:otherwise>
	            </c:choose>
	        </div>
	
	        <button id="backBtn" onclick="history.back();">닫기</button>
	        <button id="saveBtn" onclick="updateContent();">저장</button>
	    </div>
	</div>
</body>
</html>
