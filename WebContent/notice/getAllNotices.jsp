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
		
	// 인스턴스 가져오기
	NoticeDAO notice_dao = NoticeDAO.getInstance();
	
	// notice list json 만들어 반환
	ArrayList<NoticeDTO> notices = (ArrayList<NoticeDTO>) notice_dao.getNotices(univ);
		
	if(notices != null) {
		TreeMap<Integer, NoticeDTO> notice_map = new TreeMap<Integer, NoticeDTO>(); // 공지를 번호 순으로 정렬하기 위해 treemap 사용
		Iterator<NoticeDTO> iterator = notices.iterator();
			
		while(iterator.hasNext()) {
			NoticeDTO notice_dto = iterator.next();
			notice_map.put(notice_dto.getNoticeId(), notice_dto);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(notice_map);
		// System.out.println(result);
		out.print(result);
	}
%>