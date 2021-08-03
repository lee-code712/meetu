<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상담일지</title>
    <link rel="stylesheet" href="/record/css/record.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
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
            <div><a id="reserveIcon" href="reservationPro.do">상담일지</a></div>
            <div><a id="messageIcon" href="message.do">쪽지함</a></div>
        </div>

        <div id="dropdown">
            <div id="dropdown-button">${mem_dto.getName()}<img src="/components/images/more.svg"/></div>
            <div id="dropdown-content">
                <a href="myPage.do">마이페이지</a>
                <a href="logout.do">로그아웃</a>
            </div>
        </div>

        <img src="/components/images/bell.svg" id="alertIcon"/>
    </div>
</div>

<div id="recordPageWrap">
    <div id="stuListWrap">
        <div id="pageTitle">상담일지</div>
        <div id="stuList">▶ 000학생</div>
    </div>

    <div id="recordInfoWrap">
        <div id="recordInfo">
            <div id="stuInfoWrap">
                <div id="stuInfo"><span>[학생 정보]</span> &nbsp; 이름 / 컴퓨터학과 / 20190956</div>
                <div id="writerWrap">
                    <div id="recordDate">상담일시: 2021-08-03 오전 9:00 화요일</div>
                    <div id="writeName">작성자: 000교수님</div>
                </div>
            </div>
        </div>
        <div id="recordWrap">
            <div id="recordTitle">상담일지</div>
            <div id="recordTextWrap">
                <textarea id="recordText" name="story" rows="30" cols="120" placeholder="내용을 입력하세요."></textarea></div>
            <button id="saveBtn">저장</button>
        </div>
    </div>
</div>
</body>
</html>