var week = new Array('일', '월', '화', '수', '목', '금', '토');
var today = null;
var year = null;
var month = null;
var dayName = null;
var firstDay = null;
var lastDay = null;
var $tdDay = null;
var $tdSche = null;
var jsonData = new Object();
var reservations = null;

$(document).ready(function () {
	getSchedule(); // 사이드바 일정 출력
	
    drawCalendar();
    initDate();
    drawDays();

    $("#movePrevMonth").on("click", function () {
        movePrevMonth();
    });
    $("#moveNextMonth").on("click", function () {
        moveNextMonth();
    });

	var slider_01 = $('.banner_slide').bxSlider({
        auto: true, autoControls: true, mode: 'horizontal',
    });
    // 클릭시 멈춤 현상 해결 //
    $(document).on('click', '.bx-next, .bx-prev', function () {
        slider.stopAuto();
        slider.startAuto();
        slider_01.stopAuto();
        slider_01.startAuto();
    });
    $(document).on('mouseover', '.bx-pager, #bx-pager1', function () {
        slider.stopAuto();
        slider.startAuto();
        slider_01.stopAuto();
        slider_01.startAuto();
        slider_02.stopAuto();
        slider_02.startAuto();
    });
});

//Calendar 그리기
function drawCalendar() {
    var setTableHTML = "";
    setTableHTML += '<table class="calendar">';
    setTableHTML += '<tr><th style="color: #FB7E7E; padding-left: 6px;">일</th><th style="padding-left: 6px;">월</th><th style="padding-left: 6px;">화</th><th style="padding-left: 6px;">수</th><th style="padding-left: 6px;">목</th><th style="padding-left: 6px;">금</th><th style="color: #7E99FB; padding-left: 6px;">토</th></tr>';
    for (var i = 0; i < 6; i++) {
        setTableHTML += '<tr height="80px" >';
        for (var j = 0; j < 7; j++) {
            setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
            setTableHTML += '    <div style="padding: 0 0 0 10px; background: white" class="cal-day"></div>';
            setTableHTML += '    <div class="cal-schedule" id="cal-schedule"></div>';
            setTableHTML += '</td>';
        }
        setTableHTML += '</tr>';
    }
    setTableHTML += '</table>';
    $("#cal_tab").html(setTableHTML);
}

//날짜 초기화
function initDate() {
    week = new Array('일', '월', '화', '수', '목', '금', '토');
    $tdDay = $("td div.cal-day")
    $tdSche = $("td div.cal-schedule")
    dayCount = 0;
    today = new Date();
    year = today.getFullYear();
    month = today.getMonth() + 1;
    date = today.getDate();
    dayName = week[today.getDay()];
    if (month < 10) {
        month = "0" + month;
    }
    firstDay = new Date(year, month - 1, 1);
    lastDay = new Date(year, month, 0);
}

//calendar 날짜표시
function drawDays() {
    $("#cal_top_year").text(year);
    $("#cal_top_month").text(month);
    $("#cal_top_date").text(date);
    $("#cal_top_dayName").text(dayName);
    
    for (var i = 0; i < 42; i += 7) {
        $tdDay.eq(i).css("color", "#FB7E7E");
    }

    for (var i = 6; i < 42; i += 7) {
        $tdDay.eq(i).css("color", "#7E99FB");
    }
    
    var cal_year = $("#cal_top_year").text();
    var cal_month = $("#cal_top_month").text();

    for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
        $tdDay.eq(i).text(++dayCount);
		$tdDay.eq(i).attr("id", $tdDay.eq(i).text());
		
		// 오늘 날짜 표시
		if(today.getFullYear() == cal_year && today.getMonth() == (cal_month - 1) && today.getDate() == dayCount) {
			$tdDay.eq(i).css("color", "#1ABC9C");
		}
		else {
			$tdDay.eq(i).css("background", "");
		}
    }

	for (var i = 0; i < firstDay.getDay(); i++) {
		$tdDay.eq(i).attr("id", "");
	}

}

//calendar 월 이동
function movePrevMonth() {
    month--;
    if (month <= 0) {
        month = 12;
        year--;
    }
    if (month < 10) {
        month = String("0" + month);
    }
    getNewInfo();
}

function moveNextMonth() {
    month++;
    if (month > 12) {
        month = 1;
        year++;
    }
    if (month < 10) {
        month = String("0" + month);
    }
    getNewInfo();
}

//정보갱신
function getNewInfo() {
    for (var i = 0; i < 42; i++) {
        $tdDay.eq(i).text("");
        $tdSche.eq(i).text("");
    }
    dayCount = 0;
    firstDay = new Date(year, month - 1, 1);
    lastDay = new Date(year, month, 0);
    drawDays();
	setData(reservations);
}

//데이터 등록
function setData(reservations) {
	var today = new Date();
    year = today.getFullYear();

	var yearList = new Array();
	var monthList = new Array();
	
	Array.from(reservations).forEach(function(reservation, idx) {
		var start_time = reservation.start_time;
		var name = reservation.name;
		var s_name = reservation.s_name;
		var approval = reservation.approval;
		var reason = reservation.reason;
		
		if (approval == 1) {
			var res_month = start_time.substring(5, 7);
			var res_date = start_time.substring(8, 10);
			var res_time = start_time.substring(11, 16);
			
			var res_info = new Object();
			res_info[res_date] = name + "님과 상담"; // "7":"000 교수님 09:00"
			
			if (!yearList.res_month) { // 처음 등장한 달인 경우
				var monthData = new Object();
				var monthList = new Array();
				var dateList = new Array();
				dateList.push(res_info);
				monthData[res_month] = dateList; // "08":{"7":"000 교수님 09:00"}
				monthList.push(monthData);
				yearList.push(monthList);
			}
			else {
				yearList[res_month].push(res_info); // "08":{"7":"000 교수님 09:00", "15":"000 교수님 10:00"}
			}
		}
	});
	
	jsonData[year] = yearList;
	// alert(JSON.stringify(jsonData)); // {"2021":[[{"08":[{"20":"박창섭 교수님 10:00"}]}],[{"08":[{"19":"이은영 교수님 13:00"}]}]]}
	
	drawSche(jsonData);
}

//스케줄 그리기
function drawSche(jsonData) {
    var dateMatch = null;
	
    for (var i = 0; i < firstDay.getDay() + lastDay.getDate(); i++) { // i를 0부터 시작하게 고쳐 봄 (기존: firstDay.getDay())
        var txt = "";
        txt = jsonData[year]; // [[{"08":[{"20":"박창섭 교수님 10:00"}]}],[{"08":[{"19":"이은영 교수님 13:00"}]}]]

		if (txt) {
			Array.from(txt).forEach(function(monthData, j) {
				t = monthData[0][month]; // [{"20":"박창섭 교수님 10:00"}] || [{"19":"이은영 교수님 13:00"}]
				if (t) {
					Array.from(t).forEach(function(dateData, k){
						var key = "";
						
						if (!Array.isArray(dateData)) { // 예약이 한 개 존재하는 경우 (즉, 객체 형태)
							key = Object.keys(dateData);
							content = dateData[key];
						}
						else { // 예약이 여러 개인 경우 (즉, 배열 형태)
							key = Object.keys(dateData[i]);
							content = dateData[i]; // {"20":"박창섭 교수님 10:00"}
						}
		                
						if (content != "undefined" && content != null) {	
							var newDivElement = document.createElement("div");
							$(newDivElement).attr("class", "cal-schedule");
							
							$(newDivElement).css("background", "#1abc9c");
			                $(newDivElement).css("color", "white");
			                $(newDivElement).css("padding-left", "10px");
			                $(newDivElement).css("border-radius", "3px");
			                $(newDivElement).css("width", "110px");
			                $(newDivElement).css("font-size", "14px");
							
							newDivElement.innerHTML = content;
							
							key *= 1;
							
							if (key == i && $("#" + i).text() == key) {
								$("#" + i).next().append(newDivElement);
							}
						}
					});
            	}
			});
        }
    }
}

$(function () {
    var lastScrollTop = 0, delta = 15;
    $(window).scroll(function (event) {
        var st = $(this).scrollTop();
        if (Math.abs(lastScrollTop - st) <= delta) return; // 스크롤값을 받아서 리턴한다.
        if ((st > lastScrollTop) && (lastScrollTop > 0)) {
            $("header").css("top", "0px"); // 스크롤을 내렸을때 #header의 CSS 속성중 top 값을 -50px로 변경한다.
            $("header").css("background", "rgba(0, 0, 0, .800)");
            $("header").css("color", "black");
        } else {
            $("header").css("top", "0px"); // 스크롤을 올렸을때 #header의 CSS 속성중 top 값을 0px로 변경한다.
            $("header").css("background", "none");
            $("header").css("color", "white");
        }
        lastScrollTop = st;
    });
});

function getSchedule() {
	$.ajax({
	 	type: "GET",
		url: "/index/getSchedule.jsp",
		dataType: "text",
		success: updatePage,
		error: function(jqXHR, textStatus, errorThrown) {
			var message = jqXHR.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + jqXHR.status);
			} else {
				alert(message);	
			}
		}
	});
}

function updatePage (responseText) {
	// alert("schedules: " + responseText);
	
	if (responseText == null || responseText == "" || (typeof(responseText) == "string" && !responseText.trim())) {
		var newDivElement = document.createElement("div");
		var content = "예정된 상담이 없습니다.";
		$(newDivElement).attr("id", "cal_msg");
		newDivElement.innerHTML = content;
			
		$("#calendar_wrap").prepend(newDivElement);
	}
	else {
		reservations = JSON.parse(responseText);
		$("#cal_msg").remove();
		
		setData(reservations); // 달력에 일정 그리기
	
		count = 0;
		Array.from(reservations).forEach(function(reservation, idx) {
			var start_time = reservation.start_time;
			var name = reservation.name;
			var s_name = reservation.s_name;
			var approval = reservation.approval;
			var reason = reservation.reason;
			
			if (approval == 1 && count < 5) {
				count++;
				var res_time = start_time.substring(5, 16);
				
				var newDivElement = document.createElement("div");
				$(newDivElement).attr("id", "cal_msg");
				var content = res_time + ", " + name + "님과 " + reason;
				newDivElement.innerHTML = content;
				
				$("#calendar_wrap").append(newDivElement);
			}
		});
		
		if (count == 0) {
			var newDivElement = document.createElement("div");
			$(newDivElement).attr("id", "cal_msg");
			var content = "예정된 상담이 없습니다.";
			newDivElement.innerHTML = content;
				
			$("#calendar_wrap").prepend(newDivElement);
		}
	}
}

//알림 내역 확인
function readNewAlerts() {
	window.open("alert.do", "childform", "width=400; height=260; left=400; top=180; resizable = no;");
	$("#noticeCount").text(0);
}

// 알림 내역에서 클릭한 바로가기 페이지 url로 이동
window.movePage = function(url) {
	location.href = url;
}