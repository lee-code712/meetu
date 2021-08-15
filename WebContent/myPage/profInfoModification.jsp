<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <style>
        * {
            padding: 0px;
            margin: 0px;
        }

        body {
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

        #navWrap {
            padding-top: 80px;
            display: flex;
            justify-content: space-between;
            margin: 0 auto;
            width: 1194px;
        }

        #navL {
            width: 318px;
            height: 500px;
            border-radius: 5px;
        }

        #navLTit {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 40px;
            border: 1px solid #EAEAEA;
            font-size: 18px;
            background: white;
            border-radius: 5px 5px 0px 0px;
        }

        #navListWrap {
            width: 100%;
            border-bottom: 1px solid #EAEAEA;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
            background: white;
            border-radius: 0px 0px 5px 5px;
        }

        #navList {
            display: flex;
            align-items: center;
            width: 298px;
            height: 40px;
            padding-left: 20px;
            font-size: 14px;
        }

        #profMfName {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 318px;
            height: 40px;
            font-size: 14px;
            background: #1abc9c;
            color: white;
        }

        #navR {
            width: 816px;
            height: 500px;
        }

        #navRTit {
            display: flex;
            align-items: center;
            padding-left: 20px;
            width: 796px;
            height: 40px;
            font-size: 18px;
            background: white;
            border-radius: 5px 5px 0px 0px;
            border: 1px solid #EAEAEA;
        }

        #navRContentWrap {
            width: 776px;
            padding: 22px 20px;
            background: white;
            border-radius: 0px 0px 5px 5px;
            border-bottom: 1px solid #EAEAEA;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
            font-size: 14px;
        }

        #noticeImg {
            width: 14px;
            height: 14px;
        }

        #noticeImg:hover {
            cursor: pointer;
        }

        #profNameMfWrap,
        #profDeptMfWrap,
        #profMajorMfWrap,
        #profEmailMfWrap {
            margin-bottom: 34px;
        }

        #profNameMfWrap,
        #profDeptMfWrap,
        #profMajorMfWrap,
        #profEmailMfWrap,
        #profLocationMfWrap {
            display: flex;
            width: 100%;
            height: 40px;
            align-items: center;
        }

        #profNameMfTit,
        #profDeptMfTit,
        #profMajorMfTit,
        #profEmailMfTit,
        #profLocationMfTit {
            margin-right: 40px;
            width: 100px;
            border-right: 2px solid #1abc9c;
        }

        #profNameMfText,
        #profDeptMfText,
        #profMajorMfText,
        #profEmailMfText,
        #profLocationMfText {
            padding: 8px 10px;
            background: white;
            border: 1px solid #EAEAEA;
            border-radius: 50px;
        }

        #profNameMfText:focus,
        #profDeptMfText:focus,
        #profMajorMfText:focus,
        #profEmailMfText:focus,
        #profLocationMfText:focus {
            outline: none;
        }

        #profDataMfBtnWrap {
            margin-top: 40px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
        }

        #profDataMfBtn {
            width: 100px;
            height: 40px;
            font-size: 14px;
            color: white;
            background: #1abc9c;
            border-radius: 5px;
            border: none;
        }

        #profDataMfBtn:hover {
            cursor: pointer;
        }

        #userImgWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 316px;
            height: 180px;
            font-size: 14px;
            background-image: url("../images/user.svg");
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>
<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title">MEETU</div>
            <div id="gnb">
                <div><a href="#" id="noticeIcon">공지사항</a></div>
                <div><a href="#" id="reserveIcon">상담예약</a></div>
                <div><a href="#" id="messageIcon">쪽지함</a></div>
            </div>
        </div>
        <div id="headerInnerR">
            <div id="dropdown">
                <div id="dropdown-button">김혜란님 😊</div>
                <div id="dropdown-content">
                    <a href="myPage.do">마이페이지</a>
                    <a href="logout.do">로그아웃</a>
                </div>
            </div>
            <img src="../images/bell.svg" id="noticeImg"/>
        </div>
    </div>

    <div id="navWrap">
        <div id="navL">
            <div id="navLTit">교수 정보</div>
            <div id="navListWrap">
                <div id="userImgWrap"></div>
                <div id="profMfName">(교수명)</div>
                <div id="navList">학과: 컴퓨터학과</div>
                <div id="navList">담당과목: 객체지향언어1, 객체지향언어2...</div>
                <div id="navList">이메일: lee@dongduk.ac.kr</div>
                <div id="navList">연구실 위치: 인문관 303호</div>
            </div>
        </div>

        <div id="navR">
            <div id="navRTit">교수 정보 수정</div>
            <div id="navRContentWrap">
                <div id="profNameMfWrap">
                    <div id="profNameMfTit">교수명</div>
                    <input type="text" placeholder="교수명을 입력하세요." id="profNameMfText"/>
                </div>
                <div id="profDeptMfWrap">
                    <div id="profDeptMfTit">학과</div>
                    <input type="text" placeholder="학과를 입력하세요." id="profDeptMfText"/>
                </div>
               <div id="profMajorMfWrap">
                    <div id="profMajorMfTit">담당과목</div>
                    <input type="text" placeholder="담당과목을 입력하세요." id="profMajorMfText"/>
                </div>
                <div id="profEmailMfWrap">
                    <div id="profEmailMfTit">이메일</div>
                    <input type="text" placeholder="이메일을 입력하세요." id="profEmailMfText"/>
                </div>
                <div id="profLocationMfWrap">
                    <div id="profLocationMfTit">이메일</div>
                    <input type="text" placeholder="이메일을 입력하세요." id="profLocationMfText"/>
                </div>
            </div>
            <div id="profDataMfBtnWrap"><button id="profDataMfBtn">저장</button></div>
        </div>
    </div>
</div>
</body>
</html>
