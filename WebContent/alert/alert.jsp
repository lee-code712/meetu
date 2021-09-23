<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>알림</title>
    
    <link rel="stylesheet" href="/alert/css/alert.css"/>
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
            			<div id="alertBoxHeader">
                			<div id="alertType">${alert.alert_type}</div>
                			<div id="alertDate">${alert.alert_date}</div>
            			</div>
            			<div id="alertContent">${alert.alert_msg} &nbsp;<span id="${alert.url}" class="link" onclick="returnUrl()">바로가기</span></div>
        			</div>
        </c:forEach>
    </div>
</div>
</body>
</html>
