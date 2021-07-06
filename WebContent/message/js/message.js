$(document).ready(function() { // html이 로드되면 실행됨 
  	$(".list").click(getMessages);
  	var mem_usr_id;
});

function getMessages() {
		var member = $(this).text();
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
			
	for(var i = 0; i < Object.keys(messages).length; i++) {
		var sent_time = messages[i].sentTime;
		var msg_content = messages[i].msgContentDto.msg;
		var temp_html = '';
	
		if(messages[i].sendId == mem_usr_id) {
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