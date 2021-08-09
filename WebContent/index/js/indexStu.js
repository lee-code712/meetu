$(document).ready(function(){ // html이 로드되면 실행됨  
	getSchedule(); // 사이드바 학과들 출력
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
			var res_time = start_time.substring(5,16);
			
			var newDivElement = document.createElement("div");
			$(newDivElement).attr("id", "cal_msg");
			var content = res_time + ", " + p_name + " 교수님과 " + reason;
			newDivElement.innerHTML = content;
			
			$("#calendar_wrap").prepend(newDivElement);
		}
	});
}