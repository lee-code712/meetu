$(document).ready(function(){ // html이 로드되면 실행됨  
  	$("#searchBtn").click(searchProfessor); // : - 모든 <button> 선택
});

function searchProfessor() {
	var searchText = $("#searchText").val();
	$("#profsTbody").children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/reservation/searchProfessor.jsp?searchText=" + searchText,
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
		
		var newTrElement = document.createElement("tr");
		
		var newCountTdElement = document.createElement("td");
		newCountTdElement.innerHTML = idx + 1;
	
		var newNameTdElement = document.createElement("td");
		newNameTdElement.innerHTML = name;
		
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
		
		var newSelectTdElement = document.createElement("td");
		$(newSelectTdElement).addClass("selectProf");
		var newSelectAElement = document.createElement("a");
		newSelectAElement.innerHTML = "선택하기";
		$(newSelectTdElement).append(newSelectAElement);
		
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
		
		// info td의 자식 img checkBtn
		var newCheckImgElement = document.createElement("img");
		$(newCheckImgElement).attr("id", "checkBtn");
		$(newCheckImgElement).attr("src", "/reservation/images/check.svg");
		
		// infoBox td에 infoBox div, checkBtn 추가
		$(newInfoTdElement).append(newInfoDivElement);
		// var newTextNode = document.createTextNode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		// $(newInfoTdElement).append(newTextNode);
		$(newInfoTdElement).append(newCheckImgElement);
	
		// tr에 td들 추가
		$(newTrElement).append(newCountTdElement);
		$(newTrElement).append(newNameTdElement);
		$(newTrElement).append(newMajorTdElement);
		$(newTrElement).append(newInfoTdElement);

		// tbody에 tr 추가
	    $("#profsTbody").append(newTrElement);
	});
}