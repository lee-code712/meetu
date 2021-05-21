function ck_join_form() {
	var form = document.join_form;
        
	if(!form.univ_name.value) {
		alert("대학명을 입력해 주세요.");
		form.univ_name.focus();
		return false;
	}
    	
	if(!form.member_id.value) {
		alert("학번을 입력해 주세요.");
		form.member_id.focus();
		return false;
	}
    
	if(!form.password.value) {
		alert("비밀번호를 입력해 주세요.");
		form.password.focus();
		return false;
	}
	
	if(!form.password_ck.value) {
		alert("비밀번호 확인을 입력해 주세요.");
		form.password_ck.focus();
		return false;
	}
    
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(form.password.value != form.password_ck.value ) {
		alert("비밀번호와 비밀번호 확인에 입력된 값이 일치하지 않습니다.");
		form.password.focus();
		return false;
	}
}