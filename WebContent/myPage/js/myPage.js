$(document).ready(function() { // html이 로드되면 실행됨 
	$(".nav-item").children().click(getReservations);
	$("#bookedList").trigger("click");
	var clicked_item;
	var selected_button;
	var res_id;
});

// 상담 목록 반환
function getReservations() {
	clicked_item = $(this).attr('id');
	$(".boardListWrap tbody").children().remove();
	
	$.ajax({
		 type: "GET",
		url: "/myPage/getReservationsInfo.jsp?clicked_item=" + clicked_item,
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

function updatePage(responseText) {
	var reservations = JSON.parse(responseText);
	
	for(var key in reservations) {
		var start_time = key;
		var res_id = reservations[key][0];
		var state = reservations[key][1];
		var name = reservations[key][2];
		var role = reservations[key][3];
		var dept_name = reservations[key][4];
		var temp_html = '';
			
		temp_html += "<tr id=" + res_id + ">";
		if(role == "1") {
			temp_html += "<td onclick=\"readReservationInfo();\">더보기</td><td>" + name + "교수님</td><td>" + dept_name + "</td><td>" + start_time + "</td>";
			
			if(clicked_item == "bookedList") {
				temp_html += "<td><button id=\"editBtn\" onclick=\"buttonEvent();\">수정하기</button></td>"
				temp_html += "<td><button id=\"cancelBtn\" onclick=\"buttonEvent();\">취소하기</button></td></tr>";
				$('#qwe tbody').append(temp_html);
			}
			else if(clicked_item == "canceledList") {
				if(state == "2") {
					temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage();\">반려사유</button></td></tr>";
				}
				else {
					temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage();\">취소사유</button></td></tr>";
				}
				$('#asd tbody').append(temp_html);
			}
			else if(clicked_item == "approvedList") {
				temp_html += "<td><button id=\"msgBtn\" onclick=\"location.href='message.do'\">쪽지함</button></td></tr>";
				$('#zxc tbody').append(temp_html);
			}
			else {
				temp_html += "</tr>";
				$('#aaa tbody').append(temp_html);
			}
		}
		else {
			temp_html += "<td onclick=\"readReservationInfo();\">더보기</td><td>" + name + "학생</td><td>" + dept_name + "</td><td>" + start_time + "</td>";
			if(clicked_item == "bookedList") {
				temp_html += "<td><button id=\"approvalBtn\" onclick=\"buttonEvent();\">승인하기</button></td>";
				temp_html += "<td><button id=\"rejectBtn\" onclick=\"buttonEvent();\">반려하기</button></td></tr>";
				$('#qwe tbody').append(temp_html);
			}
			else if(clicked_item == "canceledList") {
				if(state == "2") {
					temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage();\">반려사유</button></td></tr>";
				}
				else {
					temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage();\">취소사유</button></td></tr>";
				}
				$('#asd tbody').append(temp_html);
			}
			else if(clicked_item == "approvedList") {
				temp_html += "<td><button id=\"editBtn\" onclick=\"buttonEvent();\">수정하기</button></td>"
				temp_html += "<td><button id=\"cancelBtn\" onclick=\"buttonEvent();\">취소하기</button></td>";
				temp_html += "<td><button id=\"consultedBtn\" onclick=\"buttonEvent();\">완료하기</button></td></tr>"
				$('#zxc tbody').append(temp_html);
			}
			else {
				temp_html += "<td><button id=\"consultationRecordBtn\" onclick=\"buttonEvent();\">상담일지</button></td></tr>"
				$('#aaa tbody').append(temp_html);
			}
		}
	}
}

// confirm이 필요한 버튼 이벤트
function buttonEvent() {
	selected_button = event.currentTarget.id;
	res_id = event.currentTarget.closest("tr").id;
	
	if(selected_button == "editBtn") {
		// 수정하는 페이지 이동
	}
	else if(selected_button == "cancelBtn") {
		if (confirm("선택한 예약을 취소하시겠습니까?") == true) 
			window.open("/myPage/writeRejectMessage.jsp", "childform", "width=500; height=300; left=400; top=130; resizable = no;");
		else 
			return;
	}
	else if(selected_button == "approvalBtn") {
		if (confirm("선택한 예약을 승인하시겠습니까?") == true) 
			changeReservationState();
		else 
			return;
	}
	else if(selected_button == "rejectBtn") {
		if (confirm("선택한 예약을 반려하시겠습니까?") == true) {
			window.open("/myPage/writeRejectMessage.jsp", "childform", "width=500; height=300; left=400; top=130; resizable = no;");
		}
		else 
			return;
	}
	else if(selected_button == "consultedBtn") {
		if (confirm("선택한 상담을 진행하셨습니까?") == true) {
			changeReservationState();
		}
		else 
			return;
	}
	else if(selected_button == "consultationRecordBtn") {
		location.href="consultationRecord.do?res_id=" + res_id;
	}
}

// 예약 상태 변경
function changeReservationState() {
	var data = {"res_id":res_id, "selected_button":selected_button};
	
	$.ajax({
		 type: "POST",
		url: "/myPage/changeReservationState.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		success: function() {
			if(selected_button == "approvalBtn") {
				alert("승인되었습니다.");
				location.reload();
			}
			else if(selected_button == "rejectBtn") {
				alert("반려되었습니다.");
				location.reload();
			}
			else if(selected_button == "cancelBtn") {
				alert("취소되었습니다.");
				location.reload();
			}
			else if(selected_button == "consultedBtn") {
				if (confirm("상담일지를 지금 기록하시겠습니까? 기록한 내역은 학교측에 전달됩니다.\n[마이페이지]-[상담완료]에서 작성 및 수정이 가능합니다.") == true) {
					location.href="consultationRecord.do?res_id=" + res_id;
				}
				else {
					alert("완료되었습니다.");
					location.reload();
				}
			}
		},
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

// 거절메시지(반려/취소사유) 저장
window.addRejectMessage = function(reject_msg) {
	var data = {"res_id":res_id, "reject_msg":reject_msg};
	$.ajax({
		 type: "POST",
		url: "/myPage/addRejectMessage.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		success: changeReservationState,
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

// 거절메시지(반려/취소사유) 확인
function readRejectMessage() {
	res_id = event.currentTarget.closest("tr").id;
	var url = "rejectMessage.do?res_id=" + res_id;
	
	window.open(url, "childform", "width=500; height=300; left=400; top=130; resizable = no;");
}

// 각 항목별 예약정보 확인
function readReservationInfo() {
	res_id = event.currentTarget.closest("tr").id;
	var url = "reservationInfo.do?res_id=" + res_id;
	
	window.open(url, "childform", "width=500; height=300; left=400; top=130; resizable = no;");
}