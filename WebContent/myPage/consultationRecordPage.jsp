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
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
</head>

<body id="cltRecordBg">
<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title">MEETU</div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <div><a id="reserveIcon" href="reservationPro.do">상담예약</a></div>
                <div><a id="messageIcon" href="message.do">쪽지함</a></div>
            </div>
        </div>
        <div id="headerInnerR">
            <div id="dropdown">
                <div id="dropdown-button">${mem_dto.getName()} 😊</div>
                <div id="dropdown-content">
                    <a href="myPage.do">마이페이지</a>
                    <a href="logout.do">로그아웃</a>
                </div>
            </div>
            <img src="../images/bell.svg" id="noticeImg"/>
        </div>
    </div>
</div>

<div id="navWrap">
    <div id="navL">
        <div id="navLTit">상담일지</div>
        <div id="navListWrap">
            <div id="navList">[학생정보]</div>
            <div id="navList">${stu_info.get(1)} ${stu_info.get(0)} ( 학년: ${stu_info.get(2)}, 학번:
                ${stu_info.get(3)} )
            </div>
            <div id="navList">상담일시: ${reservation_dto.getStartTime()} ~ ${reservation_dto.getEndTime()}</div>
            <div id="navList">상담 신청 사유: ${reservation_dto.getReason()}</div>
            <div id="navList">상담 유형:
                <c:choose>
                    <c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
                    <c:otherwise>온라인</c:otherwise>
                </c:choose>
            </div>
            <div id="navList">작성자: ${prof_info.get(1)} ${prof_info.get(0)} ( 교번: ${prof_info.get(2)} )</div>
        </div>
    </div>

    <div id="navR">
        <div id="navRTit">(학생이름)</div>
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