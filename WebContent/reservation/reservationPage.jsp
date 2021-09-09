<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>상담예약</title>
    <link rel="stylesheet" href="/reservation/css/reservation.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/reservation/js/reservation.js"></script>
    <script>
        $(document).ready(function () {
            $(".resultArea > div").last().hide();
            var radioContent = $(".resultArea > div");
            $("input[type='radio']").click(function () {
                radioContent.hide();
                radioContent.eq($("input[type='radio']").index(this)).show();
            });
        });
    </script>

    <style>
    	#sender {
    		display: flex;
    		justify-content: space-between;
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
            <img src="/images/bell.svg" id="noticeImg" onclick="readNewAlerts();"/>&nbsp; 새로운 알림: ${count_alert}개
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
            <p>
                <input type="radio" name="tab" id="tab1" checked="checked"/>
                <label for="tab1" class="contentType">교수명</label>
                <input type="radio" name="tab" id="tab2"/>
                <label for="tab2" class="contentType">키워드</label>
            </p>
            <div class="resultArea">
                <div id="search">
                    <input type="text" placeholder="검색어를 입력하세요." id="searchText">
                    <img src="/images/search.svg" id="searchBtn"/>
                </div>
                <div id="search">
                    <input type="text" placeholder="키워드를 입력하세요." id="searchText">
                    <img src="/images/search.svg" id="searchBtn"/>
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
</body>
</html>
