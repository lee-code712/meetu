package meetu.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.NoticeDAO;
import meetu.dto.UniversityDTO;
import meetu.dto.NoticeDTO;

public class NoticeAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		
		NoticeDAO notice_dao = NoticeDAO.getInstance();
		ArrayList<NoticeDTO> notices = (ArrayList<NoticeDTO>) notice_dao.getNotices(univ);
		
		if(notices != null) {
			TreeMap<Integer, NoticeDTO> notice_map = new TreeMap<Integer, NoticeDTO>(); // 공지를 번호 순으로 정렬하기 위해 treemap 사용
			Iterator<NoticeDTO> iterator = notices.iterator();
			
			while(iterator.hasNext()) {
				NoticeDTO notice_dto = iterator.next();
				notice_map.put(notice_dto.getNoticeId(), notice_dto);
			}
			
			req.setAttribute("notice_map", notice_map);
		}
				
		return "/notice/notice.jsp";
	}

}
