var xhr;
var checkFirst = loopSend = false;
//$.ajax({
//    type: 'POST',
//    url: 'Jqueryoperation.aspx?Operation=DeleteRow',
//    contentType: 'application/json; charset=utf-8',
//    data: json,
//    cache: false,
//    success: AjaxSucceeded,
//    error: AjaxFailed
//});

function showUniversity(str) {
	if (checkFirst == false) {
		setTimeout("sendKeyword()", 1000);
		loopSend = true;
    }
}

function sendKeyword(){
     if (loopSend == false) return;
     
     var univ_name = document.join_form.univ_name.value;
     if (univ_name === "") {
		lastKeyword = "";
     }
	 else {
		if (univ_name !== "") {
			var para = univ_name;
            xhr = new XMLHttpRequest();
			xhr.open("post", "getHint.jsp", true);
            xhr.onreadystatechange = function(){
				if(xhr.readyState == 4) {
					if(xhr.status == 200) {
						process();
					}
					else{
                        alert("요청 실패: " + xhr.status);
                    }   
                }
			}  
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("univ_name=" + para);
		}
	}
    setTimeout("sendKeyword()", 1000);
}

function process(){
	var resultText = xhr.responseText;
	var listView = document.getElementById("txtUniversity");
	listView.innerHTML = resultText;
}

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