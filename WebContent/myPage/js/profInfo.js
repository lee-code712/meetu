// 전공 수정 버튼 이벤트
function majorMfBtn() {
	swal({
		buttons: {
			cancel: "닫기",
		    confirm: "수정"
		},
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "전공을 작성해주세요.",
				value: $("#profMajorMfText").text()
			},
		},
		closeOnClickOutside: false
	}).then(function(click) {
		if($("#editText").val() == "" && click != null) {
			swal({
				text: "수정할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		
		if(click) {
			var param = "item=major";
			param += "&value=" + $("#editText").val();
			location.href="editProfInfo.do?" + param;
		}
	});
}

//이메일 수정 버튼 이벤트
function emailMfBtn() {
	swal({
		buttons: {
			cancel: "닫기",
		    confirm: "수정"
		},
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "이메일을 작성해주세요.",
				value: $("#profEmailMfText").text()
			},
		},
		closeOnClickOutside: false
	}).then(function(click) {
		if($("#editText").val() == "" && click != null) {
			swal({
				text: "수정할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		
		if(click) {
			var param = "item=email";
			param += "&value=" + $("#editText").val();
			location.href="editProfInfo.do?" + param;
		}
	});
}

//연구실 위치 수정 버튼 이벤트
function profLocationMfBtn() {
	swal({
		buttons: {
			cancel: "닫기",
		    confirm: "수정"
		},
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "연구실 위치를 작성해주세요.",
				value: $("#profLocationMfText").text()
			},
		},
		closeOnClickOutside: false
	}).then(function(click) {
		if($("#editText").val() == "" && click != null) {
			swal({
				text: "수정할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		if(click) {
			var param = "item=office";
			param += "&value=" + $("#editText").val();
			location.href="editProfInfo.do?" + param;
		}
	});
}

// 담당과목 추가 버튼 이벤트
function subjectMfBtn() {
	var select = document.createElement("select");
	$(select).attr("id", "courseList");
	
	var option = document.createElement('option');
	option.innerHTML = '과목을 선택하세요.';
	select.appendChild(option);
	
	// 교수가 속한 학과의 과목들을 옵션에 추가
	Array.from(courses).forEach(function(course) {
		var course_id = course.course_id;
		var title = course.course_by_dept;

		if(title != null && $("#profSubjectMfText:contains("+ title + ")").attr('id') == undefined) { // 현재 추가되어있는 항목이 아닌 경우
			option = document.createElement('option');
			option.innerHTML = title;
			option.value = course_id;
			select.appendChild(option);
		}
	});
	
	swal({
		buttons: {
			cancel: "닫기",
		    confirm: "추가"
		},
		content: select,
		closeOnClickOutside: false
	}).then(function(click) {
		if(click) {
			if($("#courseList").val() == "과목을 선택하세요.") {
				swal({
					text: "선택된 항목이 없습니다.",
					button: "확인"
				});
			}
			else {
				var param = "course_id=" + $("#courseList").val();
				location.href="addClass.do?" + param;
			}
		}
	});
}

// 담당과목 삭제 버튼 이벤트
function classRemoveBtn() {
	var course_id = event.currentTarget.id;
	swal({
		text: "선택한 과목을 삭제하시겠습니까?",
		buttons: {
			cancel: "닫기",
		    confirm: "삭제"
		},
		closeOnClickOutside: false
	}).then(function(click) {
		if(click) {
			var param = "course_id=" + course_id;
			location.href="deleteClass.do?" + param;
		}

	});
}

// 아직X
function profAbleTimeMfBtn() {
	swal({
		button: "추가",
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "상담가능시간을 작성해주세요.",
			},
		},
		closeOnClickOutside: false
	}).then(function() {
		if($("#editText").val() == "") {
			swal({
				text: "추가할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		else {
			//location.href="editProfInfo.do?item='major'";
		}
	});
}