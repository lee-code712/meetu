$(document).ready(function(){ // html이 로드되면 실행됨  
	getDept(); // 사이드바 학과들 출력
});

function searchProfessorByKeyword() {
	var searchText = $("#searchText").val();
	$("#searchResult").children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/reservation/searchProfessorByKeyword.jsp?searchText=" + searchText,
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
	var profs = JSON.parse(responseText);
	
	if (jQuery.isEmptyObject(profs)) {
		alert("검색 결과가 없습니다.");
	}
	
	Array.from(profs).forEach(function(prof, idx) {
		var p_user_id = prof.p_user_id;
		var name = prof.name;
		var dept = prof.dept;
		var major = prof.major;
		var email = prof.email;
		var office = prof.office;
		var course = prof.course;
		var is_member = prof.is_member;
		
		var newTrElement = document.createElement("tr");
		// tr의 id로 교수 id 사용
		$(newTrElement).attr("id", p_user_id);
		
		// 번호
		var newCountTdElement = document.createElement("td");
		newCountTdElement.innerHTML = idx + 1;
	
		// 교수 이름
		var newNameTdElement = document.createElement("td");
		newNameTdElement.innerHTML = name;
		
		// 교수 소속 학과
		var newMajorTdElement = document.createElement("td");
		newMajorTdElement.innerHTML = dept;
		
		// div를 자식으로 갖는 info td
		var newInfoTdElement = document.createElement("td");
		
		var newInfoDivElement = document.createElement("div");
		$(newInfoDivElement).attr("id", "infoBox");
		
		// info div의 자식 img infoBtn
		var newInfoImgElement = document.createElement("img");
		$(newInfoImgElement).attr("id", "infoBtn");
		$(newInfoImgElement).attr("src", "/images/info.svg");
		
		// info div의 자식 infoBox div
		var newInfoBoxDivElement = document.createElement("div");
		$(newInfoBoxDivElement).attr("id", "infoBox-content");
		
		// infoBox div의 자식 p
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
		
		if (is_member) { // 회원인 경우에만 선택하기 출력
			var newCheckBtnElement = document.createElement("button");
			$(newCheckBtnElement).attr("id", "checkBtn");
			newCheckBtnElement.innerHTML = "선택하기";
			$(newCheckTdElement).append(newCheckBtnElement);
			$(newCheckBtnElement).click(selectProf);
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

function getDept(responseText) {
	var colleges = getCollege();
	colleges = JSON.parse(colleges);
	
	var depts; // 한 단대의 학과들
	
	// 단대 하나와 해당 단대에 해당하는 학과들을 출력
	Array.from(colleges).forEach(function(college, idx){
		var college_id = college.college_id;
		var college_name = college.college_name;
		
		// 단대에 해당하는 학과를 가져옴
		$.ajax({
	 		type: "GET",
			url: "/reservation/getDept.jsp?college_id=" + college_id,
			async: false,
			dataType: "text",
			success: function(data){
				depts = data;
				depts = JSON.parse(depts);
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
		
		// 웹 페이지에 출력
		// college li
		var newCollegeLiElement = document.createElement("li");
		$(newCollegeLiElement).attr("class", "college");
		
		// college li 내부 이미지
		var newCollegeImgElement = document.createElement("img");
		//$(newCollegeImgElement).attr("src", "/reservation/images/label_important_black_24dp.svg");
		
		// college 내부 ul deptList
		var newDeptUlElement = document.createElement("ul");
		$(newDeptUlElement).attr("class", "deptList");
		
		// deptList 내부 li dept
		Array.from(depts).forEach(function(dept, idx){
			// 학과 생성
			var newDeptLiElement = document.createElement("li");
			$(newDeptLiElement).attr("class", "dept");
			newDeptLiElement.innerHTML = dept.dept_name;
			// ul에 추가
			$(newDeptUlElement).append(newDeptLiElement);
		});
		
		// college li에 항목들 추가
		$(newCollegeLiElement).append(newCollegeImgElement);
		newCollegeLiElement.innerHTML = "&nbsp;" + college_name;
		$(newCollegeLiElement).append(newDeptUlElement);
		
		// deptWrap에 college li 추가
		$("#deptWrap").append(newCollegeLiElement);
	});
	
	// dept 클릭 시 교수 출력 이벤트 추가
	$(".dept").click(searchProfessorByDept);
	
	// college 클릭 시 slideUp/Down 이벤트 추가
	$('.college').click(function () {
        $('.deptList').slideUp();
        if ($(this).children('.deptList').is(':visible')) {
            $(this).children('.deptList').slideUp();
        } else {
            $(this).children('.deptList').slideDown();
        }
    });
}

function getCollege() {
	$(".college").empty();
	$(".college").remove();
	
	var colleges;
	
	$.ajax({
	 	type: "GET",
		url: "/reservation/getCollege.jsp",
		async: false,
		dataType: "text",
		success: function(data){
			colleges = data;
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
	
	return colleges;
}

function selectProf() {
	var p_user_id = event.currentTarget.closest("tr").id;
	location.href = "reservationForm.do?p_user_id=" + p_user_id;
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
