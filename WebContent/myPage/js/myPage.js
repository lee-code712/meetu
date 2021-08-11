$(document).ready(function() { // html이 로드되면 실행됨 
	$(".nav-item").children().click(getReservations);
	$("#bookedList").trigger("click");
	var clicked_item;
	var selected_button;
	var res_id;
});

// 상담 목록 반환
function getReservations() {
	$(".boardListWrap tbody").children().remove();
	var keyword = $("#searchText").val();
	
	// 키워드가 비어있는 경우 즉, 새로운 버튼을 클릭한 경우에만 clicked_item을 새로 정의함
	if(keyword == '') {
		clicked_item = $(this).attr("id");
	}
	
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
	var keyword = $("#searchText").val();
	
	for(var key in reservations) {
		var name = reservations[key][0];
		var role = reservations[key][1];
		var res_id = reservations[key][2];
		var state = reservations[key][3];
		var start_time = reservations[key][4];
		var type = reservations[key][5];
		var office = reservations[key][6];
		
		// 검색창이 비어있으면 모든 예약내역 출력, 키워드가 있으면 키워드와 성명이 동일한 예약내역을 출력
		if(keyword == '' || keyword == name) {
			var temp_html = '';
	
			temp_html += "<tr id=" + res_id + ">";
			temp_html += "<td><img src=\"/myPage/images/more.svg\" id=\"moreImg\" onclick=\"readReservationInfo();\"/></td><td>" + name + "</td><td>" + start_time + "</td>";
			if(type == "오프라인") {
				temp_html += "<td>" + office + "</td>";
			}
			else {
				temp_html += "<td>" + type + "</td>";
			}
			
			if(role == "1") {
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
		// 검색창 초기화
		$("#searchText").val('');
	}
}

// 성명으로 검색
function search() {
	var string = $("#searchText").attr("placeholder");
	var role_name = string.substr(0, 3);
	var keyword = $("#searchText").val();
	
	if(keyword == '') {
		alert(role_name + "을 입력하세요.");
	}
	else {
		getReservations();
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
			window.open("writeRejectMessagePage.do", "childform", "width=500; height=280; left=400; top=150; resizable = no;");
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
			window.open("writeRejectMessagePage.do", "childform", "width=500; height=280; left=400; top=150; resizable = no;");
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
		location.href="consultationRecordPage.do?res_id=" + res_id;
	}
}

// 예약 상태 변경
function changeReservationState() {
	var data = {"res_id":res_id, "selected_button":selected_button};
	
	$.ajax({
		 type: "POST",
		url: "changeReservationState.do",
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
					location.href="consultationRecordPage.do?res_id=" + res_id;
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
		url: "addRejectMessage.do",
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
	var url = "rejectMessagePage.do?res_id=" + res_id;
	
	window.open(url, "childform", "width=500; height=280; left=400; top=150; resizable = no;");
}

// 각 항목별 예약정보 확인
function readReservationInfo() {
	res_id = event.currentTarget.closest("tr").id;
	var url = "reservationInfoPage.do?res_id=" + res_id;
	
	window.open(url, "childform", "width=700; height=400; left=300; top=130; resizable = no;");
}