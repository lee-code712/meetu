<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
교수정보: 
<br>
학생정보:
<br>
상담일시: ${reservation_dto.getResDate()}
<br>
상담 신청 사유: ${reservation_dto.getReason()}
<br>
상담 유형:
<c:choose>
	<c:when test="${reservation_dto.getType() == 0}">오프라인</c:when>
	<c:otherwise>온라인</c:otherwise>
</c:choose>
<br>
<button onclick="window.close()">확인</button>
</body>
</html>