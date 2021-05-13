<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="./css/join.css" />
	<script src="./js/join.js"></script>
</head>

<body>
<div id="joinWrap">
	<div id="joinTitle"><a>MEETU</a></div>

	<form method="get" action="univSearch.do" name="univ_search_form" onsubmit="return ck_search_form()">
		<table>		
			<tr>
				<td class="univName">대학명</td>
				<td class="univNameText">
					<input type="text" class="joinFormText" name="univ_name" maxlength="40" value="대학명을 입력하세요" onfocus="this.value=''"/>
				</td>
			</tr>
		</table>
	</form>
	
	<form method="post" action="addMember.do" name="add_member_form" onsubmit="return ck_join_form()">
		<table>		
			<tr>
				<td class="memberId">학번</td>
				<td class="memberIdText">
					<input type="text" id="joinFormId" name="member_id" maxlength="10" value="우측 중복체크 버튼 클릭" disabled/>
					<button id="sameCheckBtn">중복확인</button>
					<input type="hidden" name="isChecked" value="unchecked"/>
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
				<td class="userId">아이디</td>
				<td class="userIdText">
					<input type="text" class="joinFormText" placeholder="학번 확인 시 자동으로 생성됩니다" disabled />
				</td>
			</tr>
				
			<tr>
				<td class="password">비밀번호</td>
				<td class="passwordText">
					<input type="password" class="joinFormText" name="password" maxlength="20" />
				</td>
			</tr>
				
			<tr>
				<td class="passwordCheck">비밀번호 확인</td>
				<td class="passwordCheckText">
					<input type="password" class="joinFormText" name="password_ck" maxlength="20" />
				</td>
			</tr>
		</table>
		
		<input type="submit" id="joinBtn" alt="join button" value="가입하기">
	</form>
</div>
</body>
</html>
