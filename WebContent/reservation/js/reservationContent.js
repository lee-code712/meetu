isTimeBoxClicked = false;
isTimeBoxMidClicked = false;
isTypeBtnOffClicked = false;
isTypeBtnOnClicked = false;

$(document).ready(function(){ // html이 로드되면 실행됨  
  	$("#timeBox").click(timeBoxClick);
	$("#timeBoxMid").click(timeBoxMidClick);
	$("#typeBtnOff").click(typeBtnOffClick);
	$("#typeBtnOn").click(typeBtnOclick);
});

function timeBoxClick() {
	timeBox = this;
	
	if(isTimeBoxClicked) {
		this.css("","");
	}
	else {
		
	}
}