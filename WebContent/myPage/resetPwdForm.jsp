<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 재설정</title>
	<link rel="stylesheet" href="/myPage/css/resetPwdForm.css"/>
</head>

<body id="resetPwdBg">
	<div id="resetPwdWrap">
		<img src="/images/lock.svg" id="lockImg"/>
		<div id="resetPwdTit">비밀번호 재설정</div>
		<div id="resetPwdSubTit">비밀번호를 변경하여 개인정보를 보호하세요.</div>
		
		<div id="currentPwdTit">현재 비밀번호</div>
		<input type="text" id="currentPwdText" placeholder="현재 비밀번호">
		
		<div id="newPwdTit">새 비밀번호</div>
		<input type="text" id="newPwdText" placeholder="새 비밀번호">
		
		<div id="newPwdCheckTit">새 비밀번호 확인</div>
		<input type="text" id="newPwdCheckText" placeholder="새 비밀번호 확인">

		<button id="resetPwdBtn">비밀번호 변경하기</button>
	</div>
</body>
</html>