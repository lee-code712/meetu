package meetu.action.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.*;
import meetu.dto.*;

public class AddMessageAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		String mem_usr_name = req.getParameter("mem_usr_name");
		String msg = req.getParameter("msg");
		
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
				res.setStatus(400);		// bad request
				res.addHeader("Status", "message content failed");
			}
		}
		else {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "message infomation failed");
		}
		
		return "message.do";
	}
}
