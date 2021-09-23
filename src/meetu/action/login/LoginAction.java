package meetu.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Calendar;

import meetu.action.CommandAction;
import meetu.dao.AlertDAO;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dao.UniversityDAO;
import meetu.dto.*;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		String univ_id = "";
		
		int i = 0;
        char c = user_id.charAt(i);
        while(c >= 'a' && c <= 'z') {
        	univ_id += c;
        	i++;
        	if(i >= user_id.length())
        		break;
        	c = user_id.charAt(i);
        }
		
        // 필요한 인스턴스 가져오기
        MemberDAO mem_dao = MemberDAO.getInstance();
		UniversityDAO univ_dao = UniversityDAO.getInstance();
		
		// login 성공 여부 check
		MemberUserDTO mem_usr_dto = new MemberUserDTO();
		mem_usr_dto.setUserId(user_id);
		mem_usr_dto.setPassword(password);
		
		UniversityDTO univ_dto = univ_dao.getUnivInfo(univ_id);
		
		MemberDTO mem_dto = null;
		if(univ_dto != null) {
			mem_dto = mem_dao.loginOk(mem_usr_dto, univ_id, role);
		}
		
		// login 성공 여부에 따른 페이지 반환
		if (mem_dto != null) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user_id", user_id); // 회원 id 저장
			session.setAttribute("mem_dto", mem_dto); // 회원정보(학번,이름,역할) 저장
			session.setAttribute("univ_dto", univ_dto); // 대학정보(id,이름) 저장
			
			// 예정된 상담에 대한 새 알림 저장
			AlertDAO alert_dao = AlertDAO.getInstance();
			String univ = univ_dto.getUnivId();
			
			// 당일에 생성한 상담 예정일 알림이 존재하는 지 확인 
			String alert_date = alert_dao.isExist(7, user_id, univ);
			if(alert_date != null) {
				alert_date = alert_date.substring(0, 10);
				String[] alert_date_arr = alert_date.split("-");
				int d_day = getDDay(alert_date_arr[0], alert_date_arr[1], alert_date_arr[2]);
				if(d_day == 0) {
					return "index.do";
				}
			}
			
			ReservationDAO reservation_dao = ReservationDAO.getInstance();
				
			ArrayList<ReservationDTO> reservations = (ArrayList<ReservationDTO>) reservation_dao.getReservationInfo(univ, user_id);				
			
			if(reservations != null) {
				Iterator<ReservationDTO> iterator = reservations.iterator();
				
				while(iterator.hasNext()) {
					ReservationDTO reservation_dto = iterator.next();
					
					if(reservation_dto.getState() == 1) { // 예약이 승인된 경우에만
						String res_date = reservation_dto.getStartTime().substring(0, 10);
						String[] res_date_arr = res_date.split("-");
						int d_day = getDDay(res_date_arr[0], res_date_arr[1], res_date_arr[2]);
						String mem_usr_id;
						if(mem_dto.getRole().equals("0")) {
							mem_usr_id = reservation_dto.getPUserId();
						}
						else {
							mem_usr_id = reservation_dto.getSUserId();
						}
						
						MemberDTO member = mem_dao.getMemberInfo(univ, mem_usr_id);
						AlertDTO alert_dto = new AlertDTO();
						alert_dto.setAlertType(7);
						if(d_day < 0) {
							alert_dto.setAlertMsg(member.getName() + "님과의 상담 예정일이 지났습니다. 상담취소 혹은 완료처리 바랍니다.");
						}
						else if(d_day == 0) {
							alert_dto.setAlertMsg(member.getName() + "님과의 상담 D-Day");
						}
						else {
							alert_dto.setAlertMsg(member.getName() + "님과의 상담까지 D-" + d_day);
						}
						alert_dto.setUserId(user_id);
											
						boolean alert_is_added = alert_dao.addAlert(alert_dto, univ);
						if(!alert_is_added) {
							res.setStatus(400); // bad request
							res.addHeader("Status", "add alert failed");
						}
					}
				}
			}
			
			return "index.do";
		}
		else { // 로그인 실패
			return "loginForm.do?ck=0";
		}
	}
	
	// d-day를 구하는 함수
	public int getDDay(String year, String month, String day) {
		try {
			Calendar today = Calendar.getInstance();
			Calendar d_day = Calendar.getInstance();
			d_day.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
				
			long l_today = today.getTimeInMillis() / (24*60*60*1000);
			long l_d_day = d_day.getTimeInMillis() / (24*60*60*1000);
				
			long substract = l_d_day - l_today;
			return (int)substract;
		} catch (Exception e) {
			return -1;
		}
	}
	
}