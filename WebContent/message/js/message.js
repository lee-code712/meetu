$(document).ready(function() { // html이 로드되면 실행됨 
  	$(".list").click(getMessages);
  	var member;
  	var mem_usr_id;
});

function getMessages() {
		member = $(this).text();
		mem_usr_id = $(this).next().val();
		$('#sender').text(member);
		$('#messageInnerWrap').children().remove();
		
		$.ajax({
		 	type: "GET",
			url: "/message/searchMessages.jsp?mem_usr_id=" + mem_usr_id,
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
	
		if(messages[key].sendId == mem_usr_id) {
			temp_html += "<div id=\"receiveMessage\">";
			temp_html += "<div id=\"messageType\"><span id=\"receivetype\">받은 쪽지</span> <span id=\"receivedate\">" + sent_time + "</span></div>";
			temp_html += "<div id=\"messageContent\">" + msg_content + "</div>";
			temp_html += "</div>";
		}
		else {
			temp_html += "<div id=\"sendMessage\">";
			temp_html += "<div id=\"messageType\"><span id=\"sendtype\">보낸 쪽지</span> <span id=\"senddate\">" + sent_time + "</span></div>";
			temp_html += "<div id=\"messageContent\">" + msg_content + "</div>";
			temp_html += "</div>";
		}
		$('#messageInnerWrap').append(temp_html);
	}
	
}

function sendMessage() {
	var msg = $('#messageText').val();
	
	if(msg == "") {
		alert("전송할 메시지 내용이 없습니다.");
	}
	else {
		var data = {"mem_usr_id":mem_usr_id, "msg":msg};
		
		$.ajax({
	 		type: "POST",
			url: "/message/addMessage.jsp",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: data,
			dataType: "text",
			success: UpdateMessages,
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

function UpdateMessages() {
	alert("메시지가 성공적으로 전송되었습니다.");

	$('#messageText').val("");
	$('#messageInnerWrap').children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/message/searchMessages.jsp?mem_usr_id=" + mem_usr_id,
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