package meetu.action.reservation;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.AlertDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class UpdateReservationAction  implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		String role = mem_dto.getRole();
		String res_id = req.getParameter("res_id");
		String choiceMonth = req.getParameter("choiceMonth");
		String choiceDay = req.getParameter("choiceDay");
		String startTime = req.getParameter("startTime");
		String endTime = "";
		String consultTime = req.getParameter("consultTime");
		String typeBtn = req.getParameter("type");
		String radio = req.getParameter("radio");
		
		// 예약 일시 생성 - 21/07/28 09:00:00의 형식
		Calendar cal = Calendar.getInstance();
		String year = Integer.toString(cal.get(Calendar.YEAR));
		year = year.substring(2, 4);
				
		String start_time = year + "/" + choiceMonth + "/" + choiceDay + " " + startTime + ":00";
				
		// end_time 생성 - 21/07/28 09:00:00의 형식
		cal = Calendar.getInstance();
		year = Integer.toString(cal.get(Calendar.YEAR));
				
		String[] startTimeArr = startTime.split(":"); // 09:00을 09, 00으로 분리
		int start_timeInt =  Integer.parseInt(startTimeArr[0]); // 09만 이용
		int consultTimeInt = Integer.parseInt(consultTime.replaceAll("[^0-9]", ""));
		int endTimeInt = start_timeInt + consultTimeInt;
				
		if (endTimeInt < 10) { // 시간이 한 자리 수인 경우 0을 붙여서 09와 같이 두 자리 수로 만들어 주어야 함
			endTime = "0" + Integer.toString(start_timeInt + consultTimeInt);
		}
		else {
			endTime = Integer.toString(start_timeInt + consultTimeInt);
		}				
		String end_time = year + "/" + choiceMonth + "/" + choiceDay + " " + endTime + ":00:00";
		
		// 예약 dao 인스턴스 생성
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		
		// 예약 dto 생성
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
		
		reservation_dto.setStartTime(start_time);
		reservation_dto.setEndTime(end_time);
		
		if (radio.equals("1")) { // 상담 이유
			reservation_dto.setReason("전담 교수 상담");
		}
		else if (radio.equals("2")) {
			reservation_dto.setReason("진로 상담");
		}
		else if (radio.equals("3")) {
			reservation_dto.setReason("휴학 상담");
		}
		else if (radio.equals("4")) {
			reservation_dto.setReason("대학원 상담");
		}
		else {
			reservation_dto.setReason(radio);
		}
		
		if(typeBtn.equals("오프라인")) { // 온라인/오프라인 상담 구분. 오프라인 0, 온라인 1
			reservation_dto.setType(0);
		}
		else {
			reservation_dto.setType(1);
		}
		
		if(role.equals("0")) {
			// 선택한 시간대에 예약 내역이 존재하는지 확인
			boolean date_check = reservation_dao.checkSameResDate(reservation_dto, univ);
			if(date_check) {
				return "reservationUpdateForm.do?date_ck=1";
			}
		}

		// 예약 수정
		boolean change_success = reservation_dao.updateReservation(reservation_dto, univ);	
		if(!change_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "update reservation failed");
			return "reservationUpdateForm.do?update_ck=0";
		}
		
		// 예약수정에 대한 새 알림 저장
		AlertDAO alert_dao = AlertDAO.getInstance();
				
		AlertDTO alert_dto = new AlertDTO();
		alert_dto.setAlertType(0);
		alert_dto.setAlertMsg(mem_dto.getName() + "님이 예약을 수정했습니다.");
		if(role.equals("0")) {
			alert_dto.setUserId(reservation_dto.getPUserId());
		}
		else {
			alert_dto.setUserId(reservation_dto.getSUserId());
		}
				
		boolean alert_is_added = alert_dao.addAlert(alert_dto, univ);
		if(!alert_is_added) {
			res.setStatus(400); // bad request
			res.addHeader("Status", "add alert failed");
		}
		
		return "reservationUpdateForm.do?update_ck=1";
	}
}
