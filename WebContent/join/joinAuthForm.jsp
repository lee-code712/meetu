<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 인증</title>
<script src="/join/js/joinAuth.js"></script>
</head>
<body>

<form method="post" action="joinAuth.do" name="joinAuth_form">
<div>
<label>메일 주소</label>
<br/>
<input type="email" id="email" name="email" placeholder="학사 웹 메일 주소를 입력해 주세요" />
<button id="mail_btn">인증 메일 전송</button>
</div>
<p/>

<div>
<label>인증 코드 입력</label>
<br/>
<input type="text" id="input_code" name="input_code" placeholder="발송된 인증 코드를 입력해 주세요" />
<button type="submit" id="submit_btn">확인</button>
</div>
</form>
</body>
</html>