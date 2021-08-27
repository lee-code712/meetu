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
				text: "전공을 작성해주세요.",
				button: "확인"
			}).then(function() {
				majorMfBtn();
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
				text: "이메일을 작성해주세요.",
				button: "확인"
			}).then(function() {
				emailMfBtn();
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
				text: "연구실 위치를 작성해주세요.",
				button: "확인"
			}).then(function() {
				profLocationMfBtn();
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
function subjectAddBtn() {
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
					text: "과목을 선택하세요.",
					button: "확인"
				}).then(function() {
					subjectAddBtn();
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

// 상담가능시간 추가 버튼 이벤트
function profAbleTimeAddBtn() {
	var days = ['일', '월', '화', '수', '목', '금', '토'];
	var start_times = ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'];
	var end_times = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00'];
	
	// select를 묶어 줄 div 생성
	var able_time_div = document.createElement("div");
	
	// 요일 select 생성
	var day_div = document.createElement("div");
	var day_select = document.createElement("select");
	$(day_select).attr("id", "daysOfTheWeek");
	
	var day_option = document.createElement('option');
	day_option.innerHTML = '요일을 선택하세요.';
	day_select.appendChild(day_option);
	
	Array.from(days).forEach(function(day, i) {
		day_option = document.createElement('option');
		day_option.innerHTML = day;
		day_option.value = i;
		day_select.appendChild(day_option);
	});
	day_div.appendChild(day_select);
	able_time_div.appendChild(day_div);
	
	// 시작 시간 select 생성
	var start_div = document.createElement("div");
	var start_select = document.createElement("select");
	$(start_div).css("margin", "10px");
	$(start_select).attr("id", "startTimes");
	
	var start_option = document.createElement('option');
	start_option.innerHTML = '시작 시간을 선택하세요.';
	start_select.appendChild(start_option);
	
	Array.from(start_times).forEach(function(start_time, i) {
		start_option = document.createElement('option');
		start_option.innerHTML = start_time;
		start_select.appendChild(start_option);
	});
	start_div.appendChild(start_select);
	able_time_div.appendChild(start_div);
	
	// 끝 시간 select 생성
	var end_div = document.createElement("div");
	var end_select = document.createElement("select");
	$(end_select).attr("id", "endTimes");
	
	var end_option = document.createElement('option');
	end_option.innerHTML = '종료 시간을 선택하세요.';
	end_select.appendChild(end_option);
	
	Array.from(end_times).forEach(function(end_time, i) {
		end_option = document.createElement('option');
		end_option.innerHTML = end_time;
		end_select.appendChild(end_option);
	});
	end_div.appendChild(end_select);
	able_time_div.appendChild(end_div);
	
	swal({
		buttons: {
			cancel: "닫기",
		    confirm: "추가"
		},
		content: able_time_div,
		closeOnClickOutside: false
	}).then(function(click) {
		if(click) {
			var day = $("#daysOfTheWeek").val();
			var start = $("#startTimes").val();
			var end = $("#endTimes").val();
			var able_time = days[day] + " " + start + "~" + end;
			
			if(start.substring(0,2) > end.substring(0,2)) {
				swal({
					text: "형식에 맞지 않는 시간대 입니다.",
					button: "확인"
				});
			}
			else if($("#profAbleTimeMfText:contains("+ able_time + ")").attr('id') != undefined) { // 이미 추가된 시간대인 경우
				swal({
					text: "이미 존재하는 시간대 입니다.",
					button: "확인"
				});
			}
			else {
				if(end == "종료 시간을 선택하세요." || start == "시작 시간을 선택하세요." || day == "요일을 선택하세요.") {
					swal({
						text: "선택되지 않은 항목이 있습니다.",
						button: "확인"
					}).then(function() {
						profAbleTimeAddBtn();
					});
				}
				else {
					var param = "able_time=" + day + " " + start + "~" + end;
					location.href="addConsultableTime.do?" + param;
				}
			}
		}
	});
}

// 상담가능시간 삭제 버튼 이벤트
function profAbleTimeRemoveBtn() {
	var able_time = event.currentTarget.id;
	
	swal({
		text: "선택한 시간대를 삭제하시겠습니까?",
		buttons: {
			cancel: "닫기",
		    confirm: "삭제"
		},
		closeOnClickOutside: false
	}).then(function(click) {
		if(click) {
			var param = "able_time=" + able_time;
			location.href="deleteConsultableTime.do?" + param;
		}

	});
}