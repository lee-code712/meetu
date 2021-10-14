<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>아이디 찾기</title>
	
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/login/css/findIdForm.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
</head>

<body id="bodyBg">
	<div id="findIdWrap">
	    <div id="loginTitle"><a>아이디 찾기</a></div>
	    <form method="post" action="login.do">
	        <div id="position">
	            <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="role" id="student_ck" value="0" checked>
	                <label class="form-check-label">학부생</label>
	            </div>
	            <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="role" id="professor_ck" value="1">
	                <label class="form-check-label">교직원</label>
	            </div>
	        </div>
	        
	        <div class="form-group">
	            <label>대학 번호</label>
	            <input type="text" class="form-control" name="user_id" id="univId" aria-describedby="emailHelp"
	                   placeholder="대학 번호" required>
	        </div>
	        
	        <div class="form-group">
	            <label>학번</label>
	            <input type="text" class="form-control" name="password" id="userId" placeholder="학번" required>
	        </div>
	        
	        <button type="submit" id="findIdBtn">아이디 찾기</button>
	    </form>
	</div>
</body>
</html>
