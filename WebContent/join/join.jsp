<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>
    <link rel="stylesheet" href="/join/css/join.css"/>

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

    <script src="/join/js/join.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

</head>

<body id="joinBodyBg">
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
            if (ck.equals("-5"))
                out.println("<script>alert('학사 정보에 메일 주소가 존재하지 않습니다. 관리자에게 문의하세요.');</script>");
        }
    %>
    
    <div id="joinWrap">
        <div id="joinTitle"><a>MEETU</a></div>
    
        <form method="post" action="join.do" name="join_form" onsubmit="return ck_join_form()">
            <div class="form-group" id="search_univ">
                <label>대학명</label>
                <div class="input-group mb-3">
                    <input type="text" id="univ_name" name="univ_name" class="form-control" placeholder="대학명"
                           aria-label="Recipient's username"
                           aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button id="search-button" class="btn btn-outline-secondary" type="button">검색</button>
                    </div>
                </div>
                <div class="dropdown-content" id="search_result">
                </div>
            </div>
            
            <div class="form-group">
                <label>학번</label>
                <input type="text" class="form-control" id="inputAddress2" name="member_id" placeholder="학번">
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>비밀번호</label>
                    <input type="password" class="form-control" id="inputEmail4" name="password" placeholder="비밀번호">
                </div>
                <div class="form-group col-md-6">
                    <label>비밀번호 확인</label>
                    <input type="password" class="form-control" id="inputPassword4" name="password_ck"
                           placeholder="비밀번호 확인">
                </div>
            </div>
            
            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-form-label col-sm-2 pt-0">소속</legend>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" value="student" id="gridRadios1"
                                   checked>
                            <label class="form-check-label" for="gridRadios1">
                                학생
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" value="professor" id="gridRadios2"
                                   value="option2">
                            <label class="form-check-label" for="gridRadios2">
                                교수
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>
            <button type="submit" id="join_btn">가입하기</button>
        </form>
    </div>
</body>
</html>
