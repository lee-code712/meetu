function ck_join_form() {
	var form = document.join_form;
        
	if(!form.univ_name.value) {
		alert("대학명을 입력해 주세요.");
		return false;
	}
    	
	if(!form.member_id.value) {
		alert("학번을 입력해 주세요.");
		return false;
	}
    
	if(form.isChecked.value != "checked") { 
		alert("학번 중복체크를 해 주세요.");
		return false;
	}
    
	if(!form.password.value) {
		alert("비밀번호를 입력해 주세요.");
		form.password.focus();
		return false;
	}
    
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(form.password.value != form.password_ck.value ) {
		alert("비밀번호와 비밀번호 확인에 입력된 값이 일치하지 않습니다.");
		form.password.focus();
		return false;
	}
}

function ck_ID() {
	window.name = "parentForm";
	window.open("join_sessionRemove.jsp");
	
	openWin = window.open("join_IDCheck.jsp", "ckForm", "width=500, height=300, resizable = no, scrollbars = no");
}
	
function ck_search_form(){
	var form = univ_search_form;
		
	if(form.univ_name.value == "") {
		alert("대학명을 입력해 주세요");
		form.univ_name.focus();
		return false;
	}
}