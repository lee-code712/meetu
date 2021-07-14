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
    
    <link rel="stylesheet" href="../components/css/header.css" />
    <link rel="stylesheet" href="/notice/css/notice.css" />
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/notice/js/notice.js"></script>
	<script>
		var total_data = '${notice_size}';
	</script>
	
    <style>
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;
        }

        section {
            width: 100%;
            height: 80px;
            background-color: #FFFEFC;
        }

        #banner {
            display: table;
            margin: 0 auto;
            width: 100%;
            height: 120px;
            background-color: white;
            border-radius: 5px;
        }

        #banner div {
            display: table-cell;
            width: 1920px;
            height: 100%;
            background: white;
            text-align: center;
            font-size: 24px;
            color: #333330;
            font-family: 'Noto Sans KR', sans-serif;
            vertical-align: middle;
        }


        #noticeTable {
            display: table;
            width: 1194px;
            margin: 0 auto;
            text-align: center;
        }

        #search {
            height: 34px;
            width: 330px;
            border: none;
            border-radius: 30px;
            background: #ffffff;
            display: block;
            float: right;
            margin-top: 60px;
            margin-bottom: 30px;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 2px;
        }

        #searchText {
            font-size: 14px;
            width: 200px;
            margin: 10px 0 4px 12px;
            padding-left: 4px;
            border: 0px;
            outline: none;
            float: left;
            border-radius: 30px;
        }

        #searchBtn {
            width: 54px;
            height: 28px;
            margin: 4px 0;
            border: none;
            outline: none;
            float: right;
        }

        #searchBtn:hover {
            cursor: pointer;
        }

        #noticeNav {
            margin-top: 60px;
            margin-left: 660px;
            width: 134px;
            height: 34px;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 2px;
            border: none;
            border-radius: 30px;
            padding-left: 10px;
        }

        table {
            border-collapse: collapse;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .board {
            padding: 10px;
        }

        .boardListWrap {
            width: 1194px;
            border-top: 2px solid #3E454D;
            margin: 0 auto;
        }

        .boardListWrap tr:first-child {
            border-top: 1px solid #ccc;
        }

        .boardListWrap th,
        .boardListWrap td {
            padding: 10px;
            font-size: 14px;
        }

        .boardListWrap td {
            text-align: center;
        }

        .boardListWrap .tit {
            text-align: left;
        }

        .bt:hover {
            text-decoration: underline;
        }

        .board .paging {
            margin-top: 50px;
            text-align: center;
            font-size: 0;
        }

        .board .paging a {
            display: inline-block;
            margin-left: 10px;
            padding: 5px 10px;
            border-radius: 100px;
            font-size: 12px;
        }

        .board .paging a:first-child {
            margin-left: 0;
        }

        .board .paging a.c_num {
            border: 1px solid gray;
            font-weight: 600;
            color: gray;
        }

        .board .paging a.num {
            border: 1px solid #3E454D;
            background: #3E454D;
            font-weight: 600;
            color: white;
        }

        .board .paging a.num,
        .board .paging a.c_num:hover {
            cursor: pointer
        }

        #boardList:hover {
            width: 1194px;
            height: 40px;
            border-radius: 10px;
            box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
            cursor: pointer;
            background: white;
        }

        body {
            background: #F4F4F4;
        }
        
        #messageIcon,
        #reserveIcon {
            color: #8B8B8B;
        }
        
        a:link { color: white; text-decoration: none;}
 		a:visited { color: white; text-decoration: none;}
 		a:hover { color: white; text-decoration: underline;}

    </style>
   
</head>

<body>
<header>
    <nav id="header_inner">
        <div id="title"><a href="index.do">MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon" href="notice.do">공지사항</a>
            <a id="reserveIcon" href="reservationPro.do">상담예약</a>
            <a id="messageIcon" href="message.do">쪽지함</a>
        </div>
        <div id="dropdown">
            <button id="dropBtn">${mem_dto.getName()}님 ▽</button>
            <div id="dropdown-content">
                <a href="#">마이페이지</a>
                <a href="logout.do">로그아웃</a>
            </div>
        </div>
        <img src="/components/images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>

<div id="banner">
    <div>공지사항</div>
</div>

<div id="noticeTable">
    <select id="noticeNav">
        <option>전체</option>
        <option>제목</option>
        <option>내용</option>
        <option>작성자</option>
    </select>

    <div id="search">
        <input type="text" placeholder="검색어를 입력하세요." id="searchText">
        <img src="/notice/images/search.svg" id="searchBtn"/>
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
</body>
</html>
