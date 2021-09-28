<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 재설정</title>
	<link rel="stylesheet" href="/myPage/css/resetPwdForm.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	function ck_form() {
		var form = document.change_pwd_form;
	        
		if(!$("#currentPwdText").val()) {
			alert("현재 비밀번호를 입력해 주세요.");
			return false;
		}
	    	
		if(!$("#newPwdText").val()) {
			alert("새 비밀번호를 입력해주세요.");
			return false;
		}
	    
		if(!$("#newPwdCheckText").val()) {
			alert("새 비밀번호 확인을 입력해주세요.");
			return false;
		}
	}
	</script>
</head>

<body id="resetPwdBg">
<%
	String change_pwd_ck = request.getParameter("change_pwd");
	if(change_pwd_ck != null) {
		if(change_pwd_ck.equals("-1")) {
			out.println("<script>alert('현재 비밀번호가 틀립니다.');</script>");
		}
		
		if(change_pwd_ck.equals("-2")) {
			out.println("<script>alert('새 비밀번호 확인 값이 틀립니다.');</script>");
		}
	}
%>
	<form method="post" name="change_pwd_form" action="changePwd.do" onsubmit="return ck_form()">
	<div id="resetPwdWrap">
		<img src="/images/lock.svg" id="lockImg"/>
		<div id="resetPwdTit">비밀번호 재설정</div>
		<div id="resetPwdSubTit">비밀번호를 변경하여 개인정보를 보호하세요.</div>
		
		<div id="currentPwdTit">현재 비밀번호</div>
		<input type="password" id="currentPwdText" name="old_pwd" placeholder="현재 비밀번호">
		
		<div id="newPwdTit">새 비밀번호</div>
		<input type="password" id="newPwdText" name="new_pwd" placeholder="새 비밀번호">
		
		<div id="newPwdCheckTit">새 비밀번호 확인</div>
		<input type="password" id="newPwdCheckText" name="new_pwd_ck" placeholder="새 비밀번호 확인">

		<div id="resetPwdBtnWrap">
			<input class="resetPwdBtn" id="resetPwdBtn" type="submit" value="비밀번호 변경" />
			<input class="cancelBtn" id="cancelBtn" type="button" onclick="location.href='myPage.do'" value="취소" />
		</div>
	</div>
	</form>
</body>
</html>