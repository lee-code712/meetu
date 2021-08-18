$(document).ready(function(){ // html이 로드되면 실행됨 
	// 각 버튼에 click 이벤트 설정
	$(".timeBox").click(timeBoxClick);
	$("#typeBtnOff").click(typeBtnOffClick);
	$("#typeBtnOn").click(typeBtnOnClick);
	$(".reservationBtn").click(reservationBtnClick);
	
	// 교수 이메일을 파라미터로 보내기 위해 이메일 정보 hidden으로 저장
	var email = document.getElementById("email");
	
	$("#prof_email").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "prof_email");
	$(newInputElement).attr("id", "prof_email");
	
	var content = email.innerHTML;
	content = content.substring(5, content.length); // bad
	
	$(newInputElement).attr("value", content);
	
	$("#navL").append(newInputElement);
	
	// ajax로 교수 상담 가능 시간 받아와 캘린더 생성
	$.ajax({
	 	type: "GET",
		url: "/reservation/getProfessorSchedule.jsp?prof_email=" + content,
		dataType: "text",
		success: buildCalendar,
		error: function(jqXHR, textStatus, errorThrown) {
			var message = jqXHR.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + jqXHR.status);
			} else {
				alert(message);	
			}
		}
	});
});


var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

/**
* @brief   이전달 버튼 클릭
*/
function prevCalendar() {
	this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

	// 교수 이메일을 파라미터로 보내기 위해 이메일 정보 hidden으로 저장
	var email = document.getElementById("email");
			
	$("#prof_email").remove();
			
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "prof_email");
	$(newInputElement).attr("id", "prof_email");
	
	var content = email.innerHTML;
	content = content.substring(5, content.length); // bad
	$(newInputElement).attr("value", content);
			
	$("#navL").append(newInputElement);

	// ajax로 교수 상담 가능 시간 받아오기
	$.ajax({
	 	type: "GET",
		url: "/reservation/getProfessorSchedule.jsp?prof_email=" + content,
		dataType: "text",
		success: buildCalendar, // @param 전월 캘린더 출력 요청
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

/**
 * @brief   다음달 버튼 클릭
 */
function nextCalendar() {
    this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());

	// 교수 이메일을 파라미터로 보내기 위해 이메일 정보 hidden으로 저장
	var email = document.getElementById("email");
	
	$("#prof_email").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "prof_email");
	$(newInputElement).attr("id", "prof_email");

	var content = email.innerHTML;
	content = content.substring(5, content.length); // bad
	$(newInputElement).attr("value", content);
	
	$("#navL").append(newInputElement);
    
	// ajax로 교수 상담 가능 시간 받아오기
	$.ajax({
	 	type: "GET",
		url: "/reservation/getProfessorSchedule.jsp?prof_email=" + content,
		dataType: "text",
		success: buildCalendar, // @param 명월 캘린더 출력 요청
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

/**
 * @brief   캘린더 오픈
 * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
 */
function buildCalendar(responseText) {
	// alert(responseText);
	var schedules = JSON.parse(responseText);

    let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

    let tbCalendar = document.querySelector(".scriptCalendar > tbody");

    document.getElementById("calYear").innerText = today.getFullYear();		// @param YYYY월
    document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월

    // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
    while (tbCalendar.rows.length > 0) {
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
    }

    // @param 첫번째 개행
    let row = tbCalendar.insertRow();

    // @param 날짜가 표기될 열의 증가값
    let dom = 1;

    // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
    // 7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.

    let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

    // @param 달력 출력

    // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
    for (let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

        let column = row.insertCell();

        // @param 평일( 전월일과 익월일의 데이터 제외 )
        if (Math.sign(day) == 1 && lastDate.getDate() >= day) {
            // @param 평일 날짜 데이터 삽입
            column.innerText = autoLeftPad(day, 2);

            // @param 일요일인 경우
            if (dom % 7 == 1) {
                column.style.color = "#FF4D4D";
            }

            // @param 토요일인 경우
            if (dom % 7 == 0) {
                column.style.color = "#4D4DFF";
                row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
            }

        }

        // @param 평일 전월일과 익월일의 데이터 날짜변경
        else {
            let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
            column.innerText = autoLeftPad(exceptDay.getDate(), 2);
            column.style.color = "#E5E5E5";
        }

        // @brief   전월, 명월 음영처리
        // @details 현재년과 선택 년도가 같은경우
        if (today.getFullYear() == date.getFullYear()) {

            // @details 현재월과 선택월이 같은경우
            if (today.getMonth() == date.getMonth()) {

                // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                if (date.getDate() > day && Math.sign(day) == 1) {
                    column.style.color = "#E5E5E5";
                }

                // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                else if (date.getDate() < day && lastDate.getDate() >= day) {
					// 교수 불가능 일자 disable
					for(var key in schedules) {
						var disable_date = schedules[key].disable_date;
						var disable_time = schedules[key].disable_time;
						var p_user_id = schedules[key].p_user_id;
						var size = Object.keys(schedules).length;
						
						var dateObj = new Date(doMonth.getFullYear(), doMonth.getMonth(), Number(day));
						
						// 불가능 일자
						if (dateObj.getDay() == disable_date && disable_time == "09:00~19:00") { // 해당 일이 아예 상담 불가능한 경우
							column.style.color = "#E5E5E5";
							break;
						}
						else if (key == Object.keys(schedules)[size - 1]) {
							// alert("getDay(): " + (dateObj.getDay()) + ", disable_date: " + disable_date + ", disable_time: " + disable_time);
							column.style.backgroundColor = "#FFFFFF";
                    		column.style.cursor = "pointer";
                    		column.onclick = function () {
                        		calendarChoiceDay(this, schedules);
                    		}
						}
						else {
							continue;
						}
					}
                }

                // @details 현재일인 경우
                else if (date.getDate() == day) {
					// 교수 불가능 일자 disable
					for(var key in schedules) {
						var disable_date = schedules[key].disable_date;
						var disable_time = schedules[key].disable_time;
						var p_user_id = schedules[key].p_user_id;
						var size = Object.keys(schedules).length;
						
						var dateObj = new Date(doMonth.getFullYear(), doMonth.getMonth(), Number(day));
						
						// 불가능 일자
						if (dateObj.getDay() == disable_date && disable_time == "09:00~19:00") { // 해당 일이 아예 상담 불가능한 경우
							column.style.color = "#E5E5E5";
							column.style.backgroundColor = "#FBAB7E";
							break;
						}
						else if (key == Object.keys(schedules)[size - 1]) {
							// alert("getDay(): " + (dateObj.getDay()) + ", disable_date: " + disable_date + ", disable_time: " + disable_time);
							column.style.backgroundColor = "#FBAB7E";
                    		column.style.cursor = "pointer";
                    		column.onclick = function () {
                        		calendarChoiceDay(this, schedules);
                    		}
						}
						else {
							continue;
						}
					}
                }

                // @details 현재월보다 이전인경우
            } else if (today.getMonth() < date.getMonth()) {
                if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.color = "#E5E5E5";
                }
            }

            // @details 현재월보다 이후인경우
            else {
                if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    // 교수 불가능 일자 disable
					for(var key in schedules) {
						var disable_date = schedules[key].disable_date;
						var disable_time = schedules[key].disable_time;
						var p_user_id = schedules[key].p_user_id;
						var size = Object.keys(schedules).length;
						
						var dateObj = new Date(doMonth.getFullYear(), doMonth.getMonth(), Number(day));
						
						// 불가능 일자
						if (dateObj.getDay() == disable_date && disable_time == "09:00~19:00") { // 해당 일이 아예 상담 불가능한 경우
							column.style.color = "#E5E5E5";
							break;
						}
						else if (key == Object.keys(schedules)[size - 1]) {
							column.style.backgroundColor = "#FFFFFF";
                    		column.style.cursor = "pointer";
                    		column.onclick = function () {
                        		calendarChoiceDay(this, schedules);
                    		}
						}
						else {
							continue;
						}
					}
                }
            }
        }

        // @details 선택한년도가 현재년도보다 작은경우
        else if (today.getFullYear() < date.getFullYear()) {
            if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#E5E5E5";
            }
        }

        // @details 선택한년도가 현재년도보다 큰경우 - 어떻게 년도를 찾아야 할지 모르겠음...
        else {
            if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#FFFFFF";
                column.style.cursor = "pointer";
                column.onclick = function () {
                    calendarChoiceDay(this, schedules);
                }
            }
        }

        dom++;
    }
}

/**
 * @brief   날짜 선택
 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
 */
function calendarChoiceDay(column, schedules) {
    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
    if (document.getElementsByClassName("choiceDay")[0]) {
        document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        // 추가 - 기존 선택일이 존재하는 경우 hidden 값 삭제
        $("#choiceDay").remove();
        $("#choiceMonth").remove();
    }

    // @param 선택일 체크 표시
    column.style.backgroundColor = "#F8CA6B";

    // @param 선택일 클래스명 변경
    column.classList.add("choiceDay");

    // 추가 - hidden 값 생성
    // 선택한 일
    var newInputDayElement = document.createElement("input");
    $(newInputDayElement).attr("type", "hidden");
    $(newInputDayElement).attr("id", "choiceDay");
    $(newInputDayElement).attr("name", "choiceDay");

    var contentDay = column.innerHTML;

    $(newInputDayElement).attr("value", contentDay);

    $("#navRContentWrap").append(newInputDayElement);

    // 선택한 월
    var newInputMonthElement = document.createElement("input");
    $(newInputMonthElement).attr("type", "hidden");
    $(newInputMonthElement).attr("id", "choiceMonth");
    $(newInputMonthElement).attr("name", "choiceMonth");

    var contentMonth = document.getElementById("calMonth").innerHTML;
    $(newInputMonthElement).attr("value", contentMonth);

    $("#navRContentWrap").append(newInputMonthElement);

	// 추가 - startTimeBox, timeBox onclick 이벤트 생성
	var classes = document.getElementsByClassName("startTimeBox");
	
	Array.from(classes).forEach(function(c, i) {
		$(c).css("background", "#FFFFFF");
		$(c).attr("isDisabled", "false");
		$(c).off("click");
	});
	
	let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	
	// startTimeBox
	var all_able_day = true;
	
	Array.from(schedules).forEach(function(schedule, i) {
		var disable_date = schedule.disable_date;
		var disable_time = schedule.disable_time;
		var p_user_id = schedule.p_user_id;
		
		var dateObj = new Date(doMonth.getFullYear(), doMonth.getMonth(), Number(contentDay));
		// alert("getDay(): " + (dateObj.getDay()) + ", disable_date: " + disable_date + ", disable_time: " + disable_time);
		if (disable_time != "09:00~19:00") { // 전체 불가능 일이 아니고
			if (dateObj.getDay() == disable_date) { // 선택 요일이 disable_date인 경우
				all_able_day = false;
				
				// 불가능 시작 시간
				var disable_timeArr = disable_time.split("~");
				var j = 0;
				
				while ($(classes[j]).attr("id") != disable_timeArr[0]) {
					j++;
				}
				
				while ($(classes[j]).attr("id") != disable_timeArr[1]) {
					// $(classes[j]).unbind("hover"); // 동작 X
					// 버튼에 없는 시간이면 while문 종료
					if(disable_timeArr[1] == "18:00" || disable_timeArr[1] == "19:00") {
						break;
					}
					$(classes[j]).attr("isDisabled", "true");
					classes[j].style.backgroundColor = "#E5E5E5";
					j++;
				}
			}
		}
	});
	
	// 각 시작시간 항목의 isDisabled속성이 true가 아닌 경우 클릭 이벤트 생성
	Array.from(classes).forEach(function(element, i) {
		if($(element).attr("isDisabled") != "true") {
			$(element).click(startTimeBoxClick);
		}
	});
	
	if (all_able_day) {
		Array.from(classes).forEach(function(c, i) {
			$(c).click(startTimeBoxClick);
		});
	}
}

/**
 * @brief   숫자 두자릿수( 00 ) 변경
 * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
 * @param   num     앞에 0을 붙일 숫자 값
 * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
 */
function autoLeftPad(num, digit) {
    if (String(num).length < digit) {
        num = new Array(digit - String(num).length + 1).join("0") + num;
    }

    return num;
}

function startTimeBoxClick() { 
	if(!$("#choiceDay").attr("value")) {
		alert("상담 날짜를 먼저 선택해 주세요.");
		return false;
	}

	var classes = document.getElementsByClassName("startTimeBox");
	
	Array.from(classes).forEach(function(c, i) {
		if($(c).attr("isDisabled") != "true") {
			$(c).css("display", "flex");
			$(c).css("align-items", "center");
			$(c).css("justify-content", "center");
			$(c).css("height", "40px");
			$(c).css("width", "96px");
			$(c).css("border", "1px solid #C4C4C4");
			$(c).css("border-radius", "5px");
			$(c).css("text-align", "center");
			$(c).css("font-weight", "regular");
			$(c).css("background", "#FFFFFF");
		}
	});
	
	var timeBox = this;
	
	$(timeBox).css("display", "flex");
	$(timeBox).css("align-items", "center");
	$(timeBox).css("justify-content", "center");
	$(timeBox).css("height", "40px");
	$(timeBox).css("width", "96px");
	$(timeBox).css("border", "1px solid  #1abc9c");
	$(timeBox).css("border-radius", "5px");
	$(timeBox).css("text-align", "center");
	$(timeBox).css("font-weight", "regular");
	$(timeBox).css("cursor", "pointer");
	$(timeBox).css("background", "#1abc9c");
	$(timeBox).css("color", "white");
	
	$("#startTime").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "startTime");
	$(newInputElement).attr("id", "startTime");
	
	var content = timeBox.childNodes[0].innerHTML;
	
	$(newInputElement).attr("value", content);
	
	$("#startTimeTitle").append(newInputElement);
}

function timeBoxClick() {
	if(!$("#choiceDay").attr("value")) {
		alert("상담 날짜를 먼저 선택해 주세요.");
		return false;
	}

	if(!$("#startTime").attr("value")) {
		alert("상담 시작 시간을 먼저 선택해 주세요.");
		return false;
	}
	
	var classes = document.getElementsByClassName("timeBox");
	
	Array.from(classes).forEach(function(c, i) {
		if($(c).attr("isDisabled") != "true") {
			$(c).css("display", "flex");
			$(c).css("align-items", "center");
			$(c).css("justify-content", "center");
			$(c).css("height", "40px");
			$(c).css("width", "96px");
			$(c).css("border", "1px solid #C4C4C4");
			$(c).css("border-radius", "5px");
			$(c).css("text-align", "center");
			$(c).css("font-weight", "regular");
			$(c).css("background", "#FFFFFF");
		}
	});
	
	var timeBox = this;
	
	$(timeBox).css("display", "flex");
	$(timeBox).css("align-items", "center");
	$(timeBox).css("justify-content", "center");
	$(timeBox).css("height", "40px");
	$(timeBox).css("width", "96px");
	$(timeBox).css("border", "1px solid  #1abc9c");
	$(timeBox).css("border-radius", "5px");
	$(timeBox).css("text-align", "center");
	$(timeBox).css("font-weight", "regular");
	$(timeBox).css("cursor", "pointer");
	$(timeBox).css("background", "#1abc9c");
	$(timeBox).css("color", "white");
	
	$("#consultTime").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "consultTime");
	$(newInputElement).attr("id", "consultTime");
	
	var content = timeBox.innerHTML;
	$(newInputElement).attr("value", content);
	
	$("#timeTitle").append(newInputElement);
}

function typeBtnOffClick() {
	var offBtn = this;
	
	$("#type").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "type");
	$(newInputElement).attr("id", "type");
	
	var content = offBtn.childNodes[0].innerHTML;
	$(newInputElement).attr("value", content);
	
	$(".typeBtnWrap").append(newInputElement);
}

function typeBtnOnClick() {
	var onBtn = this;
	
	$("#type").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "type");
	$(newInputElement).attr("id", "type");
	
	var content = onBtn.childNodes[0].innerHTML;
	$(newInputElement).attr("value", content);
	
	$(".typeBtnWrap").append(newInputElement);
}

function reservationBtnClick() {
	if($("input:radio[id='radio5']").is(":checked") && $("#anotherReason").val()) {
		$("#radio5").attr("value", $("#anotherReason").val());
	}
}

function ck_reservation_form() {
	var form = document.join_form;
        
	if(!$("#choiceDay").attr("value")) {
		alert("상담 날짜를 선택해 주세요.");
		return false;
	}
    	
	if(!$("#startTime").attr("value")) {
		alert("상담 시작 시간을 선택해 주세요.");
		return false;
	}
    
	if(!$("#consultTime").attr("value")) {
		alert("상담 시간을 선택해 주세요.");
		return false;
	}
	
	if(!$("input:radio[name=radio]").is(":checked")) {
		alert("상담 신청 사유를 선택해 주세요.");
		return false;
	}
	
	if(!$("#type").attr("value")) {
		alert("상담 유형을 선택해 주세요.");
		return false;
	}
	
	if($("input:radio[id='radio5']").is(":checked") && !$("#anotherReason").val()) {
		alert("기타 사유를 입력해 주세요.");
		return false;
	}
}