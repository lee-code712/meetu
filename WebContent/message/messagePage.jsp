<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>쪽지함</title>
    <link rel="stylesheet" href="/message/css/message.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/message/js/message.js"></script>
    <script>
        var user_id = '${user_id}';
    </script>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
        
        #receiveMsg {
    padding-left: 25px;
    color: #3296B6;
    font-size: 14px;
    margin-bottom: 4px;
}
   </style>
</head>

<body id="messageBodyBg">
	
	<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title"><a a href="index.do">MEETU</a></div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <div><a id="reserveIcon" href="reservation.do">상담예약</a></div>
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
	
    <table id="reservationWrap">
        <tr>
            <td>
                <ul id="mylist">
                    <li id="selectProf"><img src="/message/images/email_black_24dp.svg"/>&nbsp;&nbsp;쪽지함</li>
                    <%-- 쪽지 가능한 member list 출력 --%>
                    <c:choose>
                        <c:when test="${mem_dto.getRole() =='0'}">
                            <c:forEach items="${requestScope.msg_mem}" var="member">
                                <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"
                                                                id="labelIcon"/>
                                    ${member.value.get(0)} ${member.value.get(1)} 교수
                                </li>
                                <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.msg_mem}" var="member">
                                <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"
                                                                id="labelIcon"/>
                                    ${member.value.get(0)} ${member.value.get(1)} 학생
                                </li>
                                <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </td>
    
            <td id="messageInner">
                <div id="sender"></div>
                <div id="messageInnerWrap">
                    <div id="messageResult">
    
                    </div>
                    <div id="messageTextWrap">
                        <input type="text" placeholder="메시지를 입력하세요." id="messageText"/>
                        <span id="textBtn" onclick="sendMessage()">보내기</span>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-8216c69d01441f36c0ea791ae2d4469f0f8ff5326f00ae2d00e4bb7d20e24edb.js"></script>
    
    <script id="rendered-js">
        var div2 = document.getElementsByClassName("list");
    
        function handleClick(event) {
            console.log(event.target);
            console.log(event.target.classList);
            if (event.target.classList[1] === "clicked") {
                event.target.classList.remove("clicked");
            } else {
                for (var i = 0; i < div2.length; i++) {
                    if (window.CP.shouldStopExecution(0)) break;
                    div2[i].classList.remove("clicked");
                }
                window.CP.exitedLoop(0);
                event.target.classList.add("clicked");
            }
        }
    
        function init() {
            for (var i = 0; i < div2.length; i++) {
                if (window.CP.shouldStopExecution(1)) break;
                div2[i].addEventListener("click", handleClick);
            }
            window.CP.exitedLoop(1);
        }
    
        init();
    </script>
    
    
    <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>

</body>
</html>
