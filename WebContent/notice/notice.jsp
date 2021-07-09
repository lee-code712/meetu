<%-- 공지사항 게시판 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>notice</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
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
            width: 1920px;
            height: 100px;
            background-color: white;
            border-radius: 5px;
        }

        #banner div {
            display: table-cell;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
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
            border: 1px solid #0D6EFD;
            background: #0D6EFD;
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

        header {
            width: 100%;
            height: 100px;
            top: 0px;
            background: rgba(0, 0, 0, .800);
            box-sizing: border-box;
            transition: All 0.2s ease;
            -webkit-transition: All 0.2s ease;
            -moz-transition: All 0.2s ease;
            -o-transition: All 0.2s ease;
        }

        #header_inner {
            display: flex;
            align-items: center;
            margin: 0 auto;
            width: 1194px;
            height: 100px;
        }

        #title {
            display: flex;
            align-items: center;
            width: 200px;
            height: 100%;
            color: white;
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
            font-weight: bold;
        }

        #title:hover {
            cursor: pointer;
        }

        #gnb {
            display: flex;
            width: 100%;
            font-size: 14px;
            font-weight: bold;
            color: white;
            align-items: center;
        }

        #gnb a {
            padding: 0 40px;
        }

        #alertIcon:hover,
        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover,
        #myPageIcon:hover {
            cursor: pointer;
        }

        #dropdown {
            position: relative;
            display: inline-block;
        }

        #dropBtn {
            width: 160px;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            background: none;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid white;
            border-radius: 500px;
        }

        #dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background: rgba(0, 0, 0, 0.1);
            border-radius: 500px;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

        body {
            background: #F4F4F4;
        }

    </style>
    <link rel="stylesheet" href="../components/css/header.css"/>
    <link rel="stylesheet" href="/notice/css/notice.css"/>
</head>

<body>
<header>
    <nav id="header_inner">
        <div id="title"><a>MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon">공지사항</a>
            <a id="reserveIcon">상담예약</a>
            <a id="messageIcon">쪽지함</a>
            <a id="myPageIcon">마이페이지</a>
        </div>
        <div id="dropdown">
            <button id="dropBtn">(이름)님 ▽</button>
            <div id="dropdown-content">
                <a href="#">로그아웃</a>
            </div>
        </div>
        <img src="../images/notifications_black_24dp.svg" id="alertIcon"/>
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
        <img src="./search.svg" id="searchBtn"/>
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

        <tbody>
        <tr id="boardList">
            <td>1</td>
            <td class="tit">글의 제목이 입력됩니다.</td>
            <td>MEETU 관리자</td>
            <td>2021-05-10</td>
            <td>123</td>
        </tr>

        <tr id="boardList">
            <td>2</td>
            <td class="tit">글의 제목이 입력됩니다.</td>
            <td>MEETU 관리자</td>
            <td>2021-05-10</td>
            <td>123</td>
        </tr>

        <tr id="boardList">
            <td>3</td>
            <td class="tit">글의 제목이 입력됩니다.</td>
            <td>MEETU 관리자</td>
            <td>2021-05-10</td>
            <td>123</td>
        </tr>

        <tr id="boardList">
            <td>4</td>
            <td class="tit">글의 제목이 입력됩니다.</td>
            <td>MEETU 관리자</td>
            <td>2021-05-10</td>
            <td>123</td>
        </tr>
        </tbody>
    </table>

    <div class="paging">
        <a href="#" class="bt">이전</a>

        <a class="num">1</a>
        <a class="c_num">2</a>
        <a class="c_num">3</a>
        <a class="c_num">4</a>
        <a class="c_num">5</a>

        <a href="#" class="bt">다음</a>
    </div>
</div>
</body>
</html>
