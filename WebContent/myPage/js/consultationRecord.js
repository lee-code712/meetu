function updateContent() {
	var url = new URL(window.location.href);
	var urlParams = url.searchParams;
	var res_id = urlParams.get('res_id');
	var content = $("#recordText").val();
	var data = {"res_id":res_id, "content":content};
	$.ajax({
		 type: "POST",
		url: "updateConsultationRecord.do",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		success: function() {
			alert("입력한 내용이 저장되었습니다.");
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

//알림 내역 확인
function readNewAlerts() {
	window.open("alert.do", "childform", "width=400; height=260; left=400; top=180; resizable = no;");
	$("#noticeCount").text(0);
}

//알림 내역에서 클릭한 바로가기 페이지 url로 이동
window.movePage = function(url) {
	location.href = url;
}