$(document).ready(function(){ // html이 로드되면 실행됨  
  	$("#searchBtn").click(searchProfessorByName); // : - 모든 <button> 선택
	$(".dept").click(searchProfessorByDept);
});

function searchProfessorByName() {
	var searchText = $("#searchText").val();
	$("#searchResult").children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/reservation/searchProfessorByName.jsp?searchText=" + searchText,
		dataType: "text",
		success: updatePage,
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

function searchProfessorByDept() {
	var liElement = this;
	var dept_name = liElement.innerHTML;
	$("#searchResult").children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/reservation/searchProfessorByDept.jsp?dept_name=" + dept_name,
		dataType: "text",
		success: updatePage,
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

function updatePage(responseText) {
	// alert("profs: " + responseText);
	var profs = JSON.parse(responseText);
	
	if (jQuery.isEmptyObject(profs)) {
		alert("검색 결과가 없습니다.");
	}
	
	Array.from(profs).forEach(function(prof, idx) {
		var name = prof.name;
		var major = prof.major;
		var email = prof.email;
		var office = prof.office;
		var course = prof.course;
		var is_member = prof.is_member;
		
		var newTrElement = document.createElement("tr");
		
		// 번호
		var newCountTdElement = document.createElement("td");
		newCountTdElement.innerHTML = idx + 1;
	
		// 교수 이름
		var newNameTdElement = document.createElement("td");
		newNameTdElement.innerHTML = name;
		
		// 교수 소속 학과
		var newMajorTdElement = document.createElement("td");
		newMajorTdElement.innerHTML = major;
		
		// div를 자식으로 갖는 info td
		var newInfoTdElement = document.createElement("td");
		
		var newInfoDivElement = document.createElement("div");
		$(newInfoDivElement).attr("id", "infoBox");
		
		// info div의 자식 img infoBtn
		var newInfoImgElement = document.createElement("img");
		$(newInfoImgElement).attr("id", "infoBtn");
		$(newInfoImgElement).attr("src", "/reservation/images/info.svg");
		
		// info div의 자식 infoBox div
		var newInfoBoxDivElement = document.createElement("div");
		$(newInfoBoxDivElement).attr("id", "infoBox-content");
		
		// infoBox div의 자식 p
		// 교수명 infoTitle
		var newNameTitlePElement = document.createElement("p");
		
		var newNameTitleSpanElement = document.createElement("span");
		$(newNameTitleSpanElement).attr("id", "infoTitle");
		newNameTitleSpanElement.innerHTML = "교수명";
		
		$(newNameTitlePElement).append(newNameTitleSpanElement);
		
		// 교수명
		var newNamePElement = document.createElement("p");
		newNamePElement.innerHTML = name;
		
		// 전공 infoTitle
		var newMajorTitlePElement = document.createElement("p");
		
		var newMajorTitleSpanElement = document.createElement("span");
		$(newMajorTitleSpanElement).attr("id", "infoTitle");
		newMajorTitleSpanElement.innerHTML = "전공";
		
		$(newMajorTitlePElement).append(newMajorTitleSpanElement);
		
		// 전공명
		var newMajorPElement = document.createElement("p");
		newMajorPElement.innerHTML = major;
		
		// 담당과목 infoTitle
		var newCourseTitlePElement = document.createElement("p");
		
		var newCourseTitleSpanElement = document.createElement("span");
		$(newCourseTitleSpanElement).attr("id", "infoTitle");
		newCourseTitleSpanElement.innerHTML = "담당과목";
		
		$(newCourseTitlePElement).append(newCourseTitleSpanElement);
		
		// 담당과목명
		var newCoursePElement = document.createElement("p");
		newCoursePElement.innerHTML = course;
		
		// 이메일 infoTitle
		var newEmailTitlePElement = document.createElement("p");
		
		var newEmailTitleSpanElement = document.createElement("span");
		$(newEmailTitleSpanElement).attr("id", "infoTitle");
		newEmailTitleSpanElement.innerHTML = "이메일";
		
		$(newEmailTitlePElement).append(newEmailTitleSpanElement);
		
		// 이메일
		var newEmailPElement = document.createElement("p");
		newEmailPElement.innerHTML = email;
		
		// 연구실 infoTitle
		var newOfficeTitlePElement = document.createElement("p");
		
		var newOfficeTitleSpanElement = document.createElement("span");
		$(newOfficeTitleSpanElement).attr("id", "infoTitle");
		newOfficeTitleSpanElement.innerHTML = "연구실 위치";
		
		$(newOfficeTitlePElement).append(newOfficeTitleSpanElement);
		
		// 연구실 위치
		var newOfficePElement = document.createElement("p");
		newOfficePElement.innerHTML = office;
		
		// infoBox-content div에 p들 추가
		$(newInfoBoxDivElement).append(newNameTitlePElement);
		$(newInfoBoxDivElement).append(newNamePElement);
		$(newInfoBoxDivElement).append(newMajorTitlePElement);
		$(newInfoBoxDivElement).append(newMajorPElement);
		$(newInfoBoxDivElement).append(newCourseTitlePElement);
		$(newInfoBoxDivElement).append(newCoursePElement);
		$(newInfoBoxDivElement).append(newEmailTitlePElement);
		$(newInfoBoxDivElement).append(newEmailPElement);
		$(newInfoBoxDivElement).append(newOfficeTitlePElement);
		$(newInfoBoxDivElement).append(newOfficePElement);
		
		// infoBox div에 infoBox-content div, infoImg 추가
		$(newInfoDivElement).append(newInfoImgElement);
		$(newInfoDivElement).append(newInfoBoxDivElement);
		
		// infoBox td에 infoBox div 추가
		$(newInfoTdElement).append(newInfoDivElement);
		
		// checkBtn
		var newCheckTdElement = document.createElement("td");
		
		if(is_member) { // 회원인 경우에만 선택하기 출력
			var newCheckBtnElement = document.createElement("button");
			$(newCheckBtnElement).attr("id", "checkBtn");
			newCheckBtnElement.innerHTML = "선택하기";
			$(newCheckTdElement).append(newCheckBtnElement);
		}
		
		// tr에 td들 추가
		$(newTrElement).append(newCountTdElement);
		$(newTrElement).append(newNameTdElement);
		$(newTrElement).append(newMajorTdElement);
		$(newTrElement).append(newInfoTdElement);
		$(newTrElement).append(newCheckTdElement);

		// tbody에 tr 추가
	    $("#searchResult").append(newTrElement);
	});
}