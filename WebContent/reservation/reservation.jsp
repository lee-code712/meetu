<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>reservationPage</title>
	<link rel="stylesheet" href="../components/css/header.css" />
   	<link rel="stylesheet" href="css/reservation.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		<div id="innerBanner">
			<div>상담예약</div>
		</div>
	</div>
	
	<section>
	
	<div id="search">
		<input type="text" id="searchText" placeholder="교수명을 입력하세요." >
		<button id="searchBtn">검색</button>
	</div>
	
	<ul id="deptWrap">
		<li id="selectDept">학과 선택</li>
		
		<li class="college">인문대학
			<ul class="deptList">
				<li class="dept">국어국문학과</li>
				<li class="dept">국사학과</li>
				<li class="dept">문예창작과</li>
				<li class="dept">영어과</li>
				<li class="dept">일본어과</li>
				<li class="dept">프랑스어과</li>
				<li class="dept">독일어과</li>
				<li class="dept">중어중국학과</li>
			</ul>
		</li>
		<li class="college">사회과학대학
			<ul class="deptList">
				<li class="dept">경영학과</li>
				<li class="dept">세무회계학과</li>
				<li class="dept">경제학과</li>
				<li class="dept">국제경영학과</li>
				<li class="dept">문헌정보학과</li>
				<li class="dept">사회복지학과</li>
				<li class="dept">아동학과</li>
			</ul>
		</li>
		<li class="college">자연과학대학
			<ul class="deptList">
				<li class="dept">식품영양학과</li>
				<li class="dept">보건관리학과</li>
				<li class="dept">응용화학전공</li>
				<li class="dept">화장품학전공</li>
				<li class="dept">체육학과</li>
				<li class="dept">토탈뷰티케어학과</li>
			</ul>
		</li>
		<li class="college">정보과학대학
			<ul class="deptList">
				<li class="dept">컴퓨터학과</li>
				<li class="dept">정보통계학과</li>
			</ul>
		</li>
		<li class="college">약학대학</li>
		<li class="college">예술대학
			<ul class="deptList">
				<li class="dept">회화과</li>
				<li class="dept">디지털공예과</li>
				<li class="dept">큐레이터학과</li>
				<li class="dept">피아노과</li>
				<li class="dept">관현악과</li>
				<li class="dept">성악과</li>
			</ul>	
		</li>
		<li class="college">디자인대학
			<ul class="deptList">
				<li class="dept">패션디자인학과</li>
				<li class="dept">시각&실내디자인학과</li>
				<li class="dept">미디어디자인학과</li>
			</ul>	
		</li>
		<li class="college">공연예술대학
			<ul class="deptList">
				<li class="dept">무용과</li>
				<li class="dept">방송연예과</li>
				<li class="dept">실용음악과</li>
				<li class="dept">모델과</li>
			</ul>		
		</li>
	</ul>
	
	<script>
    	$('.college').click(function(){
      		$('.deptList').slideUp();
      		if($(this).children('.deptList').is(':visible')){
        		$(this).children('.deptList').slideUp();
      		}else{
       	 		$(this).children('.deptList').slideDown();
      		}
    	});
  	</script>
  
	<div class="profListWrap">
	<table class="profList">
			<thead>
 			<tr>
    			<th>교수명</th>
     			<th>학과</th>
     			<th>정보보기</th>
    			<th>선택하기</th>
   			</tr>
			</thead>

			<tbody>
   			<tr>
      			<td>000교수님</td>
      			<td>컴퓨터학과</td>
      			<td class="profInfo">
         			<a>정보보기</a>
      			</td>
      			<td class="selectProf">
      				<a>선택하기</a>
      			</td>
   			</tr>
 		 </table> 
 		</div>
 	</section>
</body>
</html>
