<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>반려/취소 사유</title>
	<style>
        #rejectMsgBg {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 50vh;
            background-image: url('/myPage/images/rejectMsgBg.svg');
            background-position: center;
            background-size: cover;
        }

        #rejectMsgWrap {
            width: 500px;
            height: 324px;
            padding: 3rem;
            border-radius: 0px 20px 0 20px;
            border: 1px solid #eee;
            box-shadow: 0 4px 4px 0 rgb(0, 0, 0, 0.2);
        }

        #rejectMsg {
            color: #535353;
        }

        #saveBtnWrap {
        	display: flex;
            justify-content: flex-end;
            
            width: 100%;
            height: 100%;

        }

        #saveBtn {
            background: none;
            border: none;
            color: #FBAB7E;
            font-size: 14px;
        }

        #saveBtn:hover {
            cursor: pointer;
        }
    </style>
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		function returnMessage() {
			var reject_msg = $("#rejectMsg").val();
			if(reject_msg == "") {
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
	    <textarea id="rejectMsg" style="resize: none; border: none;" rows="10" cols="65"></textarea>
	    <div id="saveBtnWrap">
	        <button onclick="returnMessage()" id="saveBtn">저장</button>
	    </div>
	</div>
</body>
</html>