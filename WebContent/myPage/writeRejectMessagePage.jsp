<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반려/취소 사유</title>
    <style>
        #rejectMsgBg {
            background: #FAFAFA;
        }

        #rejectMsgWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        #rejectMsgInnerWrap {
            background: white;
            border-radius: 10px;
            box-shadow: -60px 0px 100px -90px #000000,
            60px 0px 100px -90px #000000;
        }

        #rejectMsgText {
            display: flex;
            justify-content: center;
            padding: 20px 40px;
            width: 440px;
            background: white;
            border-radius: 5px;
            color: #535353;
        }

        #closeBtnWrap {
            padding: 40px 40px 40px 0px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            background: white;
            border-radius: 0px 0px 10px 10px;
        }

        #saveBtn {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100px;
            height: 40px;
            border-radius: 5px;
            color: white;
            background: #1abc9c;
            border: none;
        }

        #saveBtn:hover {
            cursor: pointer;
        }

        #rejectImg {
            width: 80px;
            height: 80px;
        }

        #rejectImgWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 0px 10px 0px;
            width: 500px;
            background: white;
            border-radius: 10px 10px 0px 0px;
        }

        #rejectTit {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 500px;
            background: white;
            font-size: 24px;
        }

        #rejectMsg:focus {
            outline: none;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function returnMessage() {
            var reject_msg = $("#rejectMsg").val();
            if (reject_msg == "") {
                alert("사유를 입력해주세요.");
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
        <div id="rejectTit">거절 메시지</div>
        <div id="rejectMsgText"><textarea id="rejectMsg" style="resize: none; border: none;" rows="10" cols="65"
                                          placeholder="거절 메시지를 입력하세요."></textarea></div>
        <div id="closeBtnWrap">
            <button onclick="returnMessage()" id="saveBtn">저장</button>
        </div>
    </div>
</div>
</body>
</html>
