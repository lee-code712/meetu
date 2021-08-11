package meetu.action.mypage;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.ReservationDAO;
import meetu.action.CommandAction;
import meetu.dao.MessageDAO;
import meetu.dto.*;

public class ChangeReservationStateAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		String res_id = (String) req.getParameter("res_id");
		String selected_button = (String) req.getParameter("selected_button");
		
		// 인스턴스 가져오기
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		MessageDAO msg_dao = MessageDAO.getInstance();

		// state 변경
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		
		boolean change_success = false;
		if(selected_button.equals("approvalBtn")) {
			reservation_dto.setState(1);
			change_success = reservation_dao.changeState(reservation_dto, univ);
		}
		else if(selected_button.equals("rejectBtn")) {
			reservation_dto.setState(2);
			change_success = reservation_dao.changeState(reservation_dto, univ);
		}
		else if(selected_button.equals("consultedBtn")) {
			reservation_dto.setState(3);
			change_success = reservation_dao.changeState(reservation_dto, univ);
		}
		else if(selected_button.equals("cancelBtn")) {
			reservation_dto.setState(4);
			change_success = reservation_dao.changeState(reservation_dto, univ);
		}
		
		// 상태가 상담완료 혹은 상담취소로 바뀌는 경우 주고받은 메시지 목록 db에서 삭제
		if(selected_button.equals("consultedBtn") || selected_button.equals("cancelBtn")) {
			reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
			String mem_usr_id;
			if(user_id.equals("0")) {
				mem_usr_id = reservation_dto.getPUserId();
			}
			else {
				mem_usr_id = reservation_dto.getSUserId();
			}
			
			ArrayList<MessageInformationDTO> messages = (ArrayList<MessageInformationDTO>) msg_dao.getMessagesInfo(user_id, mem_usr_id, univ);
			if(messages != null) {
				Iterator<MessageInformationDTO> iterator = messages.iterator();
				
				while(iterator.hasNext()) {
					MessageInformationDTO msg_info_dto = iterator.next();
					int msg_id = msg_info_dto.getMsgId();
			
					boolean delete_msg_success = msg_dao.deleteMessage(msg_id, univ);		
					if(!delete_msg_success) {
						res.setStatus(400);		// bad request
						res.addHeader("Status", "delete message content failed");
					}
				}
				
				boolean delete_msg_info_success = msg_dao.deleteMessagesInfo(univ);
				if(!delete_msg_info_success) {
					res.setStatus(400);		// bad request
					res.addHeader("Status", "delete message information failed");
				}	
			}
		}
		
		if(!change_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "change state failed");
		}
		return "myPage.do";
	}
}
