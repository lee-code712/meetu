$(document).ready(function() { // html이 로드되면 실행됨  
	$("#mail_btn").click(submit_mail); // 첫 번째 <button> 클릭 시 실행되는 함수 지정
});

function submit_mail() {
	var email = $("#email").val();
	
	
	if (ck_joinAuth_form()) {
		alert(email);
	}
	// 아직 올바른 메일 주소인지 체크하는 것은 구현하지 못 함
	// 난수 메일 전송 후 세션에 저장
	/*$.ajax({
	 	type: "GET",
		url: "/join/joinAuth.jsp?email=" + email,
		dataType: "text",
		// success: process,
		async: true,
		error: function(jqXHR, textStatus, errorThrown) {
			var message = jqXHR.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + jqXHR.status);
			} else {
				alert(message);	
			}
		}
	});*/
}

function ck_joinAuth_form() {
	var form = document.joinAuth_form;
        
	if(!form.email.value) {
		alert("이메일을 입력해 주세요.");
		form.email.focus();
		return false;
	}
}