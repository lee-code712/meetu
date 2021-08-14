<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>상담예약</title>
    <!-- <link rel="stylesheet" href="/reservation/css/reservation.css"/>  -->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/reservation/js/reservation.js"></script>

    <style>
        @charset "UTF-8";

        #noticeImg {
            width: 14px;
            height: 14px;
        }

        #noticeImg:hover {
            cursor: pointer;
        }

        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover {
            cursor: pointer;
        }

        #noticeIcon,
        #reserveIcon,
        #messageIcon {
            color: black;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: black;
            text-decoration: none;
        }

        #title,
        #title a:link,
        #title a:visited,
        #title a:hover {
            color: #1abc9c;

        }

        #header {
            width: 100%;
            height: 80px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
        }

        #headerInner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            width: 1194px;
            height: 100%;
        }

        #headerInnerL {
            display: flex;
            align-items: center;
        }

        #title {
            font-family: 'Yellowtail', cursive;
            font-size: 18px;
            font-weight: bold;
        }

        #gnb {
            margin-left: 140px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 300px;
            font-size: 14px;
        }

        #headerInnerR {
            display: flex;
            align-items: center;
        }

        #dropdown {
            position: relative;
            display: inline-block;
            font-size: 14px;
            padding: 14px;
        }

        #dropdown-button:hover {
            cursor: pointer;
        }

        #dropdown-button div {
            justify-content: flex-end;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            margin-top: 14px;
            min-width: 130px;
            padding: 4px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
        }

        #dropdown-content a {
            color: black;
            padding: 8px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background-color: #FAFAFA;
            border-radius: 5px;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

        #headerInnerR img {
            margin-left: 60px;
        }

        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
        }

        #reservationWrap {
            display: flex;
            justify-content: space-between;
            margin: 0 auto;
            width: 1194px;
            height: 840px;
        }

        #deptWrap {
            margin-top: 80px;
            width: 348px;
        }

        #selectDept {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 318px;
            height: 40px;
            font-size: 18px;
            border: 1px solid #EAEAEA;
            border-radius: 5px 5px 0px 0px;
            background: white;
        }

        .college {
            line-height: 40px;
            font-size: 14px;
            width: 318px;
            cursor: pointer;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
            background: white;
        }

        .college:hover {
            background: #1abc9c;
            color: white;
        }

        .deptList {
		display: none;
            width: 298px;
            background: #F5F5F5;
            padding-left: 20px;

        }

        .dept {
            color: black;
        }

        .profListWrap {
            display: table-cell;
        }

        .profList {
            width: 816px;
            margin: 0 auto;
            border-top: 3px solid #1abc9c;
        }

        .profList th,
        .profList td {
            padding: 10px;
            font-size: 14px;
        }

        .profList td {
            text-align: center;
        }

        #profInfo a {
            color: #2575AF;
        }

        #selectProf a {
            color: #CE2E2E;
        }

        #profInfo a:hover {
            cursor: pointer;
        }

        #selectProf a:hover {
            cursor: pointer;
        }

        #messageInner {
            display: block;
            width: 816px;
            height: 840px;
        }

        #reservationBodyBg {
            background: #FAFAFA;
        }

        #sender {
            margin-top: 80px;
            margin-bottom: 40px;
            height: 40px;
            width: 816px;
        }

        #profListWrap {
            width: 816px;
            height: 700px;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
        }

        #messageInnerWrap {
            height: 648px;
        }

        #search {
            float: right;
            width: 330px;
            height: 34px;
            border: none;
            border-radius: 30px;
            background: #ffffff;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 2px;
        }

        #searchText {
            font-size: 14px;
            width: 200px;
            margin: 8px 0 4px 12px;
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

        .profList th {
            font-size: 14px;
            border-bottom: 1px solid #C4C4C4;
            text-align: center;
        }

        .profList td {
            font-size: 14px;
            text-align: center;
        }

        #infoBox {
            position: relative;
            display: inline-block;
        }

        #infoBtn {
            color: white;
            font-size: 16px;
            border: none;
            background: none;
        }

        #infoBox-content {
            padding-top: 14px;
            width: 310px;
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.1);
            z-index: 1;
            border: 1px solid white;
            background: white;
            border-radius: 5px;
        }

        #infoBox-content p {
            color: #3E454D;
            text-decoration: none;
            display: block;
        }

        #infoBox:hover #infoBox-content {
            display: block;
        }

        #infoTitle {
            color: #3296B6;
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

        #checkBtn:hover {
            display: block;
            padding: 4px 8px;
            margin: 0 auto;
            border: 1px solid #1abc9c;
            color: #1abc9c;
            background: white;
            border-radius: 30px;
            cursor: pointer;
        }

        #checkBtn {
            display: block;
            padding: 4px 8px;
            margin: 0 auto;
            background: #1abc9c;
            border: 1px solid #1abc9c;
            color: white;
            border-radius: 30px;
        }

        #reservationBodyBg {
            background: #FAFAFA;
        }
    </style>
</head>

<body id="reservationBodyBg">
    <%
		String isReservated = request.getParameter("isReservated");
	            
		if(isReservated != null) {
			out.println("<script>alert('이미 상담 예약이 신청된 교수님입니다.');</script>");
		}
		
		String add_ck = (String) request.getAttribute("add_ck");
		
		if(add_ck != null) {
			out.println("<script>alert('성공적으로 예약 신청되었습니다.');</script>");
		}
	%>

<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title"><a href="index.do">MEETU</a></div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <c:if test="${mem_dto.getRole()=='0'}">
	    			<div><a id="reserveIcon" href="reservation.do">상담예약</a></div>
				</c:if>
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
            <img src="/images/bell.svg" id="noticeImg"/>
        </div>
    </div>
</div>

<div id="reservationWrap">
    <div>
        <ul id="deptWrap">
            <li id="selectDept">상담예약</li>

        </ul>
    </div>

    <div id="messageInner">
        <div id="sender">
            <div id="search">
                <input type="text" placeholder="검색어를 입력하세요." id="searchText">
                <img src="/reservation/images/search.svg" id="searchBtn"/>
            </div>
        </div>
        <div id="messageInnerWrap">
            <div id="profListWrap">
                <table class="profList">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>교수명</th>
                        <th>학과</th>
                        <th>상세정보</th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody id="searchResult">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
