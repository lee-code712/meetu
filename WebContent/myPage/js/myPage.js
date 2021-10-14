$(document).ready(function() { // html이 로드되면 실행됨 
	$(".nav-item").children().click(getReservations);
	//$(".nav-item:first-Child").trigger("click");
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
		var name = reservations[key].name;
		var role = reservations[key].role;
		var res_id = reservations[key].res_id;
		var state = reservations[key].state;
		var start_time = reservations[key].start_time;
		var end_time = reservations[key].end_time;
		var type = reservations[key].type;
		var reject_msg = reservations[key].reject_msg;
		var office = reservations[key].office;
		
		// 검색창이 비어있으면 모든 예약내역 출력, 키워드가 있으면 키워드와 성명이 동일한 예약내역을 출력
		if(keyword == '' || keyword == name) {
			// 현재일시와 상담일시를 비교하기 위한 변수
			var today = new Date();
			var arr = end_time.split(" ");
			var date_arr = arr[0].split("-");
			var res_day = new Date(date_arr[0], date_arr[1] - 1, date_arr[2], arr[1].substring(0, 2));

			// html을 담을 변수
			var temp_html = '';
			
			temp_html += "<tr id=" + res_id + ">";
			temp_html += "<td><img src=\"/images/moreImage.svg\" id=\"moreImg\" onclick=\"readReservationInfo();\"/></td><td>" + name + "</td>";
			temp_html += "<td>" + start_time.substring(0, 16) + "~" + end_time.substring(11, 16) + "</td>";
			if(type == "오프라인" && office != null) {
				temp_html += "<td>" + office + "</td>";
			}
			else {
				temp_html += "<td>" + type + "</td>";
			}
			
			if(role == "1") { // 학생인 경우
				if(clicked_item == "bookedList") {
					temp_html += "<td><button id=\"cancelBtn\" onclick=\"buttonEvent();\">취소하기</button></td>";
					if(today < res_day) {
						temp_html += "<td><button id=\"editBtn\" onclick=\"buttonEvent();\">수정하기</button></td>"
					}
					temp_html += "</tr>";
					$('#qwe tbody').append(temp_html);
				}
				else if(clicked_item == "canceledList") {
					if(state == "2") {
						temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage('"+ reject_msg +"');\">반려사유</button></td></tr>";
					}
					else {
						temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage('"+ reject_msg +"');\">취소사유</button></td></tr>";
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
			else { // 교수인 경우
				if(clicked_item == "bookedList") {
					if(today < res_day) {
						temp_html += "<td><button id=\"approvalBtn\" onclick=\"buttonEvent();\">승인하기</button></td>";
					}
					temp_html += "<td><button id=\"rejectBtn\" onclick=\"buttonEvent();\">반려하기</button></td></tr>";
					$('#qwe tbody').append(temp_html);
				}
				else if(clicked_item == "canceledList") {
					if(state == "2") {
						temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage('"+ reject_msg +"');\">반려사유</button></td></tr>";
					}
					else {
						temp_html += "<td><button id=\"rejectMsgBtn\" onclick=\"readRejectMessage('"+ reject_msg +"');\">취소사유</button></td></tr>";
					}
					$('#asd tbody').append(temp_html);
				}
				else if(clicked_item == "approvedList") {
					temp_html += "<td><button id=\"cancelBtn\" onclick=\"buttonEvent();\">취소하기</button></td>";
					if(today < res_day) {
						temp_html += "<td><button id=\"editBtn\" onclick=\"buttonEvent();\">수정하기</button></td>"
					}
					if(today > res_day) {
						temp_html += "<td><button id=\"consultedBtn\" onclick=\"buttonEvent();\">완료하기</button></td>"
					}
					temp_html += "</tr>";
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

// 이름으로 예약항목 검색
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
		location.href="reservationUpdateForm.do?res_id=" + res_id;
	}
	else if(selected_button == "cancelBtn") {
		if (confirm("선택한 예약을 취소하시겠습니까?") == true)
			addRejectMessage();
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
			addRejectMessage();
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
function addRejectMessage() {
	res_id = event.currentTarget.closest("tr").id;
	
	swal({
		buttons: {
			cancel: "닫기",
		    confirm: "확인"
		},
		content: {
			element: "textarea",
			attributes: {
				id: "rejectMsg",
				placeholder: "사유를 입력하세요."
			},
		},
		closeOnClickOutside: false
	}).then(function(click) {
		if($("#rejectMsg").val() == "" && click != null) {
			swal({
				text: "사유를 입력하세요.",
				button: "확인"
			}).then(function() {
				addRejectMessage();
			});
		}
		else {
			var sender = $("#dropdown-button").text();
			sender = sender.substring(0, 4) + "의 메시지";
			var reject_msg = $("#rejectMsg").val();
			var data = {"res_id":res_id, "sender":sender, "reject_msg":reject_msg};
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
	});
}

// 거절메시지(반려/취소사유) 확인
function readRejectMessage(reject_msg) {
	var msg_arr = reject_msg.split("/");
	swal({
		title: msg_arr[0],
		text: msg_arr[1],
		buttons: {
			cancel: "닫기"
		},
		closeOnClickOutside: false
	});
}

// 각 항목별 예약정보 확인
function readReservationInfo() {
	res_id = event.currentTarget.closest("tr").id;
	var url = "reservationInfoPage.do?res_id=" + res_id;
	
	window.open(url, "childform", "width=600; height=500; left=300; top=130; resizable = no;");
}

//알림 내역 확인
function readNewAlerts() {
	window.open("alert.do", "childform", "width=400; height=260; left=400; top=180; resizable = no;");
	$("#noticeCount").text(0);
}

//알림 내역에서 클릭한 바로가기 페이지 url로 이동
window.movePage = function(url) {
	location.href = url;
}

function toggleText() {
	var text = document.getElementById("accountWrap");
  
  	if (text.style.display === "none") {
    	text.style.display = "block";
  	} else {
    	text.style.display = "none";
  	}
}