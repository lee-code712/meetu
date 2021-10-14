<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메일 인증</title>
	<link rel="stylesheet" href="/join/css/joinAuthForm.css"/>
	<script src="/join/js/joinAuth.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<%
	String ck = request.getParameter("ck");
	
	if(ck != null) {
		if(ck.equals("-1"))
			out.println("<script>alert('인증 코드가 틀렸습니다.');</script>");
		else
			out.println("<script>alert('입력하신 메일로 인증 코드를 전송했습니다.');</script>");
	}
%>

	<form method="post" action="joinAuth.do" name="joinAuth_form">
		<div id="AuthWrap">
			<label id="AuthTit">인증 코드 입력</label>
			<input type="text" id="input_code" name="input_code" placeholder="발송된 인증 코드를 입력해 주세요." />
			<div id="AuthWarning">*인증번호가 오지 않으면 입력하신 정보가 정확한지 확인해주세요.</div>
			<div id="submitBtnWrap"><button type="submit" id="submit_btn">확인</button></div>
		</div>
	</form>
</body>
</html>