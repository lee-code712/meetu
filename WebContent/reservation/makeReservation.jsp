<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dao.ReservationDAO"%>
<%@ page import="meetu.dto.MemberDTO"%>
<%@ page import="meetu.dto.MemberUserDTO"%>
<%@ page import="meetu.dto.ProfessorDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%>

<%
	String prof_email = request.getParameter("prof_email");
	String choiceMonth = request.getParameter("choiceMonth");
	String choiceDay = request.getParameter("choiceDay");
	String startTime = request.getParameter("startTime");
	String consultTime = request.getParameter("consultTime");
	String typeBtn = request.getParameter("typeBtn");
	String reason = request.getParameter("reason");
	
	MemberDAO memberDAO = new MemberDAO();
	
	// 예약 일시 생성 - 21/07/28 09:00:00의 형식
	Calendar cal = Calendar.getInstance();
	String year = Integer.toString(cal.get(Calendar.YEAR));
	year = year.substring(2, 4);
	
	String res_date = year + "/" + choiceMonth + "/" + choiceDay + " " + startTime + ":00";
	
	// 온라인/오프라인 상담 구분. 오프라인 0, 온라인 1
	int type;
	if(typeBtn.equals("오프라인")) {
		type = 0;
	}
	else {
		type = 1;
	}
	
	// 교수 학번 구하기
	// 모든 교수 정보를 가져옴
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	ArrayList<ProfessorDTO> professors = memberDAO.getAllProfessors(univ_dto.getUnivId());
	
	String p_user_id = "";
	for(int i = 0; i < professors.size(); i++) {
		if(professors.get(i).getEmail().equals(prof_email)) { // 이메일은 중복 불가 - 교수 구분 위해 사용
			String prof_id = professors.get(i).getProfId(); // 이메일이 같은 경우, 해당 교수 학번을 불러옴
			
			// 모든 회원 정보를 가져와 해당 교수의 id 검색
			ArrayList<MemberDTO> members = memberDAO.getAllMemberUsers(univ_dto.getUnivId());
			for (int j = 0; j < members.size(); j++) {
				if (members.get(j).getMemberId().equals(prof_id)) { 
					MemberUserDTO p_user = memberDAO.getMemberUserInfo(members.get(j), univ_dto.getUnivId());
					
					p_user_id = p_user.getUserId();
				}
			}
		}
	}
	
	ReservationDAO reservationDAO = new ReservationDAO();
	boolean is_added = reservationDAO.makeReservation(univ_dto.getUnivId(), res_date, reason, type, p_user_id, (String)session.getAttribute("user_id"));
	
	if(is_added) {
		out.println("<script>alert('성공적으로 예약 신청되었습니다.'); location.href='reservationPro.do';</script>");
	}
	else {
		out.println("<script>alert('예약 신청에 실패했습니다.'); location.href='reservationPro.do';</script>");
	}
%>