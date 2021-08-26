<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반려/취소 사유</title>
    <link rel="stylesheet" href="/myPage/css/writeRejectMessagePage.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function returnMessage() {
            var reject_msg = $("#rejectMsg").val();
            if (reject_msg == "") {
                alert("사유를 입력하세요.");
                return;
            }
            opener.addRejectMessage(reject_msg);
            window.close();
        }
    </script>
</head>

<body id="rejectMsgBg">
<div id="rejectMsgWrap">
    <div id="rejectMsgInnerWrap">
        <div id="rejectImgWrap"><img src="../images/rejected.svg" id="rejectImg"/></div>
        <div id="rejectMsgText"><textarea id="rejectMsg" style="resize: none; border: none;" rows="10" cols="65"
                                          placeholder="사유를 입력하세요."></textarea></div>
        <div id="closeBtnWrap">
            <button onclick="returnMessage()" id="saveBtn">저장</button>
        </div>
    </div>
</div>
</body>
</html>
