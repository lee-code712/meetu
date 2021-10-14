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
	        <ul id="deptWrap"></ul>
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
	
	                    <tbody id="searchResult"></tbody>
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
	            </div>
	            <c:if test="${recommend_prof.is_member == true}">
	            	<div id="recReservationBtn" onclick="location.href='reservationForm.do?p_user_id=${recommend_prof.p_user_id}'">선택하기</div>
	            </c:if>
	        </div>
	        <div id="recProfMajor">전공: <span>${recommend_prof.major}</span></div>
	        <div id="recProfSubject">담당과목: <span>${recommend_prof.course}</span></div>
	        <div id="recProfEmail">이메일: <span>${recommend_prof.email}</span></div>
	        <div id="recProfLocation">연구실 위치: <span>${recommend_prof.office}</span></div>
	        <div id="recTag">${recommend_prof.tag}</div>
	    </div>
	</div>
</body>
</html>
