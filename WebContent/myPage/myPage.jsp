<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

    <link rel="stylesheet" href="../myPage/css/myPage.css"/>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
    <script src="/myPage/js/myPage.js"></script>

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
            width: 816px;
            display: block;
        }
        #myPageBodyBg {
            background: #FAFAFA;
        }
        #cardWrap {
            width: 318px;
            height: 500px;
            border-radius: 5px;
        }
        .boardListWrap {
            width: 816px;
            margin: 0 auto;
            border: 1px solid #EAEAEA;
            border-radius: 5px;
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
        #editBtn,
        #cancelBtn,
        #rejectMsgBtn,
        #msgBtn,
        #approvalBtn,
        #rejectBtn,
        #consultedBtn,
        #consultationRecordBtn {
            cursor: pointer;
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
  
        #thBorder th {
            text-align: center;
        }
        @charset "UTF-8";
        ul, li {
            text-decoration: none;
            list-style: none;
        }
        #searchWrap {
            display: flex;
            justify-content: space-between;
            align-items: center;
            float: right;
            padding: 0px 8px;
            width: 260px;
            height: 34px;
            border-bottom: 1px solid #EAEAEA;
            border-radius: 50px;
            background: #ffffff;
        }
        #searchText {
            font-size: 12px;
            width: 120px;
            padding-left: 4px;
            border: 0px;
            outline: none;
            float: left;
            border-radius: 30px;
        }
        #searchBtn {
            width: 20px;
            height: 20px;
            border: none;
            outline: none;
            float: right;
        }
        #searchBtn:hover {
            cursor: pointer;
        }
        #navBox {
            height: 80px;
            border: none;
        }
        #navListWrap {
            width: 317px;
            border-bottom: 1px solid #EAEAEA;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
            background: white;
            border-radius: 5px;
        }
        #logoutBtnWrap {
            display: flex;
            align-items: center;
            width: 316px;
            height: 60px;
            margin-top: 40px;
            padding-bottom: 20px;
            font-size: 14px;
        }
        #userImgWrap {
            display: flex;
            align-items: center;
            width: 316px;
            height: 180px;
            font-size: 14px;
        }
        
        #navListSub {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 316px;
            height: 40px;
            font-size: 14px;
            border-top: 1px solid #EAEAEA;
            border-radius: 5px 5px 0px 0px;
        }
        
        #navListName {
        	display: flex;
            justify-content: center;
            align-items: center;
            width: 316px;
            height: 40px;
            font-size: 14px;
        }
        
        #navList {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            width: 316px;
            height: 40px;
            font-size: 14px;
        }
        #navListOn {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 316px;
            height: 40px;
            font-size: 14px;
            background: #1abc9c;
            color: white;
        }
        #navLTit {
            display: flex;
            width: 100%;
            height: 40px;
            font-size: 24px;
            margin-bottom: 40px;
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
        #noticeImg {
            width: 14px;
            height: 14px;
        }
        #noticeImg:hover {
            cursor: pointer;
        }     
       
        #logoutBtn {
            display: block;
            margin: 0 auto;
            width: 100px;
            height: 40px;
            border: 1px solid #1abc9c;
            border-radius: 5px;
            color: #1abc9c;
            background: white;
        }
        #logoutBtn:hover {
            background: #1abc9c;
            color: white;
            border: 1px solid #1abc9c;
            cursor: pointer;
        }

        #profInfoBtn {
            padding: 4px 10px;
            border-radius: 50px;
            background: #f1f1f1;
            color: #C4C4C4;
            border: 1px solid #EAEAEA;
        }
        
        #profInfoBtn:hover {
            cursor: pointer;
        }
        
        #moreImg {
            width: 20px;
            height: 20px;
        }
        
        .nav-pills > .nav-item > .active {
            background: #1abc9c;
        }
    </style>
</head>

<body id="myPageBodyBg">
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
                	<div><a id="reserveIcon" href="#"/></div>
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

<div id="navWrap">
    <table id="navInnerWrap">
        <tr>
            <td>
                <div id="cardWrap">
                    <div id="navLTit">
                        마이페이지
                    </div>
                    <div id="navListWrap">
                    	<div id="navListSub"></div>
                        <div id="userImgWrap"><img src="../images/user.svg" id="userImg"/></div>
                        <div id="navListName">${mem_dto.getName()}</div>
                        <div id="navList">${univ_dto.getUnivName()}</div>
                        <c:if test="${mem_dto.getRole()=='1'}">
                        <div id="navList"><button id="profInfoBtn" onclick="location.href='profInfoPage.do'">내 정보</button></div>
                            </c:if>
                        <div id="logoutBtnWrap">
                            <button id="logoutBtn" onclick="location.href='logout.do'">로그아웃</button>
                        </div>
                    </div>
                </div>
            </td>

            <td>
                <div style="width: 60px"></div>
            </td>

            <td id="navSub">
                <div id="searchWrap">
                    <c:choose>
                        <c:when test="${mem_dto.getRole() == 0}">
                            <input type="text" placeholder="교수명으로 검색" id="searchText"/>
                        </c:when>
                        <c:otherwise>
                            <input type="text" placeholder="학생명으로 검색" id="searchText"/>
                        </c:otherwise>
                    </c:choose>
                    <img src="/myPage/images/search.svg" id="searchBtn" onclick="search()"/>
                </div>
                <ul class="nav nav-pills" id="navBox">
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
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
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
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
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
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
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
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
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
