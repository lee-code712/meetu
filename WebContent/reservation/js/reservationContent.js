isTimeBoxClicked = false;
isTimeBoxMidClicked = false;
isTypeBtnOffClicked = false;
isTypeBtnOnClicked = false;

$(document).ready(function(){ // html이 로드되면 실행됨  
	// 각 버튼에 click 이벤트 설정
  	// $(".startTimeBox").click(startTimeBoxClick);
	$(".timeBox").click(timeBoxClick);
	$(".typeBtnOff").click(typeBtnOffClick);
	$(".typeBtnOn").click(typeBtnOnClick);
	$(".reservationBtn").click(reservationBtnClick);
	
	// 교수 이메일을 파라미터로 보내기 위해 이메일 정보 hidden으로 저장
	var email = document.getElementById("email");
	
	$("#prof_email").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "prof_email");
	$(newInputElement).attr("id", "prof_email");
	
	var content = email.innerHTML;
	content = content.substring(7, content.length);
	$(newInputElement).attr("value", content);
	
	$(".mylist").append(newInputElement);
	
	// ajax로 교수 상담 가능 시간 받아오기
	$.ajax({
	 	type: "GET",
		url: "/reservation/getProfessorSchedule.jsp?prof_email=" + content,
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
	
});

function updatePage(responseText) {
	var schedules = JSON.parse(responseText);
	
	Array.from(schedules).forEach(function(schedule, i) {
		var able_date = schedule.able_date;
		var able_time = schedule.able_time;
		var p_user_id = schedule.p_user_id;
		
		// 가능 일자
		
		// 가능 시작 시간
		
		// 가능 시간
		
	});
}

function startTimeBoxClick() { // 시간 선택되어 있으면 닫히도록
	var timeBox = this;
	
	$("#startTime").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "startTime");
	$(newInputElement).attr("id", "startTime");
	
	var content = timeBox.innerHTML;
	$(newInputElement).attr("value", content);
	
	$("#startTimeTitle").append(newInputElement);
}

function timeBoxClick() { // 시작 시간 선택되어 있으면 닫히도록
	var timeBox = this;
	
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
	
	var content = offBtn.innerHTML;
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
	
	var content = onBtn.innerHTML;
	$(newInputElement).attr("value", content);
	
	$(".typeBtnWrap").append(newInputElement);
}

function reservationBtnClick() {
	if($("input:checkbox[id='type5']").is(":checked") && $("#reasonEtc").val()) {
		$("#type5").attr("value", $("#reasonEtc").val());
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
	
	if(!$("input:checkbox[name=reason]").is(":checked")) {
		alert("상담 신청 사유를 선택해 주세요.");
		return false;
	}
	
	if(!$("#type").attr("value")) {
		alert("상담 유형을 선택해 주세요.");
		return false;
	}
	
	if($("input:checkbox[id='type5']").is(":checked") && !$("#reasonEtc").val()) {
		alert("기타 사유를 입력해 주세요.");
		return false;
	}
}