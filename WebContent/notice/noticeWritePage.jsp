<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 내용</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <!-- <link rel="stylesheet" href="/notice/css/noticeContent.css"/>  -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/noticeWrite.js"></script>

    <style>
        * {
            padding: 0px;
            margin: 0px;
        }

        #ntContentPgBg {
            background: #FAFAFA;
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

        #noticeContentWrap {
            margin: 80px auto 0px auto;
            width: 1194px;
        }

        #ntContentHeader {
            display: flex;
            padding-left: 20px;
            align-items: center;
            width: 1174px;
            height: 60px;
            font-size: 18px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
            border-top: 1px solid #EAEAEA;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
        }

        #ntContentInfo {
            padding-left: 20px;
            display: flex;
            align-items: center;
            width: 1174px;
            height: 40px;
            font-size: 14px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
        }

        #writer > span {
            color: #1abc9c;
        }

        #date > span {
            color: #1abc9c;
        }

        #ntContentWrap {
            margin: 0 auto;
            width: 1194px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
        }

        #content {
            width: 1154px;
            font-size: 14px;
            padding: 20px;
            height: 400px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
        }

        #listBtnWrap {
            display: flex;
            justify-content: flex-end;
            width: 100%;
        }

        #listBtnWrap > button {
            margin-top: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100px;
            height: 40px;
            background: #1abc9c;
            color: white;
            border: none;
            border-radius: 5px;
        }

        #listBtnWrap > button:hover {
            cursor: pointer;
        }

        #moreDropdown {
            padding-top: 8px;
            float: right;
            position: relative;
            display: inline-block;
        }

        #moreDropBtn {
            display: flex;
            color: #535353;
            font-size: 16px;
            border: none;
            background: none;
        }

        #moreDropdownContent {
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid #eee;
            border-radius: 5px;
            background: white;
        }

        #blankDiv {
            width: 100px;
        }

        #moreDropdownContent a {
            color: #535353;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #moreDropdownContent a:hover {
            background: #F8F8F8;
        }

        #moreDropdown:hover #moreDropdownContent {
            display: block;
        }

        #moreDropBtnTitle {
            font-weight: bold;
            padding: 0 4px 0 0;
            height: 100%;
        }

        #contentInput {
            width: 1174px;
            border: none;
        }

        #titleInput {
            width: 1154px;
            border: none;
        }

        #contentInput:focus,
        #titleInput:focus {
            outline: none;
        }
    </style>
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
                	<div><a id="reserveIcon" href="#"/></div>
                </c:if>
            </div>
        </div>
        <div id="headerInnerR">
            <div id="dropdown">
                <div id="dropdown-button">${mem_dto.getName()}님 😊</div>
                <div id="dropdown-content">
                    <c:if test="${mem_dto.getRole()!='2'}">
                        <a href="myPage.do">마이페이지</a>
                    </c:if>
                    <a href="logout.do">로그아웃</a>
                </div>
            </div>
            <img src="/images/bell.svg" id="noticeImg"/>
        </div>
    </div>
</div>

<div id="noticeContentWrap">
    <div id="ntContentHeader">
        <div id="ntContentTit"><input type="text" placeholder="제목을 입력하세요." id="titleInput"/></div>
    </div>
    <div id="ntContentWrap">
        <div id="content"><textarea cols="50" rows="24" id="contentInput" placeholder="내용을 입력하세요."></textarea></div>
    </div>
    <div id="listBtnWrap">
        <button id="listBtn" onclick="addNotice()">완료</button>
    </div>
</div>
</body>
</html>
