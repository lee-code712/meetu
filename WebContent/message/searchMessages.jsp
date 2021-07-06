<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%@ page import="com.fasterxml.jackson.databind.*"%> 

<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId(); 
	String user_id = (String) session.getAttribute("user_id");
	String mem_usr_id = request.getParameter("mem_usr_id");
	
	MessageDAO msg_dao = MessageDAO.getInstance();
	ArrayList<MessageInformationDTO> messages = (ArrayList<MessageInformationDTO>) msg_dao.getMessagesInfo(user_id, mem_usr_id, univ);
	
	if(messages != null) {
		TreeMap<Integer, MessageInformationDTO> msg_map = new TreeMap<Integer, MessageInformationDTO>(); // 메시지 id 순으로 정렬하기 위해 treemap 사용
		Iterator<MessageInformationDTO> iterator = messages.iterator();
		
		int cnt = 0;
		while(iterator.hasNext()) {
			MessageInformationDTO msg_info_dto = iterator.next();
			String msg_id = msg_info_dto.getMsgId();
			
			MessageContentDTO msg_content_dto = (MessageContentDTO) msg_dao.getMessage(msg_id, univ);		
			msg_info_dto.setMsgContentDto(msg_content_dto);

			msg_map.put(cnt++, msg_info_dto);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(msg_map);
		System.out.print(result);
		out.print(result);
	}
%>