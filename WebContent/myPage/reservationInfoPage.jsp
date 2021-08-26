<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약정보</title>
 	<link rel="stylesheet" href="/myPage/css/reservationInfoPage.css"/>
</head>

<body id="reservationInfoBg">
<div id="rejectMsgWrap">
    <div id="rejectMsgInnerWrap">
        <div id="rejectImgWrap"><img src="../images/profInfo.svg" id="rejectImg"/></div>
        <div id="rejectMsg">
            <div id="infoWrap">
                <div id="infoTitle">교수정보</div>
                <div id="infoText">${prof_info.get(1)} ${prof_info.get(0)} ( ${prof_info.get(2)} )</div>
            </div>
            <div id="infoWrap">
                <div id="infoTitle">학생정보</div>
                <div id="infoText">${stu_info.get(1)} ${stu_info.get(0)} ( ${stu_info.get(2)}학년, ${stu_info.get(3)} )
                </div>
            </div>
            <div id="infoWrap">
                <div id="infoTitle">상담일시</div>
                <div id="infoText">
                	<c:set var="startTime" value="${reservation_dto.getStartTime()}"/>${fn:substring(startTime, 0, 16)}
            	 	~ 
            		<c:set var="endTime" value="${reservation_dto.getEndTime()}"/>${fn:substring(endTime, 11, 16)}
            	</div>
            </div>
            <div id="infoWrap">
                <div id="infoTitle">상담신청사유</div>
                <div id="infoText">${reservation_dto.getReason()}</div>
            </div>
            <div id="infoWrap">
                <div id="infoTitle">상담유형</div>
                <div id="infoText">
                    <c:choose>
                        <c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
                        <c:otherwise>온라인</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div id="closeBtnWrap">
            <button onclick="window.close()" id="reservationInfoCloseBtn">확인</button>
        </div>
    </div>
</div>
</body>
</html>
