<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
    
    <!-- <link rel="stylesheet" href="/myPage/css/profInfoPage.css"/> -->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/myPage/js/profInfo.js"></script>
    <script>
    	var courses = ${courses};
    </script>
    
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
		
		#backBtn:hover {
			cursor: pointer
		}
		
		#backBtn:focus {
			outline: none;
		}
		#footer {
		    display: flex;
		    margin-top: 800px;
		    margin: 0 auto;
		    width: 100%;
		    height: 200px;
		    background: #EDEDED;
		    justify-content: center;
		    align-items: center;
		    color: #535353;
		}
		#blank {
			height: 80px;
		}
		
		* {
    padding: 0px;
    margin: 0px;
}

body {
    background: #FAFAFA;
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

#navWrap {
    padding-top: 80px;
    display: flex;
    justify-content: space-between;
    margin: 0 auto;
    width: 1194px;
}

#navL {
    width: 318px;
    height: 500px;
    border-radius: 5px;
}

#navLTit {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 40px;
    border: 1px solid #EAEAEA;
    font-size: 16px;
    background: white;
    border-radius: 5px 5px 0px 0px;
}

#navListWrap {
    width: 100%;
    border-bottom: 1px solid #EAEAEA;
    border-left: 1px solid #EAEAEA;
    border-right: 1px solid #EAEAEA;
    background: white;
    border-radius: 0px 0px 5px 5px;
}

#navListName {
    display: flex;
    align-items: center;
    width: 298px;
    height: 40px;
    padding-left: 20px;
    font-size: 14px;
    color: #1abc9c;
}

#profDataMfBtnWrap {
    margin-top: 60px;
    margin-bottom: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 40px;
    font-size: 14px;
}

#navList {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 40px;
    font-size: 14px;
}

#profMfName {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 318px;
    height: 40px;
    font-size: 14px;
    background: #1abc9c;
    color: white;
}

#navR {
    width: 816px;
    height: 500px;
}

#navRTit {
    display: flex;
    align-items: center;
    padding-left: 20px;
    width: 796px;
    height: 40px;
    font-size: 16px;
    background: white;
    border-radius: 5px 5px 0px 0px;
    border: 1px solid #EAEAEA;
}

#navRContentWrap {
    width: 776px;
    padding: 0px 20px;
    background: white;
    border-radius: 0px 0px 5px 5px;
    border-bottom: 1px solid #EAEAEA;
    border-left: 1px solid #EAEAEA;
    border-right: 1px solid #EAEAEA;
    font-size: 14px;
}

#noticeImg {
    width: 14px;
    height: 14px;
}

#noticeImg:hover {
    cursor: pointer;
}

#backBtn {
    width: 100px;
    height: 40px;
    font-size: 14px;
    color: #1abc9c;
    background: white;
    border-radius: 5px;
    border: 1px solid #1abc9c;
}

#profDataMfBtn:hover {
    width: 100px;
    height: 40px;
    font-size: 14px;
    color: white;
    background: #1abc9c;
    border-radius: 5px;
    border: none;
    cursor: pointer;
}

#userImgWrap {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 316px;
    height: 180px;
    font-size: 14px;
    background-image: url("/images/user.svg");
    background-position: center;
    background-size: cover;
}

#modifyBtn {
    padding: 2px 8px;
    color: #C4C4C4;
    background: #EAEAEA;
    border-radius: 50px;
    border: none;
}

#modifyBtn:hover {
    cursor: pointer;
}

.swal-button {
    padding: 7px 19px;
    border-radius: 2px;
    font-size: 12px;
    text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}

#profNameMfWrap,
#profDeptMfWrap,
#profMajorMfWrap,
#profSubjectMfWrap,
#profEmailMfWrap,
#profLocationMfWrap,
#profAbleTimeMfWrap {
    padding: 20px 0px;
    border-bottom: 1px dotted #EAEAEA;
}

#profNameMfTit,
#profDeptMfTit,
#profMajorMfTit,
#profSubjectMfTit,
#profEmailMfTit,
#profLocationMfTit,
#profAbleTimeMfTit {
    color: #1abc9c;
    margin-bottom: 20px;
}

#profMajorContentWrap,
#profSubjectContentWrap,
#profEmailContentWrap,
#profLocationContentWrap,
#profAbleTimeContentWrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#blankDiv {
    width: 60px;
}

#profSubjectMfText,
#profAbleTimeMfText {
    margin-bottom: 10px;
}

#profSubjectMfText:last-child,
#profAbleTimeMfText:last-child {
    margin-bottom: 0px;
}

#rejectBtn {
	color: red;
	cursor: pointer;
}

		#daysOfTheWeek,
		#startTimes {
			margin-bottom: 10px;
		}
		
		#courseList,
		#daysOfTheWeek,
		#startTimes,
		#endTimes {
			padding-left: 10px;
			width: 240px;
			height: 34px;
			border-radius: 50px;
			border: none;
			box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		    transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
		    color: #535353;
		}
		
		#courseList:hover,
		#daysOfTheWeek:hover,
		#startTimes:hover,
		#endTimes:hover {
			cursor: pointer;
		}
		
		#courseList:focus,
		#daysOfTheWeek:focus,
		#startTimes:focus,
		#endTimes:focus {
			outline: none;
		}
	</style>
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
</div>
</body>
</html>