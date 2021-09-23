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
	window.open("alert.do", "childform", "width=400; height=260; left=400; top=180; resizable = no;");
	$("#noticeCount").text(0);
}

//알림 내역에서 클릭한 바로가기 페이지 url로 이동
window.movePage = function(url) {
	location.href = url;
}