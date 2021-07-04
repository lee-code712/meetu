$(document).ready(function() { // html이 로드되면 실행됨  
	$("button").first().click(searchUniversity); // 첫 번째 <button> 클릭 시 실행되는 함수 지정
});

function hideResult() { // 대학 검색 - body 클릭 시 드롭다운 사라지도록
	// 드롭다운 삭제
	$("#search_result").children().remove();
	// body 클릭 이벤트 제거
	$("body").off("click");
}

function selectResult() { // 대학 검색 - 드롭다운 대학 중 하나 선택하면 자동입력
	var selectedAElement = this;
	var result = $(selectedAElement).text();
	
	$("#univ_name").val(result);
}

function searchUniversity() {
	var univ_name = $("#univ_name").val();
	
	$("#search_result").children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/join/getHint.jsp?univ_name=" + univ_name,
		dataType: "text",
		success: process,
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

function process(responseText) {
	var univs = JSON.parse(responseText);
	
	if (jQuery.isEmptyObject(univs)) {
		alert("검색 결과가 없습니다.");
	} else {
		Array.from(univs).forEach(function(univ, idx){
			var univ_name = univ.univName;
		
			var newAElement = document.createElement("a");
			// $(newAElement).attr("href", "#");
			newAElement.innerHTML = univ_name;
		
			var newBrElement = document.createElement("br");
	
			$("#search_result").append(newAElement);
			$("#search_result").append(newBrElement);
		});
		
		$("body").click(hideResult); // <body> 선택 시 실행되는 함수 지정
		$("#search_result a").click(selectResult); // 검색 결과 링크 선택 시 실행되는 함수 지정
	}
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