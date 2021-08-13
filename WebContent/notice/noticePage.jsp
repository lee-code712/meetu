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

    <!-- <link rel="stylesheet" href="/notice/css/notice.css"/>  -->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/notice.js"></script>
    
    <style>
    	
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
    background: #EFEFEF;
    margin: 0 auto;
}

.boardListWrap tr:first-child {
    background: #EFEFEF;
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
    border: 1px solid #1abc9c;
    background: #1abc9c;
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

#noticeBodyBg {
    background: #FAFAFA;
}

#writeBtn {
    display: block;
    float: right;
    margin-top: 20px;
    width: 114px;
    height: 40px;
    border: none;
    border-radius: 5px;
    color: white;
    background: #1abc9c;
}

#writeBtn:hover {
    cursor: pointer;
}

#writeBtnWrap {
    margin: 0 auto;
    width: 1194px;
}
        
        #liSearchOption {
        margin: 0 auto;
        margin-bottom: 40px;
        width: 1194px;
            margin-top: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
         #noticeTit {
            font-size: 24px;
        }

        #optionWrap {
            display: flex;
        }

        #noticeNav {
            margin-top: -1px;
            border: none;
            border-radius: 50px;
            background: white;
            padding: 8px 10px;
            border: 1px solid #EAEAEA;
        }

        #searchWrap {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left: 20px;
            width: 300px;
            padding: 5px 8px;
            border: none;
            border-radius: 50px;
            background: white;
            border: 1px solid #EAEAEA;
        }

        #searchText {
            border: none;
            margin-left: 4px;
        }

        #searchText:focus {
            outline: none;
        }
    </style>
</head>

<body id="noticeBodyBg">
	<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title">MEETU</div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <div><a id="reserveIcon" href="reservationPro.do">상담예약</a></div>
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
                        <img src="../images/search.svg" id="searchBtn" onclick="searchNotices()"/>
                    </span>
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
	    	<button id="writeBtn" onclick="location.href='noticeWritePage.do'">글쓰기</button>
		</c:if>       
    </div>
</body>
</html>