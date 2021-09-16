package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.ReservationDAO;
import meetu.action.CommandAction;
import meetu.dto.*;

public class UpdateConsultationRecordAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String res_id = req.getParameter("res_id");
		String content = req.getParameter("content");
		
		// 인스턴스 가져오기
		ReservationDAO reservation_dao = ReservationDAO.getInstance();

		// reseved list json 만들어 반환
		ConsultContentDTO consult_dto = new ConsultContentDTO();
		consult_dto.setResId(res_id);
		consult_dto.setContent(content);
		
		boolean update_success = reservation_dao.updateConsultContent(consult_dto, univ);
		if(!update_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "update consult content failed");
		}	
		
		return "myPage.do";
	}
}
