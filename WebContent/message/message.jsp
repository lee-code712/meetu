<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../components/css/header.css" />
	<link rel="stylesheet" href="css/message.css" />
</head>
<body>
	<div id="topHeader">
		<div id="topHeaderInner">
			<div>
				<div><a href="../login/login.jsp">로그인</a></div>
				<div>|</div>
				<div><a href="../join/join.jsp">회원가입</a></div>
			</div>
		</div>
	</div>

	<div id="underHeader">
		<div id="underHeaderInner">
			<div id="title"><a href="">MEETU</a></div>
		
			<div id="gnb">
				<div><a href="../notice/notice.jsp">공지사항</a></div>
				<div><a href="../reservation/reservation.jsp">상담예약</a></div>
				<div><a href="../message/message.jsp">쪽지함</a></div>
			</div>
		
			<div id="icon">
				<img src="../components/images/alert.svg" />
				<img src="../components/images/myPage.svg" />
			</div>
		</div>
	</div>
	
	<div id="banner">
		<div>쪽지함</div>
	</div>
	
	<table id="messageWrap">
		<tr>
			<td>
				<ul class="mylist">
					<li id="messageTitle">쪽지함</li>
        			<li id="list">컴퓨터학과 000학생</li>
        			<li id="list">컴퓨터학과 000학생</li>
        			<li id="list">컴퓨터학과 000학생</li>
    			</ul>
			</td>
			
			<td id="messageInner">
				<div id="sender">컴퓨터학과 000학생</div>
				<div id="receiveMessage">
					<div id="messageType"><span id="receivetype">받는 쪽지</span> <span id="receivedate">2021-05-10</span></div>
					<div id="messageContent">(메시지 내용)</div>
				</div>
				<div id="sendMessage">
					<div id="messageType"><span id="sendtype">받는 쪽지</span> <span id="senddate">2021-05-10</span></div>
					<div id="messageContent">(메시지 내용)</div>
				</div>
				<div id="receiveMessage">
					<div id="messageType"><span id="receivetype">받는 쪽지</span> <span id="receivedate">2021-05-10</span></div>
					<div id="messageContent">(메시지 내용)</div>
				</div>
				<div id="sendMessage">
					<div id="messageType"><span id="sendtype">받는 쪽지</span> <span id="senddate">2021-05-10</span></div>
					<div id="messageContent">(메시지 내용)</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
