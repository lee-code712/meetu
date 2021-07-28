$(document).ready(function() { // html이 로드되면 실행됨 
	$(".nav-item").children().click(getReservations);
	$("#completeBtn").trigger("click");
	var clicked_item;
});

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
		var res_date = key;
		var res_id = reservations[key][0];
		var name = reservations[key][1];
		var role = reservations[key][2];
		var dept_name = reservations[key][3];
		var temp_html = '';
			
		temp_html += "<tr id=\"boardList\">";
		if(role == "1") {
			temp_html += "<td>" + name + "교수님</td><td>" + dept_name + "</td><td>" + res_date + "</td>";
			if(clicked_item == "completeBtn") { // 자신이 예약한 건에 대하여 아직 승인여부가 확정되지 않으면, 수정 또는 삭제 가능
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/edit.svg\" id=\"editBtn\" onclick=\"buttonEvent();\"/></td>"
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/delete_black_24dp.svg\" id=\"cancelBtn\" onclick=\"buttonEvent();\"/></td></tr>";
				$('#qwe tbody').append(temp_html);
			}
			else if(clicked_item == "cancelBtn") { // 반려된 건에 대하여 내역 삭제 가능, 거절 메시지 확인 가능
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/delete_black_24dp.svg\" id=\"deleteBtn\" onclick=\"buttonEvent();\"/></td></tr>";
				$('#asd tbody').append(temp_html);
			}
			else { // 승인된 건에 대해서는 수정 및 삭제 불가 --> 변경 사항이 있을 경우 교수에게 쪽지보낼 것
				temp_html += "</tr>";
				$('#zxc tbody').append(temp_html);
			}
		}
		else {
			temp_html += "<td>" + name + "학생</td><td>" + dept_name + "</td><td>" + res_date + "</td>";
			if(clicked_item == "completeBtn") { // 학생이 예약한 건에 대하여 승인 또는 반려 가능
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/edit.svg\" id=\"approvalBtn\" onclick=\"buttonEvent();\"/></td>" // 승인버튼
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/delete_black_24dp.svg\" id=\"rejectBtn\" onclick=\"buttonEvent();\"/></td></tr>"; // 반려버튼
				$('#qwe tbody').append(temp_html);
			}
			else if(clicked_item == "cancelBtn") { // 반려한 건에 대하여 내역 삭제 가능, 자신이 보낸 거절 메시지 확인 가능
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/delete_black_24dp.svg\" id=\"deleteBtn\" onclick=\"buttonEvent();\"/></td></tr>";
				$('#asd tbody').append(temp_html);
			}
			else { // 승인한 건에 대하여 수정 및 삭제 가능 --> 학생과 쪽지를 주고받으며 일정 변경
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/edit.svg\" id=\"editBtn\" onclick=\"buttonEvent();\"/></td>"
				temp_html += "<td id=" + res_id + "><img src=\"/myPage/images/delete_black_24dp.svg\" id=\"cancelBtn\" onclick=\"buttonEvent();\"/></td></tr>";
				$('#zxc tbody').append(temp_html);
			}
		}
	}
}

function buttonEvent() {
	var selected_button = event.currentTarget.id;
	
	if(selected_button == "editBtn") {
		if (confirm("선택한 예약을 수정하시겠습니까?") == true) 
			approval(selected_button);
		else 
			return;
	}
	else if(selected_button == "cancelBtn") {
		if (confirm("선택한 예약을 취소하시겠습니까?") == true) 
			cancel(selected_button);
		else 
			return;
	}
	else if(selected_button == "approvalBtn") {
		if (confirm("선택한 예약을 승인하시겠습니까?") == true) 
			approval(selected_button);
		else 
			return;
	}
	else if(selected_button == "rejectBtn") {
		if (confirm("선택한 예약을 거절하시겠습니까?") == true) 
			reject(selected_button);
		else 
			return;
	}
	else {
		if (confirm("선택한 내역을 삭제하시겠습니까?") == true) 
			deleteInfo(selected_button);
		else 
			return;
	}
}

function approval(selected_button) {
	var res_id = event.currentTarget.closest("td").id;
	var data = {"res_id":res_id, "selected_button":selected_button};
	
	$.ajax({
		 type: "POST",
		url: "/myPage/changeToApprovalState.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		success: function() {
			alert("예약이 승인되었습니다.");
			location.reload();
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

function reject(selected_button) {
	var res_id = event.currentTarget.closest("td").id;
	var data = {"res_id":res_id, "selected_button":selected_button};
	
	$.ajax({
		 type: "POST",
		url: "/myPage/changeToApprovalState.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		success: function() {
			alert("예약이 거절되었습니다.");
			location.reload();
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