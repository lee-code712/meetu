package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.Iterator;

import meetu.dao.*;
import meetu.dto.*;

public class MessageAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		String univ = univ_dto.getUnivId();
		String id = (String) session.getAttribute("user_id");
		
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		ArrayList<ReservationDTO> reservations = (ArrayList<ReservationDTO>) reservation_dao.getReservationInfo(univ, id);
		
		if(reservations != null) {
			HashMap<String, String> mem_map = new HashMap<String, String>(); 
			Iterator<ReservationDTO> iterator = reservations.iterator();
			MemberDAO mem_dao = MemberDAO.getInstance();
			
			while(iterator.hasNext()) {
				ReservationDTO reservation_dto = iterator.next();
				if(reservation_dto.getApproval() == 1) {
					MemberDTO member = null;
					if(mem_dto.getRole().equals("0")) {
						member = mem_dao.getMemberInfo(univ, reservation_dto.getPUserId());
					}
					else {
						member = mem_dao.getMemberInfo(univ, reservation_dto.getSUserId());
					}
					DepartmentDTO dept_dto = mem_dao.getDepartmentInfo(member, univ);
					mem_map.put(member.getName(), dept_dto.getDeptName());
				}
			}
			
			req.setAttribute("msg_mem", mem_map);
		}
		
		return "/message/message.jsp";
	}
}
