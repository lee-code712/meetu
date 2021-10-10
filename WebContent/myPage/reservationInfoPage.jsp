<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약정보</title>
 	<!-- <link rel="stylesheet" href="/myPage/css/reservationInfoPage.css"/> -->
 	<style>
 		@charset "UTF-8";

        #rejectMsgBg {
            background: #FAFAFA;
        }

        #rejectMsgWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }


        #closeBtnWrap {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        #reservationInfoCloseBtn {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            margin-right: 20px;
            align-items: center;
            padding: 6px 24px;
            font-size: 14px;
            border-radius: 5px;
            border: none;
            background: #1abc9c;
            color: white;
        }

        #reservationInfoCloseBtn:hover {
            cursor: pointer;
        }

        #rejectImg {
            width: 80px;
            height: 80px;
        }

        #rejectImgWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 0px 10px 0px;
            width: 500px;
            background: white;
            border-radius: 10px 10px 0px 0px;
        }

        #rejectTit {
            display: flex;
            justify-content: center;
            align-items: center;
            padding-bottom: 40px;
            width: 500px;
            background: white;
            font-size: 24px;
        }

        #infoWrap {
            display: flex;
            align-items: center;
            height: 40px;
            margin-bottom: 10px;
        }

        #infoTitle {
            display: flex;
            align-items: center;
            width: 140px;
            height: 40px;
            color: #1abc9c;
        }

        #InfoTable {
            margin: 0px 20px;
            collapse: none;
        }

        #infoText {
            display: flex;
            align-items: center;
            padding: 0px 20px;
            height: 40px;
            width: 370px;
            background: white;
            color: #535353;
        }


        #rejectMsgInnerWrap {
            padding-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
        }

        #reservationTit {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            padding-left: 20px;
            height: 40px;
            background: #1abc9c;
            color: white;
            border-radius: 5px 5px 0px 0px;
        }
        
        
 	</style>
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
