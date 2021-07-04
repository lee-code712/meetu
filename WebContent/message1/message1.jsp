<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
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

    <title>쪽지함</title>

    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

    </script>
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }

        #header_inner {
            margin: 0 auto;
            width: 1920px;
            height: 100px;
            background: #4F4F4F;
        }

        #messageWrap {
            margin: 0 auto;
            width: 1920px;
            height: 630px;
        }

        .mylist {
            width: 310px;
            height: 840px;
            background: #3E454D;
        }

        #messageInner {
            display: block;
            width: 1610px;
            height: 840px;
            background: #EBEBEB;
        }


        #list {
            display: flex;
            padding-left: 20px;
            align-items: center;
            width: 100%;
            height: 40px;
            font-size: 14px;
            color: white;
        }

        #list:hover {
            background: #363B40;
            color: white;
            width: 310px;
            cursor: pointer;
        }

        #messageTitle {
            display: flex;
            align-items: center;
            padding-left: 20px;
            width: 100%;
            height: 80px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            border-bottom: 1px dotted white;
            margin-bottom: 10px;
        }

        #sender {
            padding-top: 28px;
            padding-left: 20px;
            margin-left: 20px;
            margin-bottom: 40px;
            height: 40px;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
        }

        #receiveMessage {
            display: inline-block;
            margin: 0 40px 0 40px;
            width: 1000px;
            height: 108px;
            background: #F8F8F8;
            border-radius: 10px;
        }

        #sendMessage {
            float: right;
            margin: 20px 40px 20px 0;
            width: 1000px;
            height: 108px;
            background: #DFE7F4;
            border-radius: 10px;
        }

        #messageType {
            text-align: center;
            padding-top: 20px;
        }

        #receivetype {
            float: left;
            padding-left: 20px;
            color: #3296B6;
            font-size: 14px;
            font-weight: bold;
        }

        #receivedate {
            float: right;
            padding-right: 20px;
        }

        #sendtype {
            float: left;
            padding-left: 20px;
            color: #44B632;
            font-size: 14px;
            font-weight: bold;
        }

        #senddate {
            float: right;
            padding-right: 20px;
        }

        #messageContent {
            margin-top: 30px;
            padding-left: 20px;
            font-size: 14px;
        }

        #messageBanner {
            font-family: 'Yellowtail', cursive;
        }


        #messageTextWrap {
            display: flex;
            align-items: flex-end;
            width: 1610px;
            height: 110px;
            background: green;
        }

        #messageInnerWrap {
            widht: 1610px;
            height: 648px;
            overflow-y: scroll;
        }

        #messageText {
            width: 1500px;
            height: 110px;
        }

        #textBtn {
            width: 110px;
            height: 110px;
            background: #3E454D;
            color: white;
        }

        #textBtn:hover {
            color: white;
            background: #363B40;
            cursor: pointer;
        }

        header {
            margin: 0 auto;
            width: 1920px;
            height: 100px;
            background: #4F4F4F;
        }

        #header_inner {
            display: flex;
            margin: 0 auto;
            width: 1194px;
            height: 100px;
            align-items: center;
        }

        #title {
            display: flex;
            align-items: center;
            width: 200px;
            height: 100%;
            color: white;
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
        }

        #gnb {
            display: flex;
            width: 100%;
            font-size: 14px;
            font-weight: bold;
            color: white;
            align-items: center;
        }

        #gnb div {
            font-size: 14px;
            color: white;
        }

        #gnb a {
            padding: 0 40px;
        }

        #gnb div:first-child {
            padding-left: 0px;
        }

        #gnb div a:hover,
        #gnb div a:focus {
            color: #4D4D4D;
            cursor: pointer;
        }

        #alertIcon:hover,
        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover,
        #myPageIcon:hover {
            cursor: pointer;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropbtn {
            width: 160px;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            background: none;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid white;
            border-radius: 500px;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background: rgba(0, 0, 0, 0.1);
            border-radius: 500px;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        #headerBg {
            width: 1920px;
            height: 100px;
            background: #4F4F4F;
        }
    </style>
</head>
<body>

<header>
    <nav id="header_inner">
        <div id="title"><a>MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon">공지사항</a>
            <a id="reserveIcon">상담예약</a>
            <a id="messageIcon">쪽지함</a>
            <a id="myPageIcon">마이페이지</a>
        </div>
        <div class="dropdown">
            <button class="dropbtn">(이름)님 ▽</button>
            <div class="dropdown-content">
                <a href="#">로그아웃</a>
            </div>
        </div>
        <img src="../images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>

<table id="messageWrap">
    <tr>
        <td>
            <ul class="mylist">
                <li id="messageTitle"><span id="messageBanner">MEETU</span> &nbsp; 쪽지함</li>
                <li id="list">컴퓨터학과 000학생</li>
                <li id="list">컴퓨터학과 000학생</li>
                <li id="list">컴퓨터학과 000학생</li>
            </ul>
        </td>

        <td id="messageInner">
            <div id="sender">컴퓨터학과 000학생</div>
            <div id="messageInnerWrap">
                <div id="receiveMessage">
                    <div id="messageType"><span id="receivetype">받는 쪽지</span> <span id="receivedate">2021-05-10</span>
                    </div>
                    <div id="messageContent">(메시지 내용)</div>
                </div>
                <div id="sendMessage">
                    <div id="messageType"><span id="sendtype">보내는 쪽지</span> <span id="senddate">2021-05-10</span></div>
                    <div id="messageContent">(메시지 내용)</div>
                </div>

                <div id="receiveMessage">
                    <div id="messageType"><span id="receivetype">받는 쪽지</span> <span id="receivedate">2021-05-10</span>
                    </div>
                    <div id="messageContent">(메시지 내용)</div>
                </div>
                <div id="sendMessage">
                    <div id="messageType"><span id="sendtype">보내는 쪽지</span> <span id="senddate">2021-05-10</span></div>
                    <div id="messageContent">(메시지 내용)</div>
                </div>

                <div id="receiveMessage">
                    <div id="messageType"><span id="receivetype">받는 쪽지</span> <span id="receivedate">2021-05-10</span>
                    </div>
                    <div id="messageContent">(메시지 내용)</div>
                </div>
                <div id="sendMessage">
                    <div id="messageType"><span id="sendtype">보내는 쪽지</span> <span id="senddate">2021-05-10</span></div>
                    <div id="messageContent">(메시지 내용)</div>
                </div>
            </div>
            <div id="messageTextWrap">
                <input type="text" id="messageText"/>
                <button id="textBtn">보내기</button>
            </div>
    </tr>
</table>

</html>
