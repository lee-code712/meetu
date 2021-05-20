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

	<form method="post" action="join.do" name="add_member_form" onsubmit="return ck_join_form()">
		<table>	
			<tr>
				<td class="univName">대학명</td>
				<td class="univNameText">
					<input type="text" class="joinFormText" name="univ_name" maxlength="40" placeholder="대학명을 입력하세요" onfocus="this.value=''"/>
				</td>
			</tr>
						
			<tr>
				<td class="memberId">학번</td>
				<td class="memberIdText">
					<input type="text" id="joinFormId" name="member_id" maxlength="10" placeholder="학번을 입력하세요" />
				</td>
			</tr>
				
			<tr>
				<td class="belong">소속</td>
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
