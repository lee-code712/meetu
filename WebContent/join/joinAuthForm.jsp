<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 인증</title>
<script src="/join/js/joinAuth.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
	String ck = request.getParameter("ck");
	String email = (String) session.getAttribute("email");
	
	if(ck != null) {
		if(ck.equals("-1"))
			out.println("<script>alert('인증 코드가 틀렸습니다.');</script>");
		else
			out.println("<script>alert('입력하신 메일로 인증 코드를 전송했습니다.');</script>");
	}
	
	if (email == null) {
		email = "학사웹메일주소입력";
	}
%>
<form method="post" action="joinSendMail.do" name="mail_form" onsubmit="return ck_mail_form()">
<div>
<label>메일 주소</label>
<br/>

<input type="email" id="email" name="email" placeholder="학사 웹 메일 주소를 입력해 주세요" value=<%=email%> onFocus="this.value=''"/>

<button id="mail_btn">인증 메일 전송</button>
</div>
</form>

<p/>

<form method="post" action="joinAuth.do" name="joinAuth_form">
<div>
<label>인증 코드 입력</label>
<br/>
<input type="text" id="input_code" name="input_code" placeholder="발송된 인증 코드를 입력해 주세요" />
<button type="submit" id="submit_btn">확인</button>
</div>
</form>
</body>
</html>