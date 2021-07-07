<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String user_id = (String) session.getAttribute("user_id");
	String mem_usr_id = request.getParameter("mem_usr_id");
	String msg = request.getParameter("msg");
	
	MessageDAO msg_dao = MessageDAO.getInstance();
	MessageInformationDTO msg_info_dto = new MessageInformationDTO();
	msg_info_dto.setSendId(user_id);
	msg_info_dto.setRecvId(mem_usr_id);
	
	String msg_id = msg_dao.addMessageInfo(msg_info_dto, univ);
	if(msg_id != null) {
		MessageContentDTO msg_content_dto = new MessageContentDTO();
		msg_content_dto.setMsgId(msg_id);
		msg_content_dto.setMsg(msg);
		boolean success = msg_dao.addMessage(msg_content_dto, univ);
		
		if(!success) {
			response.setStatus(400);		// bad request
			response.addHeader("Status", "message content failed");
		}
	}
	else {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "message infomation failed");
	}
%>