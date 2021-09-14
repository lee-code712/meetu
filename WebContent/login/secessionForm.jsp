<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="/login/css/secessionForm.css"/>
</head>

<body id="secessionBg">
	<div id="secessionWrap">
		<img src="/images/secession.svg" id="secessionImg"/>
		<div id="secessionTit">회원탈퇴</div>
		<div id="secessionSubTit">그동안 서비스를 이용해 주셔서 감사합니다.</div>
		
		<div id="secessionPwdTit">비밀번호 확인</div>
		<input type="text" id="secessionPwdText" placeholder="비밀번호 확인">
		
		<div id="secessionWarningWrap">
			<img src="/images/warning.svg" id="secessionWarningImg"/>
			<div id="secessionWarning">탈퇴 후 회원정보 및 서비스 이용 기록이 삭제되며 복구가 불가능합니다.</div>
		</div>
		
		<div id="secessionBtnWrap">
			<button id="secessionBtn">탈퇴하기</button>
			<button id="cancelSecessionBtn">취소</button>
		</div>
	</div>
</body>
</html>