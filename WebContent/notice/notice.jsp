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

 	<link rel="stylesheet" href="../components/css/header.css"/>
    <link rel="stylesheet" href="/notice/css/notice.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/notice.js"></script>
    
    <style>
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
   	</style>
</head>

<body id="noticeBodyBg">
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
    	<c:if test="${mem_dto.getRole()=='2'}">
	    	<button id="writeBtn" onclick="location.href='noticeWrite.do'">글쓰기</button>
		</c:if>       
    </div>
</body>
</html>