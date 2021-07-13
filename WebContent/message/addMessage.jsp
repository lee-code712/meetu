<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String user_id = (String) session.getAttribute("user_id");
	String mem_usr_name = request.getParameter("mem_usr_name");
	String msg = request.getParameter("msg");
	
	// 인스턴스 가져오기
	MemberDAO mem_dao = MemberDAO.getInstance();
	MessageDAO msg_dao = MessageDAO.getInstance();
		
	// 상대의 id 찾기
	MemberDTO mem_dto = new MemberDTO();
	mem_dto.setName(mem_usr_name);
	MemberUserDTO mem_usr_dto = (MemberUserDTO) mem_dao.getMemberUserInfo(mem_dto, univ);
	String mem_usr_id = mem_usr_dto.getUserId();

	// msg 저장
	MessageInformationDTO msg_info_dto = new MessageInformationDTO();
	msg_info_dto.setSendId(user_id);
	msg_info_dto.setRecvId(mem_usr_id);
	
	boolean msg_info_success = msg_dao.addMessageInfo(msg_info_dto, univ);
	if(msg_info_success) {
		MessageContentDTO msg_content_dto = new MessageContentDTO();
		msg_content_dto.setMsg(msg);
		boolean msg_content_success = msg_dao.addMessage(msg_content_dto, univ);
		
		if(!msg_content_success) {
			response.setStatus(400);		// bad request
			response.addHeader("Status", "message content failed");
		}
	}
	else {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "message infomation failed");
	}
%>