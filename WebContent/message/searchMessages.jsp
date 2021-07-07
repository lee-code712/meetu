<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
		TreeMap<Date, MessageInformationDTO> msg_map = new TreeMap<Date, MessageInformationDTO>(); // 메시지를 시간 순으로 정렬하기 위해 treemap 사용, 근데 보낸 시간이 정확히 같으면 하나만 저장됨..
		Iterator<MessageInformationDTO> iterator = messages.iterator();
		
		while(iterator.hasNext()) {
			MessageInformationDTO msg_info_dto = iterator.next();
			String msg_id = msg_info_dto.getMsgId();
			String sent_time = msg_info_dto.getSentTime();
			
			MessageContentDTO msg_content_dto = (MessageContentDTO) msg_dao.getMessage(msg_id, univ);		
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date date = sdf.parse(sent_time);

			msg_info_dto.setMsgContentDto(msg_content_dto);

			msg_map.put(date, msg_info_dto);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(msg_map);
		// System.out.println(result);
		out.print(result);
	}
%>