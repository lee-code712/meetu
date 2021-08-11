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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
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

        #closeBtnWrap {
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;
            width: 100%;
            height: 100%;

        }

        #closeBtn {
            background: none;
            border: none;
            color: #FBAB7E;
            font-size: 14px;
        }

        #closeBtn:hover {
            cursor: pointer;
        }
    </style>
</head>

<body id="rejectMsgBg">
	<div id="rejectMsgWrap">
	    <div id="rejectMsg">${reject_msg}</div>
	    <div id="closeBtnWrap">
	        <button onclick="window.close()" id="closeBtn">닫기</button>
	    </div>
	</div>
</body>
</html>