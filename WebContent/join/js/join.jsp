<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="../css/join.css" />
</head>

<body>
<div id="joinWrap">
	<div id="joinTitle"><a>MEETU</a></div>

	<table>		
		<tr>
			<td class="univName">대학명</td>
			<td class="univNameText">
				<input type="text" class="joinFormText" maxlength="40" value="동덕여자대학교" />
			</td>
		</tr>
			
		<tr>
			<td class="userId">학번</td>
			<td class="userIdText">
				<input type="text" id="joinFormId" name="ID" maxlength="10" value="우측 중복체크 버튼 클릭" disabled/>
				<button id="sameCheckBtn">중복확인</button>
				<input type="hidden" />
			</td>
		</tr>
			
		<tr>
			<td class="belong">소속</td>
			<td class="belongText">
				<input type="text" class="joinFormText" placeholder="학번 확인 시 자동으로 입력됩니다" disabled />
				<input type="hidden" />
			</td>
		</tr>
			
		<tr>
			<td class="memberId">아이디</td>
			<td class="memberIdText">
				<input type="text" class="joinFormText" placeholder="학번 확인 시 자동으로 생성됩니다" disabled />
			</td>
		</tr>
			
		<tr>
			<td class="memberPwd">비밀번호</td>
			<td class="memberPwdText">
				<input type="password" class="joinFormText" maxlength="20" />
			</td>
		</tr>
			
		<tr>
			<td class="memberPwdCheck">비밀번호 확인</td>
			<td class="memberPwdCheckText">
				<input type="password" class="joinFormText" maxlength="20" />
			</td>
		</tr>
	</table>
		
	<input type="submit" id="joinBtn" alt="join button" value="가입하기">
</div>
</body>
</html>
