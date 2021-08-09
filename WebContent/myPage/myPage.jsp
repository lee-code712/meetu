<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/myPage/css/myPage.css"/>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
        @charset "UTF-8";

        ul, li {
            text-decoration: none;
            list-style: none;
        }

        #navWrap {
            width: 1194px;
            margin: 0 auto;
            margin-top: 80px;
        }

        #navInnerWrap {
            display: block;
        }

        #navSub {
            display: block;
        }

        #myPageBodyBg {
            background: #FAFAFA;
        }

        #cardWrap {
            width: 18rem;
            background: white;
            border: 1px solid #eee;
            border-radius: 10px;
        }

        .boardListWrap {
            width: 870px;
            margin: 0 auto;
        }

        .boardListWrap th,
        .boardListWrap td {
            padding: 10px;
            font-size: 14px;
        }

        .boardListWrap td, th {
            text-align: center;
        }

        #deleteBtn:hover,
        #editBtn:hover,
        #cancelBtn:hover,
        #rejectMessageBtn:hover,
        #messageBtn:hover {
            cursor: pointer;
        }

        a:link {
            color: #3E454D;
            text-decoration: none;
        }

        a:visited {
            color: #3E454D;
            text-decoration: none;
        }

        a:hover {
            color: #3E454D;
            text-decoration: underline;
        }

        #logoutBtn {
            display: block;
            width: 100px;
            height: 40px;
            margin: 0 auto;
            border: 1px solid #FBAB7E;
            color: #FBAB7E;
            background: white;
            border-radius: 5px;
        }

        #logoutBtn:hover {
            display: block;
            width: 100px;
            height: 40px;
            margin: 0 auto;
            background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%);
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        #cardTitle {
            display: flex;
            align-items: center;
            padding-left: 10px;
            height: 50px;
            font-size: 18px;
            font-weight: bold;
            color: #535353;
        }

        #cardBody {
            padding: 20px 0;
            text-align: center;
            height: 180px;
        }

        #userUniv {
            margin: 10px 0 40px 0;
        }

        #thBorder {
            border-bottom: 1px solid #eee;
        }

        #thBorder th {
            text-align: center;
        }

        #completeBtn,
        #cancelBtn,
        #okBtn {
            color: #3E454D;
        }


        #dropdown-button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 60px;
            padding: 8px;
            width: 140px;
            font-size: 15px;
            border: none;
        }

        #dropdown {
            position: relative;
            display: inline-block;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 140px;
            padding: 8px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
        }

        #dropdown-content a {
            color: black;
            padding: 8px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background-color: #f3f3f3;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

        @charset "UTF-8";

        ul, li {
            text-decoration: none;
            list-style: none;
        }

        #header {
            width: 100%;
            height: 100px;
            border-bottom: 1px solid #eee;
            background: white;
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
            color: #FBAB7E;
            font-size: 24px;
            margin-right: 30px;
            font-family: 'Yellowtail', cursive;
            font-weight: bold;
        }

        #title:hover {
            cursor: pointer;
        }

        #gnb {
            display: flex;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            color: #535353;
            align-items: center;
        }

        #gnb a {
            padding: 0 40px;
        }

        #alertIcon {
            width: 18px;
            height: 18px;
        }

        #alertIcon:hover,
        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover {
            cursor: pointer;
        }

        #messageIcon,
        #noticeIcon,
        #reserveIcon {
            color: #535353;
        }

        a:link {
            color: #535353;
            text-decoration: none;
        }

        a:visited {
            color: #535353;
            text-decoration: none;
        }

        a:hover {
            color: #535353;
            text-decoration: none;
        }

        #title a:link,
        #title a:visited,
        #title a:hover {
            color: #FBAB7E;

        }

        #topHeader {
            width: 100%;
            height: 34px;
            background-color: #FBAB7E;
            background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%);
        }

        #topHeaderInner {
            margin: 0 auto;
            width: 1194px;
            height: 100%;
        }

        #topHeaderInner div {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100%;
            float: right;
            color: white;
        }

        #topHeaderInner div span {
            margin-left: 20px;
        }

        #topHeaderInner div a:link,
        #topHeaderInner div a:visited,
        #topHeaderInner div a:hover {
            color: white;
        }

        #gnb div a {
            font-size: 14px;
            position: relative;
        }

        #gnb div a:before {
            content: '';
            position: absolute;
            background-color: #FBAB7E;
            height: 6px;
            width: 0;
            bottom: -42px;
            transition: 0.5s;
            left: 50%;
            transform: translateX(-50%);
        }

        #gnb div a:hover:before {
            width: 100%;
        }

        #dropdown-button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 60px;
            padding: 8px;
            width: 140px;
            font-size: 15px;
            border: none;
        }

        #dropdown {
            position: relative;
            display: inline-block;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 140px;
            padding: 8px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
        }

        #dropdown-content a {
            color: black;
            padding: 8px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background-color: #f3f3f3;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

		#approvalBtn,
        #editBtn,
        #rejectMsgBtn {
            padding: 4px 12px;
            border-radius: 30px;
            background: #ee6868;
            color: white;
            border: none;
            cursor: pointer;
        }

		#rejectBtn,
        #cancelBtn {
            padding: 4px 12px;
            border-radius: 30px;
            background: #6885ee;
            color: white;
            border: none;
            cursor: pointer;
        }

        #msgBtn {
            padding: 4px 12px;
            border-radius: 30px;
            background: #eeb868;
            color: white;
            border: none;
            cursor: pointer;
        }

        #consultedBtn,
        #consultationRecordBtn {
            padding: 4px 12px;
            border-radius: 30px;
            background: #eeb868;
            color: white;
            border: none;
            cursor: pointer;
        }

        #incompleteBtn {
            padding: 4px 12px;
            border-radius: 30px;
            background: #cecece;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        #profSearchWrap {
        	margin-top: 8px;
            float: right;
            width: 260px;
            height: 24px;
            border-bottom: 1px solid #eee;
            border-radius: 30px;
            background: #ffffff;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 2px;
        }

        #profSearchText {
            font-size: 12px;
            width: 120px;
            margin: 2px 0 4px 10px;
            padding-left: 4px;
            border: 0px;
            outline: none;
            float: left;
            border-radius: 30px;
        }

        #profSearchBtn {
            width: 20px;
            height: 20px;
            margin: 2px 10px 2px 0;
            border: none;
            outline: none;
            float: right;
        }

        #profSearchBtn:hover {
            cursor: pointer;
        }
        
        #navBox {
        	border: none;
        }
    </style>
    <script src="/myPage/js/myPage.js"></script>
</head>

<body id="myPageBodyBg">
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

<div id="navWrap">
    <table id="navInnerWrap">
        <tr>
            <td>
                <div id="cardWrap">
                    <div id="cardTitle">내 정보</div>
                    <img src="/myPage/images/uesrImg.svg" class="card-img-top" alt="..." id="userImg">
                    <div id="cardBody">
                        <div id="userName">${mem_dto.getName()}</div>
                        <div id="userUniv">${univ_dto.getUnivName()}</div>
                        <button id="logoutBtn" onclick="location.href='logout.do'">로그아웃</button>
                    </div>
                </div>
            </td>

            <td>
                <div style="width: 40px"></div>
            </td>

            <td id="navSub">
            	<div id="profSearchWrap">
            		<input type="text" placeholder="교수명을 입력하세요." id="profSearchText"/>
            		<img src="/myPage/images/search.svg" id="profSearchBtn"/>
            	</div>
                <ul class="nav nav-tabs" id="navBox">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#qwe" id="bookedList">예약현황</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#asd" id="canceledList">예약취소</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#zxc" id="approvedList">예약확정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#aaa" id="completedList">상담완료</a>
                    </li>
                </ul>
                <div class="tab-content" style="background: white">
                    <div class="tab-pane fade show active" id="qwe">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                	<th></th>
                                    <th>교수명</th>
                                    <th>학과</th>
                                    <th>날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="asd">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                	<th></th>
                                    <th>교수명</th>
                                    <th>학과</th>
                                    <th>날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="zxc">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                	<th></th>
                                    <th>교수명</th>
                                    <th>학과</th>
                                    <th>날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="aaa">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                	<th></th>
                                    <th>교수명</th>
                                    <th>학과</th>
                                    <th>날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>