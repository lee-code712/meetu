<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>상담예약</title>
    <!--<link rel="stylesheet" href="/reservation/css/reservation.css"/> -->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/reservation/js/reservation.js"></script>

    <style>
    	#sender {
    		display: flex;
    		justify-content: flex-end;
		    margin-top: 80px;
		    margin-bottom: 40px;
		    height: 40px;
		    width: 816px;
		}
    	
        #search {
            display: flex;
            justify-content: space-between;
            align-items: center;
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
        
        #tab2 {
        	margin-left: 20px;
        }
       		
		input[type=checkbox]:not(old),
		input[type=radio   ]:not(old) {
		    width: 28px;
		    margin: 0;
		    padding: 0;
		    opacity: 0;
		}
		
		input[type=checkbox]:not(old) + label,
		input[type=radio   ]:not(old) + label {
		    display: inline-block;
		    margin-left: -28px;
		    padding-left: 28px;
		    background: url('/images/checkImg.svg') no-repeat 0 0;
		    line-height: 24px;
		}
		
		input[type=checkbox]:not(old):checked + label {
		    background-position: 0 -24px;
		}
		
		input[type=radio]:not(old):checked + label {
		    background-position: 0 -48px;
		}
		
		#noticeCount {
            position: relative;
            right: 12px;
            top: -3px;
            font-size: 12px;
            color: white;
        }
    	
    	#noticeImg {
    		width: 20px;
    		height: 20px;
    		
		}
		
		#noticeOnImg {
			cursor: pointer;
			width: 24px;
    		height: 20px;
		}
		
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
		
		#recommendWrap {
			margin: 0px auto;
		    width: 1194px;
		}
		
		#recommendTit {
		    margin-bottom: 60px;
		    font-size: 24px;
		    z-index: 0;
		}
		
		#recommendInfoBox {
		    margin-bottom: 40px;
		    padding: 20px 0px;
		    width: 1194px;
		    background: white;
		    border-radius: 5px;
		    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		    transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
		}
		
		#recProfNDWrap {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    height: 40px;
		    padding: 0px 20px;
		    margin-bottom: 20px;
		}
		
		#recProfName {
		    display: flex;
		    font-size: 18px;
		    font-weight: bold;
		}
		
		#recTag {
		    font-size: 14px;
		    color: #535353;
		}
		
		#recProfDept {
		    margin-left: 20px;
		    padding: 2px 6px;
		    font-size: 14px;
		    font-weight: normal;
		    color: #535353;
		    border: 1px solid #535353;
		    border-radius: 5px;
		}
		
		#recReservationBtn {
		    display: flex;
		    align-items: center;
		    height: 28px;
		    width: 90px;
		    justify-content: center;
		    color: white;
		    background: #1ABC9C;
		    font-size: 14px;
		    border-radius: 30px;
		    cursor: pointer;
		}
		
		#recProfMajor,
		#recProfSubject,
		#recProfEmail,
		#recProfLocation {
		    display: flex;
		    align-items: center;
		    padding: 0px 20px;
		    height: 40px;
		    font-size: 14px;
		    color: #535353;
		}
		
		#recProfMajor span,
		#recProfSubject span,
		#recProfEmail span,
		#recProfLocation span {
		    margin-left: 20px;
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
		    margin-top: 40px;
		    width: 348px;
		    z-index: 1;
		}
		
		#selectDept {
		    display: flex;
		    width: 318px;
		    height: 40px;
		    margin-top: 80px;
		    font-size: 24px;
		}
		
		.college {
		    line-height: 40px;
		    font-size: 14px;
		    width: 308px;
		    cursor: pointer;
		    border-left: 1px solid #EAEAEA;
		    border-right: 1px solid #EAEAEA;
		    padding-left: 10px;
		    background: white;
		}
		
		.college:hover {
		    background: #1abc9c;
		    color: white;
		}
		
		.college:first-child {
		    border-top: 1px solid #EAEAEA;
		    border-radius: 5px 5px 0px 0px;
		}
		
		.college:last-child {
		    border-bottom: 1px solid #EAEAEA;
		    border-radius: 0px 0px 5px 5px;
		}
		
		.deptList {
		    display: none;
		    width: 304px;
		    background: #F5F5F5;
		    padding-left: 10px;
		    margin-left: -10px;
		    border-left: 4px solid #F5F5F5;
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
		    border: 1px solid #EAEAEA;
		    border-radius: 5px;
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
		
		#profListWrap {
		    width: 816px;
		    height: 700px;
		    font-size: 18px;
		    color: #3E454D;
		}
		
		#messageInnerWrap {
		    height: 648px;
		}
		
		.profList th {
		    font-size: 14px;
		    text-align: center;
		    background: white;
		}
		
		.profList td {
		    font-size: 14px;
		    text-align: center;
		    background: white;
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
		    padding: 20px 40px;
		    display: none;
		    position: absolute;
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
		    padding-bottom: 20px;
		}
		
		#infoBox:hover #infoBox-content {
		    display: block;
		}
		
		#infoTitle {
		    color: #1abc9c;
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
		
		table {
		    border-collapse: collapse;
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
		
		#blankDiv {
		    width: 60px;
		}
    </style>
</head>

<body id="reservationBodyBg">
<%
	    String is_reservated = request.getParameter("is_reservated");
		if(is_reservated != null) {
			out.println("<script>alert('이미 상담 예약이 신청된 교수님입니다.');</script>");
		}
		
		String has_consultable_time = request.getParameter("has_consultable_time");
		if(has_consultable_time != null) {
			out.println("<script>alert('상담이 가능한 시간대가 없습니다.');</script>");
		}
		
		String add_ck = request.getParameter("add_ck");
		if(add_ck != null) {
			if(add_ck.equals("1")) {
				out.println("<script>alert('성공적으로 예약 신청되었습니다.');</script>");
			}
			else {
				out.println("<script>alert('예약 신청에 실패했습니다.');</script>");
			}
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
            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/>
            <div id="noticeCount">${count_alert}</div>
        </div>
    </div>
</div>

<div id="reservationWrap">
    <div>
        <div id="selectDept">상담예약</div>
        <ul id="deptWrap">


        </ul>
    </div>

    <div id="messageInner">
        <div id="sender">
            <div class="resultArea">
                <div id="search">
                    <input type="text" placeholder="검색어를 입력하세요." id="searchText">
                    <img src="/images/search.svg" id="searchBtn" onclick="searchProfessorByKeyword()"/>
                </div>
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
<div id="recommendWrap">
    <div id="recommendTit">추천 교수님</div>
    <div id="recommendInfoBox">
        <div id="recProfNDWrap">
            <div id="recProfName">${recommend_prof.name} 교수님
                <div id="recProfDept">${recommend_prof.dept}</div>
                &nbsp;
                <div id="recTag">&nbsp; ${recommend_prof.tag}</div>
            </div>
            <c:if test="${recommend_prof.is_member == true}">
            	<div id="recReservationBtn" onclick="location.href='reservationForm.do?p_user_id=${recommend_prof.p_user_id}'">예약하기</div>
            </c:if>
        </div>
        <div id="recProfMajor">전공: <span>${recommend_prof.major}</span></div>
        <div id="recProfSubject">담당과목: <span>${recommend_prof.course}</span></div>
        <div id="recProfEmail">이메일: <span>${recommend_prof.email}</span></div>
        <div id="recProfLocation">연구실 위치: <span>${recommend_prof.office}</span></div>
    </div>
</div>
</body>
</html>
