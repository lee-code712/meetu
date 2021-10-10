<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/myPage/css/myPageForm.css"/>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/myPage/js/myPage.js"></script>
    <style>
    	.nav-pills > .nav-item > .active {
            background: #1abc9c;
        }
		
		a,
		a:link,
		a:visited,
		a:hover {
		    color: black;
		    text-decoration: none;
		}
		
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
		
		#accountWrap {
			display: none;
			margin-top: 40px;
			width: 316px;
			height: 120px;
			background: white;
			border-radius: 5px;
			border: 1px solid #EAEAEA;
		}
		
		#accountTit {
			display:flex;
			align-items: center;
			padding-left: 20px;
			width: 296px;
			height: 40px;
			font-size: 18px;
		}
		
		#resetPwdDiv {
			display:flex;
			align-items: center;
			padding-left: 20px;
			width: 316px;
			height: 40px;
			font-size: 14px;
		}
		
		#secessionDiv {
			display:flex;
			align-items: center;
			padding-left: 20px;
			width: 316px;
			height: 40px;
			font-size: 14px;
			color: red;
		}
		
		#resetPwdDiv,
		#secessionDiv {
			cursor: pointer;
		}
		
		#toggle {
			width: 100%;
			border-top: 1px solid #EAEAEA;
		}
		
		#toggle:hover {
			cursor: pointer;
		}
		
		#toggleImg {
			display: block; 
			margin: 0px auto;
			width: 20px;
			heihgt: 20px;
		}
		
		#profInfoBtn:focus {
			outline: none;
		}
		
		#moreImg:hover {
			cursor: pointer;
		}
		#footer {
		    display: flex;
		    margin-top: 600px;
		    margin: 0 auto;
		    width: 100%;
		    height: 200px;
		    background: #EDEDED;
		    justify-content: center;
		    align-items: center;
		    color: #535353;
		}
		
		#cancelBtn:focus,
		#editBtn:focus,
		#rejectMsgBtn:focus,
		#msgBtn:focus,
		#approvalBtn:focus,
		#rejectBtn:focus,
		#consultedBtn:focus,
		#consultationRecordBtn:focus {
			outline: none;
		}
				
    </style>
    
    <script>
	    function toggleText() {
	    	  var text = document.getElementById("accountWrap");
	    	  if (text.style.display === "none") {
	    	    text.style.display = "block";
	    	  } else {
	    	    text.style.display = "none";
	    	  }
	    	}
    </script>
</head>

<body id="myPageBodyBg">
<%
	String change_pwd_ck = request.getParameter("change_pwd");
	if(change_pwd_ck != null && change_pwd_ck.equals("1")) {
		out.println("<script>alert('비밀번호가 정상적으로 변경되었습니다.');</script>");
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
            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/><div id="noticeCount">${count_alert}</div>
        </div>
    </div>
</div>

<div id="navWrap">
    <table id="navInnerWrap">
        <tr>
            <td>
                <div id="cardWrap">
                    <div id="navLTit">
                        마이페이지
                    </div>
                    <div id="navListWrap">
                    	<div id="navListSub"></div>
                        <div id="userImgWrap"><img src="/images/user.svg" id="userImg"/></div>
                        <div id="navListName">${mem_dto.getName()}</div>
                        <div id="navList">${univ_dto.getUnivName()}</div>
                        <c:if test="${mem_dto.getRole()=='1'}">
                        <div id="navList"><button id="profInfoBtn" onclick="location.href='profInfoPage.do'">내 정보</button></div>
                            </c:if>
                        <div id="logoutBtnWrap">
                            <button id="logoutBtn" onclick="location.href='logout.do'">로그아웃</button>
                        </div>
                        <div id="toggle" onclick="toggleText()"><img src="/images/toggle.svg" id="toggleImg" /></div>
                    </div>
                   	<div id="accountWrap">
                       	<div id="accountTit">계정</div>
                       	<div id="resetPwdDiv" onclick="location.href='changePwdForm.do'">비밀번호 변경</div>
                       	<div id="secessionDiv" onclick="location.href='secessionForm.do'">회원탈퇴</div>
                    </div>
                </div>
            </td>

            <td>
                <div style="width: 60px"></div>
            </td>

            <td id="navSub">
                <div id="searchWrap">
                    <c:choose>
                        <c:when test="${mem_dto.getRole() == 0}">
                            <input type="text" placeholder="교수명으로 검색" id="searchText"/>
                        </c:when>
                        <c:otherwise>
                            <input type="text" placeholder="학생명으로 검색" id="searchText"/>
                        </c:otherwise>
                    </c:choose>
                    <img src="/images/search.svg" id="searchBtn" onclick="search()"/>
                </div>
                <ul class="nav nav-pills" id="navBox">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#qwe" id="bookedList">예약현황</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#asd" id="canceledList">예약취소</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#zxc" id="approvedList">예약확정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#aaa" id="completedList">상담완료</a>
                    </li>
                </ul>
                <div class="tab-content" style="background: white">
                    <div class="tab-pane fade show active" id="qwe">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                    <th></th>
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="asd">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                    <th></th>
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="zxc">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                    <th></th>
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="aaa">
                        <div id="board">
                            <table class="boardListWrap">
                                <thead>
                                <tr id="thBorder">
                                    <th></th>
                                    <c:choose>
                                        <c:when test="${mem_dto.getRole() == 0}">
                                            <th>교수명</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>학생명</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th>상담일시</th>
                                    <th>장소</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
