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
		String univ = univ_dto.getUnivId();
		
		MemberDAO mem_dao = MemberDAO.getInstance();
		ArrayList<MemberDTO> members = new ArrayList<>((ArrayList<MemberDTO>) mem_dao.getAllMembers(univ));
		
		if(members != null) {
			HashMap<String, String> map = new HashMap<String, String>();
			Iterator<MemberDTO> iterator = members.iterator();
			while(iterator.hasNext()) {
				MemberDTO mem_dto = iterator.next();
				if(!mem_dto.getRole().equals("2")) {
					DepartmentDTO dept_dto = mem_dao.getDepartmentInfo(mem_dto, univ);
					map.put(mem_dto.getName(), dept_dto.getDeptName());
				}
			}			
			req.setAttribute("msg_mem", map);
			System.out.print(map);
		}
		
		return "/message/message.jsp";
	}
}
