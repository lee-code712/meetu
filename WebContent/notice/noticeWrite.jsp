<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    
    <!-- <link rel="stylesheet" href="/notice/css/noticeContent.css" /> -->
	<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <style>
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
            color: black;
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
            font-size: 16px;
            font-weight: bold;
            color: #535353;
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
        	display: flex;
            width: 160px;
            color: #535353;
            padding: 16px;
            font-size: 16px;
            border: none;
            background: none;
        }

        #dropdown-content {
        	margin-left: 50px;
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid white;
            border-radius: 5px;
            background: rgba(0, 0, 0, .800);
        }

        #dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background: rgba(0, 0, 0, 0.3);
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }
        
        #dropBtnTitle {
        	font-weight: bold;
        	padding: 0 4px 0 50px;
        	height: 100%;
        }
        
        #dropImg {
        	width: 20px;
        	heihgt: 20px;
        }
        
        #messageIcon,
        #noticeIcon,
        #reserveIcon {
            color: #535353;
        }
        
		a:link { color: #535353; text-decoration: none;}
 		a:visited { color: #535353; text-decoration: none;}
 		a:hover { color: #535353; text-decoration: underline;}
 		
 		#title a:link {
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
    	
        * {
            padding: 0px;
            margin: 0px;
            text-align: none;
        }
        body {
            background: #FAFAFA;
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
    
        #content {
            margin: 0 auto;
            padding-left: 30px;
            padding-top: 10px;
            width: 1174px;
            height: 510px;
            border-top: 1px solid #C4C4C4;
            font-size: 14px;
            vertical-align: center;
			background: white;
        }
        #listBtn {
            display: block;
            float: right;
            margin-top: 20px;
            width: 114px;
            height: 40px;
            border: none;
            border-radius: 5px;
            color: white;
            background: #FBAB7E;
        }
        #listBtn:hover {
            cursor: pointer;
        }
		#noticeContent {
			margin: 0 auto;
			width: 1194px;
		}
	
 		 #contentHeader {
 		 	display: inline-block;
 		 	vertical-align: center;
            margin: 0 auto;
            margin-top: 50px;   
            width: 1194px;
            height: 40px;
            border-top: 2px solid #FBAB7E;
            color: #3E454D;
        }
        
        #contentTitle {
        	display: flex;
        	float: left; width: 33%; padding:10px;
        }
        
        #contentDate {
        	display: flex;
        	 float: left; width: 33%; padding:10px;
        }
        
        #textInput,
        #writeDateNum {
        	padding-left: 20px;
        }
        
 		#moreDropdown {
 			float: right;
 			padding-bottom: 20px;
            position: relative;
            display: inline-block;
        }

        #moreDropBtn {
        	display: flex;
        	margin-bottom: 20px;
            width: 100px;
            color: #535353;
            padding: 16px;
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
            border: 1px solid white;
            border-radius: 5px;
            background: white;
        }

        #moreDropdownContent a {
            color: #535353;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #moreDropdownContent a:hover {
            background: white;
        }

        #moreDropdown:hover #moreDropdownContent {
            display: block;
        }
        
        #moreDropBtnTitle {
        	font-weight: bold;
        	padding: 0 4px 0 50px;
        	height: 100%;
        }
        
        img {
        	display: block;
        }
        
        #titleInput {
        	width: 1140px;
        	border: none;
        	font-size: 14px;
        }
        
        #contentInput {
        	width: 1140px;
        	border: none;
        }
        
        input:focus {outline:none;}
    </style>
</head>
<body>
<div id="topHeader">
		<div id="topHeaderInner">
			<div>로그아웃</div>
		</div>
	</div>
	<div id="header">
	    <div id="header_inner">
	        <div id="title"><a href="index.do">MEETU</a></div>
	        <div id="gnb">
	            <a id="noticeIcon" href="notice.do">공지사항</a>
	            <a id="reserveIcon" href="reservationPro.do">상담예약</a>
	            <a id="messageIcon" href="message.do">쪽지함</a>
	        </div>
	        <div id="dropdown">
	            <div id="dropBtn">
	            	<div id="dropBtnTitle">${mem_dto.getName()}님</div>
	            <div>
	            	<img src="/components/images/keyboard_arrow_down_black_24dp.svg" id="dropImg"/>
	            </div>
	            </div>
	            <div id="dropdown-content">
	                <a href="myPage.do">마이페이지</a>
	                <a href="#">로그아웃</a>
	            </div>
	        </div>
	       
	        <img src="/components/images/notification.svg" id="alertIcon"/>
	    </div>
	</div>

<div id="noticeContent">
    <div id="contentHeader">
    	<div id="contentTitle">
    		<div id="textInput"><input type="text" placeholder="제목을 입력하세요." id="titleInput"/></div>
    	</div>
    </div>
    <div id="content"><textarea cols="50" rows="24" id="contentInput" placeholder="내용을 입력하세요."></textarea></div>
    <button id="listBtn" onclick="location.href='notice.do'">완료</button>
</div>
</body>
</html>