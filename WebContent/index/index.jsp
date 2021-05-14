<%-- 로그인 전 메인 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>index</title>
    	<link rel="stylesheet" href="../components/css/header.css" />
   	<link rel="stylesheet" href="./css/index.css" />

    	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
    	var today = null;
    	var year = null;
    	var month = null;
      	var dayName = null;
      	var firstDay = null;
      	var lastDay = null;
      	var $tdDay = null;
      	var $tdSche = null;
      	var jsonData = null;
      	$(document).ready(function() {
          	drawCalendar();
          	initDate();
          	drawDays();
          	drawSche();
          	$("#movePrevMonth").on("click", function(){movePrevMonth();});
          	$("#moveNextMonth").on("click", function(){moveNextMonth();});
      	});
      	//Calendar 그리기
      	function drawCalendar(){
          	var setTableHTML = "";
          	setTableHTML+='<table class="calendar">';
          	setTableHTML+='<tr><th style="color: red">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color: blue">토</th></tr>';
          	for(var i=0;i<6;i++){
              	setTableHTML+='<tr height="45">';
              	for(var j=0;j<7;j++){
                  	setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                  	setTableHTML+='    <div class="cal-day"></div>';
                  	setTableHTML+='    <div class="cal-schedule"></div>';
                  	setTableHTML+='</td>';
              	}
              	setTableHTML+='</tr>';
          	}
          	setTableHTML+='</table>';
          	$("#cal_tab").html(setTableHTML);
      	}
    	  //날짜 초기화
      	function initDate(){
        		week = new Array('일', '월', '화', '수', '목', '금', '토');
          	$tdDay = $("td div.cal-day")
          	$tdSche = $("td div.cal-schedule")
          	dayCount = 0;
          	today = new Date();
          	year = today.getFullYear();
          	month = today.getMonth()+1;
          	date = today.getDate();
          	dayName = week[today.getDay()];
          	if(month < 10){month = "0"+month;}
          	firstDay = new Date(year,month-1,1);
          	lastDay = new Date(year,month,0);
      	}
      	//calendar 날짜표시
      	function drawDays(){
          	$("#cal_top_year").text(year);
          	$("#cal_top_month").text(month);
          	$("#cal_top_date").text(date);
          	$("#cal_top_dayName").text(dayName);
          	for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
          	    $tdDay.eq(i).text(++dayCount);
          	}
          	for(var i=0;i<42;i+=7){
          	    $tdDay.eq(i).css("color","red");
          	}
          	for(var i=6;i<42;i+=7){
          	    $tdDay.eq(i).css("color","blue");
          	}
      	}
    	  //calendar 월 이동
    	  function movePrevMonth(){
    	      month--;
    	      if(month<=0){
    	          month=12;
    	          year--;
    	      }
    	      if(month<10){
    	          month=String("0"+month);
    	      }
    	      getNewInfo();
    	  }
    	  function moveNextMonth(){
    	      month++;
    	      if(month>12){
    	          month=1;
    	          year++;
    	      }
    	      if(month<10){
    	          month=String("0"+month);
    	      }
    	      getNewInfo();
      	}
      	//정보갱신
      	function getNewInfo(){
    	      for(var i=0;i<42;i++){
    	          $tdDay.eq(i).text("");
    	          $tdSche.eq(i).text("");
    	      }
    	      dayCount=0;
    	      firstDay = new Date(year,month-1,1);
    	      lastDay = new Date(year,month,0);
    	      drawDays();
      	    drawSche();
      	}
    	  //데이터 등록
      	function setData(){
      	    jsonData =
    	      {
    	          "2019":{
    	              "07":{
    	                  "17":"제헌절"
    	              }
    	              ,"08":{
    	                  "7":"칠석"
    	                  ,"15":"광복절"
    	                  ,"23":"처서"
        	          }
        	          ,"09":{
        	              "13":"추석"
        	              ,"23":"추분"
        	          }
        	      }
          	}
    	  }
      	//스케줄 그리기
      	function drawSche(){
          	setData();
          	var dateMatch = null;
          	for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
          	    var txt = "";
          	    txt =jsonData[year];
          	    if(txt){
        	          txt = jsonData[year][month];
        	          if(txt){
        	               txt = jsonData[year][month][i];
        	              dateMatch = firstDay.getDay() + i -1;
        	              $tdSche.eq(dateMatch).text(txt);
          	        }
          	    }
          	}
      	}
  	</script>
</head>

<body>
	<div id="topHeader">
		<div id="topHeaderInner">
			<div>
				<div><a>000님 환영합니다</a></div>
				<div>|</div>
				<div><a href="../join/js/login.jsp">로그아웃</a></div>
			</div>
		</div>
	</div>

	<div id="underHeader">
		<div id="underHeaderInner">
			<div id="title"><a href="">MEETU</a></div>
		
			<div id="gnb">
				<div><a href="../notice/js/notice.jsp">공지사항</a></div>
				<div><a href="../reservation/js/reservation.jsp">상담예약</a></div>
				<div><a href="../message/js/message.jsp">쪽지함</a></div>
			</div>
		
			<div id="icon">
				<img src="../components/images/alert.svg" />
				<img src="../components/images/myPage.svg" />
			</div>
		</div>
	</div>

	<table id="banner">
    	<tr>
        	<td rowspan="2">
           		<div class="bannerImg"></div>
            </td>
          
          	<td id="userInfo">
				<div id="userImg"></div>
				<div id="userName">(이름)</div>
				<div id="univName"><img src="./images/univImg.svg" /> &nbsp; 동덕여자대학교</div>
				<div id="userDept"> <img src="./images/dept.svg" /> &nbsp; 컴퓨터학과</div>
				<button id="logoutBtn">로그아웃</button>
			</td>
        </tr>
	</table>

	<section>
    	<div id="calendar">
			<div id="calendarHeader">상담일정</div>
                	
			<div id="calendarBody">
				<div class="cal_top">
        			<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">◀</span></a>
        			<span id="cal_top_year"></span>.
        			<span id="cal_top_month"></span>
        			<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">▶</span></a>
        			<div id="cal_top_date"></div>
        			<span id="cal_top_dayName"></span>요일
        			<div id="cal_msg">등록된 일정이 없습니다.</div>
    			</div>

    			<div id="cal_tab" class="cal"></div>
			 </div>
		</div>

		<div id="notice">			
			<div id="noticeHeader"><span>◇ </span>공지사항<a id="more">+전체보기</a></div>

			<div id="noticeBody">
				<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
            	<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
            	<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
            	<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
			</div>
		</div>

		<div id="alert">
			<div id="alertHeader"><span>◇ </span>알림<a id="more">+전체보기</a></div>

            <div id="alertBody">
				<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
            	<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
            	<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
            	<div>
            		<a href="#">글 제목이 들어갑니다.</a>
            		<span>2021-05-09</span>
            	</div>
			</div>
		</div>
	</section>
</body>
</html>
