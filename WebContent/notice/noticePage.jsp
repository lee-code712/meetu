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

    <link rel="stylesheet" href="/notice/css/notice.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/notice.js"></script>
    <style>
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
		
		#searchBtn:hover {
			cursor: pointer;
		}
		
		#footer {
		    display: flex;
		    margin-top: 400px;
		    margin: 0 auto;
		    width: 100%;
		    height: 200px;
		    background: #EDEDED;
		    justify-content: center;
		    align-items: center;
		    color: #535353;
		}
		
		#thTable {
    background: #F4F4F4;
}
	</style>
</head>

<body id="noticeBodyBg">
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
            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/><div id="noticeCount">${count_alert}</div>
        </div>
    </div>
</div>
    
 <div id='liSearchOption'>
                <div id="noticeTit">공지사항</div>
                <div id="optionWrap">
                    <select id='noticeNav'>
                        <option value="t+c">제목+내용</option>
                        <option value="t">제목</option>
                        <option value="c">내용</option>
                    </select>

                    <span id="searchWrap">
                        <input id='searchText' placeholder="내용을 입력하세요."/>
                        <img src="/images/search.svg" id="searchBtn" onclick="searchNotices()"/>
                    </span>
                </div>
            </div>
    
    <div class="board">
        <table class="boardListWrap">
            <thead>
            <tr id="thTable">
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
	    	<button id="writeBtn" onclick="location.href='noticeWritePage.do'">글쓰기</button>
		</c:if>       
    </div>
</body>
</html>
