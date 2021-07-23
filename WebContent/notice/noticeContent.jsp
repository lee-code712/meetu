<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>

    <link rel="stylesheet" href="/notice/css/noticeContent.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>

<body id="noticeContentBodyBg">
    <div id="topHeader">
        <div id="topHeaderInner">
            <div>로그아웃</div>
        </div>
    </div>
    <div id="header">
        <div id="header_inner">
            <div id="title"><a href="index.do">MEETU</a></div>
            <div id="gnb">
                <a id="noticeIcon" href="notice.do">공지사항</a>
                <a id="reserveIcon" href="reservationPro.do">상담예약</a>
                <a id="messageIcon" href="message.do">쪽지함</a>
            </div>
            <div id="dropdown">
                <div id="dropBtn">
                    <div id="dropBtnTitle">${mem_dto.getName()}님</div>
                    <div>
                        <img src="/components/images/keyboard_arrow_down_black_24dp.svg" id="dropImg"/>
                    </div>
                </div>
                <div id="dropdown-content">
                    <a href="myPage.do">마이페이지</a>
                    <a href="#">로그아웃</a>
                </div>
            </div>
    
            <img src="/components/images/notification.svg" id="alertIcon"/>
        </div>
    </div>
    
    
    <div id="noticeContent">
        <div id="contentHeader">
            <div id="moreDropdown">
                <div id="moreDropBtn">
                    <div id="moreDropBtnTitle"><img src="/notice/images/more_vert_black_24dp.svg" id="moreIcon"/></div>
                </div>
                <div id="moreDropdownContent">
                    <a href="#">삭제하기</a>
                </div>
            </div>
            <div id="contentTitle">
                <span>◈</span> ${notice_dto.getTitle()} <span>◈</span>
            </div>
        </div>
        <div id="contentDate">
            <div id="writeDate">2021년 07월 22일 목요일</div>
        </div>
        <div id="content">${notice_dto.getContent()}</div>
        <button id="listBtn" onclick="location.href='notice.do'">목록</button>
    </div>
</body>
</html>