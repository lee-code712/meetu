<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function returnMessage() {
		var reject_msg = $("#msg").val();
		if(reject_msg == "") {
			alert("사유를 입력해주세요.");
			return;
		}
		opener.addRejectMessage(reject_msg);
		window.close();
	}
</script>
</head>
<body>
<textarea id="msg" style="resize: none;" cols="100" rows="20"></textarea>
<button onclick="returnMessage()">저장</button>
</body>
</html>