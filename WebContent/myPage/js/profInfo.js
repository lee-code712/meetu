// 전공 수정버튼 클릭 이벤트
function majorMfBtn() {
	swal({
		button: "수정",
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "전공을 작성해주세요.",
				value: $("#profMajorMfText").text()
			},
		},
	}).then(function() {
		if($("#editText").val() == "") {
			swal({
				text: "수정할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		else {
			var param = "item=major";
			param += "&value=" + $("#editText").val();
			location.href="editProfInfo.do?" + param;
		}
	});
}

//이메일 수정버튼 클릭 이벤트
function emailMfBtn() {
	swal({
		button: "수정",
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "이메일을 작성해주세요.",
				value: $("#profEmailMfText").text()
			},
		},
	}).then(function() {
		if($("#editText").val() == "") {
			swal({
				text: "수정할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		else {
			var param = "item=email";
			param += "&value=" + $("#editText").val();
			location.href="editProfInfo.do?" + param;
		}
	});
}

//교수 연구실 수정버튼 클릭 이벤트
function profLocationMfBtn() {
	swal({
		button: "수정",
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "연구실 위치를 작성해주세요.",
				value: $("#profLocationMfText").text()
			},
		},
	}).then(function() {
		if($("#editText").val() == "") {
			swal({
				text: "수정할 항목이 비어있습니다.",
				button: "확인"
			});
		}
		else {
			var param = "item=office";
			param += "&value=" + $("#editText").val();
			location.href="editProfInfo.do?" + param;
		}
	});
}

// 아직
function subjectMfBtn() {
	swal({
		button: "추가",
		content: {
			element: "input",
			attributes: {
				id: "editText",
				placeholder: "담당과목을 작성해주세요.",
			},
		},
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

// 아직
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