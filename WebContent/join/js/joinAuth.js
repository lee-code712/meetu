function ck_mail_form() {
	var form = document.mail_form;
        
	if(!form.email.value) {
		alert("이메일을 입력해 주세요.");
		form.email.focus();
		return false;
	}
}

function ck_joinAuth_form() {
	var form = document.joinAuth_form;
        
	if(!form.input_code.value) {
		alert("인증 코드를 입력해 주세요.");
		form.input_code.focus();
		return false;
	}
}