<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
    
    <link rel="stylesheet" href="/myPage/css/profInfoPage.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/myPage/js/profInfo.js"></script>
    <script>
    	var courses = ${courses};
    </script>
</head>

<body>
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
	
	<div id="navWrap">
	    <div id="navL">
	        <div id="navLTit"></div>
	        <div id="navListWrap">
	            <div id="userImgWrap"></div>
	            <div id="profMfName">${mem_dto.getName()}</div>
	            <div id="navList">${univ_dto.getUnivName()}</div>
	            <div id="profDataMfBtnWrap">
	                <button id="backBtn" onClick="location.href='myPage.do'">닫기</button>
	            </div>
	        </div>
	    </div>
	
    <div id="navR">
        <div id="navRTit">내 정보</div>
        <div id="navRContentWrap">
            <div id="profNameMfWrap">
                <div id="profNameMfTit">교수명</div>
                <div id="profNameMfText">${param.name}</div>
			</div>
            <div id="profDeptMfWrap">
                <div id="profDeptMfTit">학과</div>
                <div id="profDeptMfText">${param.dept}</div>
            </div>
            <div id="profMajorMfWrap">
            	<div id="profMajorContentWrap">
                    <div id="profMajorMfTit">전공</div>
                    <button id="modifyBtn" onClick="majorMfBtn()">수정</button>
                </div>
               	<div id="profMajorMfText">${param.major}</div>
            </div>
            <div id="profSubjectMfWrap">
                <div id="profSubjectContentWrap">
                    <div id="profSubjectMfTit">담당과목</div>
                    <button id="modifyBtn" onClick="subjectAddBtn()">추가</button>
                </div>
                    <div id="profSubjectMfText">
                    	<c:forEach items="${courses}" var="list">
                    		<c:if test="${list.course_by_prof != null}">
							 	<div id="${list.course_id}">${list.course_by_prof} &nbsp;<a id="rejectBtn" onClick="classRemoveBtn()">x</a></div>
							 </c:if>
						</c:forEach>
					</div>
            </div>
            <div id="profEmailMfWrap">
                <div id="profEmailContentWrap">
                    <div id="profEmailMfTit">이메일</div>
                    <button id="modifyBtn" onClick="emailMfBtn()">수정</button>
                </div>
                    <div id="profEmailMfText">${param.email}</div>
            </div>
            <div id="profLocationMfWrap">
                <div id="profLocationContentWrap">
                    <div id="profLocationMfTit">연구실 위치</div>
                    <button id="modifyBtn" onClick="profLocationMfBtn()">수정</button>
                </div>
                    <div id="profLocationMfText">${param.office}</div>   
            </div>
            <div id="profAbleTimeMfWrap">
                <div id="profAbleTimeContentWrap">
                    <div id="profAbleTimeMfTit">상담 가능 시간</div>
                    <button id="modifyBtn" onClick="profAbleTimeAddBtn()">추가</button>
                </div>
                   <div id="profAbleTimeMfText">
					<c:forEach items="${consultable_times}" var="list">
							<c:choose>
								<c:when test="${list.able_date == 0}">
									<div id="0">일 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:when>
								<c:when test="${list.able_date == 1}">
									<div id="1">월 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:when>
								<c:when test="${list.able_date == 2}">
									<div id="2">화 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:when>
								<c:when test="${list.able_date == 3}">
									<div id="3">수 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:when>
								<c:when test="${list.able_date == 4}">
									<div id="4">목 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:when>
								<c:when test="${list.able_date == 5}">
									<div id="5">금 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:when>
								<c:otherwise>
									<div id="6">토 ${list.able_time} &nbsp;<a id="rejectBtn" onClick="profAbleTimeRemoveBtn()">x</a></div>
								</c:otherwise>
							</c:choose>
					</c:forEach>
					</div>
				</div>
            </div>
            <div id="blank"></div>
        </div>
	</div>
</body>
</html>