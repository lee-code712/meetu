<%-- 공지사항 게시판 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>notice</title>
	<link rel="stylesheet" href="../components/css/header.css" />
	<link rel="stylesheet" href="/notice/css/notice.css" />
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
		<div>상담예약</div>
	</div>
	
	<div id="noticeTable">
		<select id="noticeNav">
			<option>전체</option>
			<option>제목</option>
			<option>내용</option>
			<option>작성자</option>
		</select>
		
		<div id="search">
			<input type="text" placeholder="검색어를 입력하세요." id="searchText">
			<div id="searchBtn">검색</div>
		</div>
	</div>
	
	<div class="board">
		<table class="boardListWrap">
			<thead>
 				<tr>
    				<th>번호</th>
     				<th>제목</th>
     				<th>작성자</th>
    				<th>작성일</th>
    				<th>조회수</th>
   				</tr>
			</thead>
			
			<tbody>
				<tr id="boardList">
					<td>1</td>
					<td class="tit">글의 제목이 입력됩니다.</td>
					<td>MEETU 관리자</td>
					<td>2021-05-10</td>
					<td>123</td>
				</tr>
				
				<tr id="boardList">
					<td>2</td>
					<td class="tit">글의 제목이 입력됩니다.</td>
					<td>MEETU 관리자</td>
					<td>2021-05-10</td>
					<td>123</td>
				</tr>
				
				<tr id="boardList">
					<td>3</td>
					<td class="tit">글의 제목이 입력됩니다.</td>
					<td>MEETU 관리자</td>
					<td>2021-05-10</td>
					<td>123</td>
				</tr>
				
				<tr id="boardList">
					<td>4</td>
					<td class="tit">글의 제목이 입력됩니다.</td>
					<td>MEETU 관리자</td>
					<td>2021-05-10</td>
					<td>123</td>
				</tr>
			</tbody>
		</table>
				
			<div class="paging">
				<a href="#" class="bt">이전</a>
				
				<a class="num">1</a>
				<a class="c_num">2</a>
				<a class="c_num">3</a>
				<a class="c_num">4</a>
				<a class="c_num">5</a>
				
				<a href="#" class="bt">다음</a>
			</div>		
	</div>
</body>
</html>
