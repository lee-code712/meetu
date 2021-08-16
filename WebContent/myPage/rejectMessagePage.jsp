<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        #rejectMsg {
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

        #closeBtn {
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

        #closeBtn:hover {
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
    </style>
</head>

<body id="rejectMsgBg">
<div id="rejectMsgWrap">
    <div id="rejectMsgInnerWrap">
        <div id="rejectImgWrap"><img src="../images/rejected.svg" id="rejectImg"/></div>
        <div id="rejectTit">거절 메시지</div>
        <div id="rejectMsg">${reject_msg}</div>
        <div id="closeBtnWrap">
            <button onclick="window.close()" id="closeBtn">닫기</button>
        </div>
    </div>
</div>
</body>
</html>
