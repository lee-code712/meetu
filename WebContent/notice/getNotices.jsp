<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%@ page import="org.json.simple.*"%> 

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
		JSONArray noticeJsonArray = new JSONArray();
		
		Iterator<NoticeDTO> iterator = notices.iterator();
		
		int cnt = notices.size();
		while(iterator.hasNext()) {
			HashMap<String, Object> no_map = new HashMap<>();
			NoticeDTO notice_dto = iterator.next();
			JSONObject n = null;
			
			no_map.put("no", cnt--);
			no_map.put("notice_id", notice_dto.getNoticeId());
			no_map.put("title", notice_dto.getTitle());
			no_map.put("write_date", notice_dto.getWriteDate());
			no_map.put("views", notice_dto.getViews());
			no_map.put("content", notice_dto.getContent());
			
			n = new JSONObject(no_map);
			noticeJsonArray.add(n);
		}
		
		// System.out.println(noticeJsonArray);
		out.print(noticeJsonArray);
	}
%>