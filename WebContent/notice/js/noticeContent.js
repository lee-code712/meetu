function deleteNotice() {
	var data = {"notice_id":notice_id};

	$.ajax({
		 type: "POST",
		url: "/notice/deleteNotice.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		async: false,
		success: function() {
			alert("공지사항이 삭제되었습니다.");
			history.back();
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