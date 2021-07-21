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
	String option = request.getParameter("option");
	String keyword = request.getParameter("keyword");
		
	// 인스턴스 가져오기
	NoticeDAO notice_dao = NoticeDAO.getInstance();
	
	// notice list json 만들어 반환
	ArrayList<NoticeDTO> notices = null;
	if(keyword.equals("")) {
		notices = (ArrayList<NoticeDTO>) notice_dao.getNotices(univ);
	}
	else {
		notices = (ArrayList<NoticeDTO>) notice_dao.searchNotices(option, keyword, univ);
	}
	
	if(notices != null) {
		int cnt = 1;
		TreeMap<Integer, NoticeDTO> notice_map = new TreeMap<Integer, NoticeDTO>(); // 공지를 번호 순으로 정렬하기 위해 treemap 사용
		Iterator<NoticeDTO> iterator = notices.iterator();
			
		while(iterator.hasNext()) {
			NoticeDTO notice_dto = iterator.next();
			notice_map.put(cnt++, notice_dto);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(notice_map);
		// System.out.println(result);
		out.print(result);
	}
%>