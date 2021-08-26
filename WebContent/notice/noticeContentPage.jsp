<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 내용</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/notice/css/noticeContent.css"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/noticeContent.js"></script>
    <script>
    	var notice_id = '${param.no}';
    </script>
</head>
<body id="ntContentPgBg">
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
            <img src="/images/bell.svg" id="noticeImg"/>
        </div>
    </div>
</div>
<div id="noticeContentWrap">
    <div id="ntContentHeader">
        <div id="ntContentTit">${notice_dto.getTitle()}</div>
        <c:if test="${mem_dto.getRole()=='2'}">
            <div id="moreDropdown">
                <div id="moreDropBtn">
                    <div id="moreDropBtnTitle"><img src="/images/moreVert.svg" id="moreIcon"/></div>
                </div>
                <div id="moreDropdownContent">
                    <a href="#" onclick="deleteNotice()">삭제하기</a>
                </div>
            </div>
        </c:if>
    </div>
    <div id="ntContentInfo">
        <div id="date"><span>◈</span> 작성일: ${notice_dto.getWriteDate()}</div>
    </div>
    <div id="ntContentWrap">
        <div id="ntContent">${notice_dto.getContent()}</div>
    </div>
    <div id="listBtnWrap">
        <button id="listBtn" onclick="location.href='notice.do'">목록</button>
    </div>
</div>
</body>
</html>
