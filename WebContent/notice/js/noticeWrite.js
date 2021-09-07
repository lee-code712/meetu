function addNotice() {
	var title = $('#titleInput').val();
	var content = $('#contentInput').val();
	
	if(title == "") {
		alert("제목을 입력해주세요.");
	}
	else if(content == "") {
		alert("내용을 입력해주세요.");
	}
	else {
		var data = {"title":title, "content":content};
		
		$.ajax({
		 	type: "POST",
			url: "addNotice.do",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: data,
			dataType: "text",
			async: false,
			success: function() {
				alert("공지사항이 추가되었습니다.");
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
} 

//알림 내역 확인
function readNewAlerts() {
	var url = "alert.do";
	
	window.open(url, "childform", "width=600; height=500; left=300; top=130; resizable = no;");
}