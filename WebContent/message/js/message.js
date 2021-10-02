$(document).ready(function() { // html이 로드되면 실행됨 
  	$(".list").click(getMessages);
  	var mem_usr;
  	var mem_usr_name;
});

function getMessages() {
	mem_usr = $(this).text();
	mem_usr_name = $(this).next().val();
	$('#sender').text(mem_usr);
	$('#messageResult').children().remove();
		
	$.ajax({
		 type: "GET",
		url: "/message/searchMessages.jsp?mem_usr_name=" + mem_usr_name,
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
	var messages = JSON.parse(responseText);
			
	for(var key in messages) {
		var sent_time = messages[key].sentTime;
		var msg_content = messages[key].msgContentDto.msg;
		var temp_html = '';
		
		if(role == "1") {
			// 시간대 하이퍼링크
			if (msg_content.indexOf("9시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("10시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("11시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("12시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("1시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("2시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("3시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("4시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("5시") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("1일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("2일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("3일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("4일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("5일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("6일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("7일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("8일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("9일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("10일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("11일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("12일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("13일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("14일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("15일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("16일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("17일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("18일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("19일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("20일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("21일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("22일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("23일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("24일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("25일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("26일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("27일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("28일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("29일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("30일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
			else if (msg_content.indexOf("31일") > -1) {
				msg_content = "<a href=\"/reservationUpdateForm.do?res_id=" + $("#mem_usr_res_id").val() + "\" style=\"color: blue\; text-decoration: underline;\">" + msg_content + "</a>";
			}
		}
		
		if(messages[key].recvId == user_id) {
			temp_html += "<div id=\"receiveMessage\"> <div id=\"receiveMsg\">" + mem_usr_name + "</div>";
			temp_html += "<div id=\"receiveMessageText\"> <div id=\"messageContent\">" + msg_content + "</div></div>";
			temp_html += "<div id=\"receiveDate\">" + sent_time + "</div>";
			temp_html += "</div>";
		}
		else {
			temp_html += "<div id=\"sendMessage\">";
			temp_html += "<div id=\"sendMessageText\"> <div id=\"messageContent\">" + msg_content + "</div></div>";
			temp_html += "<div id=\"sendDate\">" + sent_time;
			if(messages[key].isRead == 1) {	
				temp_html += " 읽음</div>";
			}
			else {
				temp_html += " 읽지않음</div>";
			}
			temp_html += "</div>";
		}
		// console.log(temp_html);
		$('#messageResult').append(temp_html);
	}
	
}

function sendMessage() {
	var msg = $('#messageText').val();
	
	if(msg == "") {
		alert("전송할 메시지 내용이 없습니다.");
	}
	else {
		var data = {"mem_usr_name":mem_usr_name, "msg":msg};
		
		$.ajax({
	 		type: "POST",
			url: "addMessage.do",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: data,
			dataType: "text",
			success: updateMessages,
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
}

function updateMessages() {
	$('#messageText').val("");
	$('#messageResult').children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/message/searchMessages.jsp?mem_usr_name=" + mem_usr_name,
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

//알림 내역 확인
function readNewAlerts() {
	window.open("alert.do", "childform", "width=400; height=260; left=400; top=180; resizable = no;");
	$("#noticeCount").text(0);
}

//알림 내역에서 클릭한 바로가기 페이지 url로 이동
window.movePage = function(url) {
	location.href = url;
}