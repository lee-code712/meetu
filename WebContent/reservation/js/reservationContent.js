isTimeBoxClicked = false;
isTimeBoxMidClicked = false;
isTypeBtnOffClicked = false;
isTypeBtnOnClicked = false;

$(document).ready(function(){ // html이 로드되면 실행됨  
  	$(".startTimeBox").click(startTimeBoxClick);
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
});

function startTimeBoxClick() {
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

function timeBoxClick() {
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