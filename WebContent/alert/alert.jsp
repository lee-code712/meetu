<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>알림</title>

    <!--<link rel="stylesheet" href="/alert/css/alert.css"/>-->
    <style>
        .popup_btn a {
            display: inline-block;
            padding: 20px;
            background: darkred;
            color: #fff;
        }

        .popup {
            position: fixed;
            width: 60%;
            padding: 10px;
            max-width: 500px;
            border-radius: 10px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, .9);
            /* "delay" the visibility transition */
            -webkit-transition: opacity .5s, visibility 0s linear .5s;
            transition: opacity .5s, visibility 0s linear .5s;
            z-index: 1;
        }

        .popup:target {
            visibility: visible;
            opacity: 1;
            /* cancel visibility transition delay */
            -webkit-transition-delay: 0s;
            transition-delay: 0s;
        }

        .popup-close {
            position: absolute;
            padding: 10px;
            max-width: 500px;
            border-radius: 10px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, .9);
        }

        .popup .close {
            position: absolute;
            right: 5px;
            top: 5px;
            padding: 5px;
            color: #000;
            transition: color .3s;
            font-size: 2em;
            line-height: .6em;
            font-weight: bold;
        }

        .popup .close:hover {
            color: #00E5EE;
        }

        #alertBox {
            display: flex;
            justify-content: center;
            flex-direction: column;
            margin-bottom: 10px;
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
        }

        #alertTitle {
            display: flex;
            justify-content: center;
            padding: 10px 0px;
            background: #1ABC9C;
            color: white;
            width: 100%;
            font-size: 18px;
        }

        #alertBoxBottom {
            display: flex;
            align-items: center;
            height: 40px;
            justify-content: space-between;
            padding: 0 10px;
        }

        #alertType {
            display: flex;
            align-items: center;
            height: 20px;
            color: #1ABC9C;
            font-size: 16px;
            font-weight: bold;
        }

        #alertDate {
            padding-right: 10px;
            display: flex;
            justify-content: flex-end;
            height: 20px;
            color: #C4C4C4;
            font-size: 12px;
        }

        #alertContent {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            padding-left: 10px;
            font-size: 14px;
            color: #535353;
        }

        #alertBoxOn {
            margin-bottom: 10px;
            height: 80px;
            width: 100%;
            border-radius: 5px;
            background: #1ABC9C;
        }

        #alertBoxOnHeader {
            display: flex;
            height: 40px;
            align-items: center;
            justify-content: space-between;
            padding: 0 10px;
        }

        #alertTypeOn {
            color: white;
            font-size: 16px;
            font-weight: bold;
        }

        #alertDateOn {
            color: #535353;
        }

        #alertContentOn {
            padding-left: 10px;
        }

        .link {
            padding: 4px 10px;
            border: 1px solid #7AAFFF;
            border-radius: 50px;
            font-size: 12px;
            color: #7AAFFF;
            cursor: pointer;
        }

        #contentBox {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<script>
	function returnUrl() {
		var url = event.currentTarget.closest("span").id;
		opener.movePage(url);
	}
</script>

<body id="alertBg">
<div id="pop01">
    <div id="alertWrap">
        <div id="alertTitle">알림</div>
        <c:if test="${requestScope.alerts == null}">
        	새로운 알림이 없습니다.
        </c:if>
        <c:forEach items="${requestScope.alerts}" var="alert">
                    <div id="alertBox">
                        <div id="alertBoxBottom">
                        <div id="alertType">${alert.alert_type}</div>
                            <div id="${alert.url}" class="link" onclick="returnUrl()">바로가기</div>
                            </div>
            			<div id="alertContent">${alert.alert_msg}</div>
                        <div id="alertDate">${alert.alert_date}</div>
        			</div>
        </c:forEach>
    </div>
</div>
</body>
</html>
