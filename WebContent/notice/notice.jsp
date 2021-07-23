<%-- 공지사항 게시판 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>

    <link rel="stylesheet" href="/notice/css/notice.css" />
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/notice/js/notice.js"></script>
</head>

<body id="noticeBodyBg">
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

<div id="noticeTable">
    <select id="noticeNav">
        <option value="t+c">제목+내용</option>
        <option value="t">제목</option>
        <option value="c">내용</option>
    </select>

    <div id="search">
        <input type="text" placeholder="검색어를 입력하세요." id="searchText">
        <img src="/notice/images/search.svg" id="searchBtn" onclick="searchNotices()"/>
    </div>
</div>

<div class="board">
    <table class="boardListWrap">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        </thead>

        <tbody id="noticeList">

		</tbody>
    </table>

    <div class="paging" id="paging">

    </div>
</div>
<div id="writeBtnWrap">
<button id="writeBtn">글쓰기</button>
</div>
</body>
</html>