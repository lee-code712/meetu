<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반려/취소 사유</title>
	<link rel="stylesheet" href="/myPage/css/rejectMessagePage.css"/>
</head>

<body id="rejectMsgBg">
<div id="rejectMsgWrap">
    <div id="rejectMsgInnerWrap">
        <div id="rejectImgWrap"><img src="../images/rejected.svg" id="rejectImg"/></div>
        <div id="rejectMsg">${reject_msg}</div>
        <div id="closeBtnWrap">
            <button onclick="window.close()" id="closeBtn">닫기</button>
        </div>
    </div>
</div>
</body>
</html>
