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
            <img src="/images/bell.svg" id="noticeImg"/>
        </div>
    </div>
</div>

<div id="navWrap">
    <div id="navL">
        <div id="navLTit">교수 정보</div>
        <div id="navListWrap">
            <div id="userImgWrap"></div>
            <div id="profMfName">${mem_dto.getName()}</div>
            <div id="navList">${univ_dto.getUnivName()}</div>
            <div id="profDataMfBtnWrap">
                <button id="profDataMfBtn">저장</button>
            </div>
        </div>
    </div>

    <div id="navR">
        <div id="navRTit">교수 정보 수정</div>
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
                <div>
                    <div id="profMajorMfTit">전공</div>
                    <div id="profMajorMfText">${param.major}</div>
                </div>
                <button id="modifyBtn" onClick="majorMfBtn()">수정</button>
            </div>
            <div id="profSubjectMfWrap">
                <div>
                    <div id="profSubjectMfTit">담당과목</div>
                    <div id="profSubjectMfText">
                    	<c:forEach items="${courses}" var="list">
                    		<c:if test="${list.course_by_prof != null}">
							 	${list.course_by_prof} &nbsp;<a id="${list.course_id}" style="color:red; cursor:pointer;" onClick="classRemoveBtn()">x</a><br/>
							 </c:if>
						</c:forEach>
					</div>
                </div>
                <button id="modifyBtn" onClick="subjectMfBtn()">추가</button>
            </div>
            <div id="profEmailMfWrap">
                <div>
                    <div id="profEmailMfTit">이메일</div>
                    <div id="profEmailMfText">${param.email}</div>
                </div>
                <button id="modifyBtn" onClick="emailMfBtn()">수정</button>
            </div>
            <div id="profLocationMfWrap">
                <div>
                    <div id="profLocationMfTit">연구실 위치</div>
                    <div id="profLocationMfText">${param.office}</div>
                </div>
                <button id="modifyBtn" onClick="profLocationMfBtn()">수정</button>
            </div>
            <div id="profAbleTimeMfWrap">
                <div>
                    <div id="profAbleTimeMfTit">상담 가능 시간</div>
                    <div id="profAbleTimeMfText">
						<c:forEach items="${consultable_times}" var="list">
							<c:choose>
								<c:when test="${list.able_date == 0}">일</c:when>
								<c:when test="${list.able_date == 1}">월</c:when>
								<c:when test="${list.able_date == 2}">화</c:when>
								<c:when test="${list.able_date == 3}">수</c:when>
								<c:when test="${list.able_date == 4}">목</c:when>
								<c:when test="${list.able_date == 5}">금</c:when>
								<c:otherwise>토</c:otherwise>
							</c:choose>
							 ${list.able_time} &nbsp;<a style="color:red; cursor:pointer;" onClick="alert('클릭');">x</a><br/>
						</c:forEach>
					</div>
                </div>
                <button id="modifyBtn" onClick="profAbleTimeMfBtn()">추가</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>