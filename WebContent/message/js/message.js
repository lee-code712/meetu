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
		console.log(temp_html);
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
	alert("메시지가 성공적으로 전송되었습니다.");

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