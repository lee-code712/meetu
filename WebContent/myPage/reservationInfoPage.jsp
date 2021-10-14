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
	        <div id="reservationTit">예약정보</div>
	        
            <table id="InfoTable">
                <tr id="infoWrap">
                    <td id="infoTitle">교수정보</td>
                    <td id="infoText">${prof_info.get(1)} ${prof_info.get(0)} ( ${prof_info.get(2)} )</td>
                </tr>
                <tr id="infoWrap">
                    <td id="infoTitle">학생정보</td>
                    <td id="infoText">${stu_info.get(1)} ${stu_info.get(0)} ( ${stu_info.get(2)}학년, ${stu_info.get(3)} )</td>
                </tr>
                <tr id="infoWrap">
                    <td id="infoTitle">상담일시</td>
                    <td id="infoText">
                        <c:set var="startTime" value="${reservation_dto.getStartTime()}"/>${fn:substring(startTime, 0, 16)}
            	 	    ~
            		    <c:set var="endTime" value="${reservation_dto.getEndTime()}"/>${fn:substring(endTime, 11, 16)}
                    </td>
                </tr>
                <tr id="infoWrap">
                    <td id="infoTitle">상담신청사유</td>
                    <td id="infoText">${reservation_dto.getReason()}</td>
                </tr>
                <tr id="infoWrap">
                    <td id="infoTitle">상담유형</td>
                    <td id="infoText">
                        <c:choose>
                            <c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
                            <c:otherwise>온라인</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
            
	        <div id="closeBtnWrap">
	            <button onclick="window.close()" id="reservationInfoCloseBtn">확인</button>
	        </div>
	    </div>
	</div>
</body>
</html>
