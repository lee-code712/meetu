<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="/join/css/join.css" />
	<script src="/join/js/join.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
<%
	String ck = request.getParameter("ck");
	if(ck != null) {
		if (ck.equals("-1"))
			out.println("<script>alert('존재하지 않는 대학입니다.');</script>");
		if (ck.equals("-2"))
			out.println("<script>alert('존재하지 않는 학번입니다.');</script>");
		if (ck.equals("-3"))
			out.println("<script>alert('이미 가입된 학번입니다.');</script>");
		if (ck.equals("-4"))
			out.println("<script>alert('회원가입에 실패했습니다.');</script>");
	}
%>
<div id="joinWrap">
	<div id="joinTitle"><a>MEETU</a></div>

	<p id="suggest">대학명: <span id="txtUniversity"></span></p>
	<form method="post" action="join.do" name="join_form" onsubmit="return ck_join_form()">
		<table>	
			<tr>
				<td class="univName">대학명</td>
				<td class="univNameText">
					<input type="text" class="joinFormText" id="univ_name" name="univ_name" maxlength="40" placeholder="대학명을 정확히 입력하세요" onkeydown="showUniversity(this.value)"/>
				</td>
			</tr>
						
			<tr>
				<td class="memberId">학번</td>
				<td class="memberIdText">
					<input type="text" id="joinFormId" name="member_id" maxlength="10" placeholder="학번을 입력하세요" />
				</td>
			</tr>
				
			<tr>
				<td class="belong">소속</td> <%-- 회원가입 시 소속 입력이 필요 없음 (학번으로 member 테이블에 접근하면 role 존재함) --%>
				<td class="belongRadio">
					<label><input type="radio" name="role" value="student" checked>학생</label>
     				<label><input type="radio" name="role" value="professor">교수</label>
				</td>
			</tr>
							
			<tr>
				<td class="password">비밀번호</td>
				<td class="passwordText">
					<input type="password" class="joinFormText" name="password" maxlength="20" placeholder="비밀번호를 입력하세요" />
				</td>
			</tr>
				
			<tr>
				<td class="passwordCheck">비밀번호 확인</td>
				<td class="passwordCheckText">
					<input type="password" class="joinFormText" name="password_ck" maxlength="20" placeholder="비밀번호를 한 번 더 입력하세요" />
				</td>
			</tr>
		</table>
		
		<input type="submit" id="joinBtn" alt="join button" value="가입하기">
	</form>
</div>
</body>
</html>
