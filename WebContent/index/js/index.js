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

$(document).ready(function () {
    drawCalendar();
    initDate();
    drawDays();
    drawSche();
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

	getSchedule(); // 사이드바 일정 출력
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
            setTableHTML += '    <div class="cal-schedule"></div>';
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
    for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
        $tdDay.eq(i).text(++dayCount);
    }
    for (var i = 0; i < 42; i += 7) {
        $tdDay.eq(i).css("color", "#FB7E7E");
    }


    for (var i = 6; i < 42; i += 7) {
        $tdDay.eq(i).css("color", "#7E99FB");
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
    drawSche();
}

//데이터 등록
function setData() {
    jsonData =
        {
            "2021": {
                "08": {
                    "7": "000교수님 오전 9:00"
                    , "15": "000교수님 오전 10:00"
                    , "23": "000교수님 오전 12:00"
                }
                , "09": {
                    "4": "000교수님 오후 1:00"
                    , "23": "000교수님 오후 2:00"
                }
            }
        }
}

//스케줄 그리기
function drawSche() {
    setData();
    var dateMatch = null;
    for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
        var txt = "";
        txt = jsonData[year];
        if (txt) {
            txt = jsonData[year][month];
            if (txt) {
                txt = jsonData[year][month][i];
                dateMatch = firstDay.getDay() + i - 1;
                $tdSche.eq(dateMatch).text(txt);
                $tdSche.eq(dateMatch).css("background", "#1abc9c");
                $tdSche.eq(dateMatch).css("color", "white");
                $tdSche.eq(dateMatch).css("padding-left", "10px");
                $tdSche.eq(dateMatch).css("border-radius", "3px");
                $tdSche.eq(dateMatch).css("width", "100px");
                $tdSche.eq(dateMatch).css("font-size", "14px");

            }
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
	var reservations = JSON.parse(responseText);
	
	if (reservations != null) {
		$("#cal_msg").remove();
	}
	
	count = 0;
	Array.from(reservations).forEach(function(reservation, idx) {
		var start_time = reservation.start_time;
		var p_name = reservation.p_name;
		var approval = reservation.approval;
		var reason = reservation.reason;
		
		if(approval == 1 && count < 5) {
			count++;
			var res_time = start_time.substring(5, 16);
			
			var newDivElement = document.createElement("div");
			$(newDivElement).attr("id", "cal_msg");
			var content = res_time + ", " + p_name + " 교수님과 " + reason;
			newDivElement.innerHTML = content;
			
			$("#calendar_wrap").prepend(newDivElement);
		}
	});
}