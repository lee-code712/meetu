<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상담일지</title>
    <link rel="stylesheet" href="/myPage/css/record.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/myPage/js/consultationRecord.js"></script>
</head>
<body>
<div id="topHeader">
    <div id="topHeaderInner">
        <div>
        </div>
    </div>
</div>

<div id="header">
    <div id="header_inner">
        <div id="title"><a href="index.do">MEETU</a></div>
        <div id="gnb">
            <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
            <div><a id="reserveIcon" href="reservationPro.do">상담예약</a></div>
            <div><a id="messageIcon" href="message.do">쪽지함</a></div>
        </div>

        <div id="dropdown">
            <div id="dropdown-button">${mem_dto.getName()}님<img src="/components/images/more.svg"/></div>
            <div id="dropdown-content">
                <a href="myPage.do">마이페이지</a>
                <a href="logout.do">로그아웃</a>
            </div>
        </div>

        <img src="/components/images/bell.svg" id="alertIcon"/>
    </div>
</div>

<div id="recordPageWrap">
    <div id="recordInfoWrap">
        <div id="recordInfo">
            <div id="stuInfoWrap">
            	<div id="profInfo"><span>[교수 정보]</span> &nbsp; ${prof_info.get(1)} ${prof_info.get(0)} ( 교번: ${prof_info.get(2)} )</div>
                <div id="stuInfo"><span>[학생 정보]</span> &nbsp; ${stu_info.get(1)} ${stu_info.get(0)} ( 학년: ${stu_info.get(2)}, 학번: ${stu_info.get(3)} )</div>
                <div id="writerWrap">
                	<div id="type">상담일시: ${reservation_dto.getStartTime()} ~ ${reservation_dto.getEndTime()}</div>
        			<div id="reason">상담신청사유: ${reservation_dto.getReason()}</div>
                    <div id="consultDate">상담유형: 
                    	<c:choose>
	                        <c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
	                        <c:otherwise>온라인</c:otherwise>
                		</c:choose>
                    </div>
                    <div id="writeName">작성자: ${prof_info.get(0)}</div>
                </div>
            </div>
        </div>
        <div id="recordWrap">
            <div id="recordTitle">상담일지</div>
            <div id="recordTextWrap">
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
</div>
</body>
</html>