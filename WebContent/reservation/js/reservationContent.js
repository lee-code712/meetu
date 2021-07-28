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
	
	$("#typeBtn").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "typeBtn");
	$(newInputElement).attr("id", "typeBtn");
	
	var content = offBtn.innerHTML;
	$(newInputElement).attr("value", content);
	
	$(".typeBtnWrap").append(newInputElement);
}

function typeBtnOnClick() {
	var onBtn = this;
	
	$("#typeBtn").remove();
	
	var newInputElement = document.createElement("input");
	$(newInputElement).attr("type", "hidden");
	$(newInputElement).attr("name", "typeBtn");
	$(newInputElement).attr("id", "typeBtn");
	
	var content = onBtn.innerHTML;
	$(newInputElement).attr("value", content);
	
	$(".typeBtnWrap").append(newInputElement);
}

function reservationBtnClick() {
	alert($("#choiceMonth").attr("value"));
	alert($("#choiceDay").attr("value"));
	alert($("#startTime").attr("value"));
	alert($("#consultTime").attr("value"));
	alert($("#typeBtn").attr("value"));
}