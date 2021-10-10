<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <style>
        #logo {
            margin-bottom: 50px;
            color: #1abc9c;
            font-family: 'Yellowtail', cursive;
            font-size: 48px;
            font-weight: bold;
        }

        #joinProWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        #successMsg {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 400px;
            font-size: 18px;
            color: #535353;
        }

        #welcome {
            margin-bottom: 20px;
            font-size: 24px;
        }

        #loginBtn {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 60px;
            width: 400px;
            height: 40px;
            background: #1abc9c;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }
    </style>
</head>
<body>
<%
	String user_id = request.getParameter("user_id");
%>
<div id="joinProWrap">
    <div id="logo">MEETU</div>
    <div id="welcome">환영합니다!</div>
    <div id="successMsg">회원가입에 성공했습니다.</div>
    <div id="successMsg">회원님의 아이디는 <%= user_id %> 입니다.</div>
    <button onclick="loginForm.do" id="loginBtn">로그인</button>
</div>
</body>
</html>