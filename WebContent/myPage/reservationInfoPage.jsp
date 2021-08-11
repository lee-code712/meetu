<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약정보</title>
    <style>
        #reservationInfoBg {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 50vh;
            background-image: url('/myPage/images/rejectMsgBg.svg');
            background-position: center;
            background-size: cover;
        }

        #reservationInfoWrap {
            width: 500px;
            height: 504px;
            padding: 3rem;
            border-radius: 0px 20px 0 20px;
            border: 1px solid #eee;
            box-shadow: 0 4px 4px 0 rgb(0, 0, 0, 0.2);
        }

        #reservationInfo {
            color: #535353;
        }

        #reservationInfoCloseBtnWrap {
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;
            width: 100%;
            height: 90%;

        }

        #reservationInfoCloseBtn {
			margin-top: 20px;
            background: none;
            border: none;
            color: #FBAB7E;
            font-size: 14px;
        }

        #reservationInfoCloseBtn:hover {
            cursor: pointer;
        }

        #infoWrap {
            margin-bottom: 30px;
        }

		#infoTitle {
			font-weight: bold;
		}
        #infoText {
            margin-top: 10px;
            font-size: 14px;
            color: #C4C4C4;
        }
    </style>
</head>

<body id="reservationInfoBg">
	<div id="reservationInfoWrap">
	    <div id="reservationInfo">
	        <div id="infoWrap">
	            <div id="infoTitle">[교수정보]</div>
	            <div id="infoText">${prof_info.get(1)} ${prof_info.get(0)} ( 이메일: ${prof_info.get(2)} )</div>
	        </div>
	        <div id="infoWrap">
	            <div id="infoTitle">[학생정보]</div>
	            <div id="infoText">${stu_info.get(1)} ${stu_info.get(0)} ( 학년: ${stu_info.get(2)}, 이메일: ${stu_info.get(3)} )</div>
	        </div>
	        <div id="infoWrap">
	            <div id="infoTitle">[상담일시]</div>
	            <div id="infoText">${reservation_dto.getStartTime()} ~ ${reservation_dto.getEndTime()}</div>
	        </div>
	        <div id="infoWrap">
	            <div id="infoTitle">[상담신청사유]</div>
	            <div id="infoText">${reservation_dto.getReason()}</div>
	        </div>
	        <div id="infoWrap">
	            <div id="infoTitle">[상담유형]</div>
	            <div id="infoText">
	                <c:choose>
	                    <c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
	                    <c:otherwise>온라인</c:otherwise>
	                </c:choose>
	            </div>
	        </div>
	        <div id="reservationInfoCloseBtnWrap">
	            <button onclick="window.close()" id="reservationInfoCloseBtn">확인</button>
	        </div>
	    </div>
	</div>
</body>
</html>