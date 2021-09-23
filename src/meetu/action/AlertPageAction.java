package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.*;
import java.util.*;
import meetu.dao.AlertDAO;
import meetu.dto.*;

public class AlertPageAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		
		// 인스턴스 가져오기
		AlertDAO alert_dao = AlertDAO.getInstance();
		
		// is_read가 1인 알림내역 삭제
		boolean delete_success = alert_dao.deleteAlert(user_id, univ);
		if(!delete_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "delete alert failed");
		}
		
		// new alert list json 만들어 반환
		ArrayList<AlertDTO> alerts = alert_dao.getNewAlerts(user_id, univ);
		
		if(alerts != null) {
			JSONArray alertJsonArray = new JSONArray();
			
			Iterator<AlertDTO> iterator = alerts.iterator();
			
			while(iterator.hasNext()) {
				HashMap<String, Object> al_map = new HashMap<>();
				AlertDTO alert_dto = iterator.next();
				AlertTypeDTO alert_type_dto = alert_dao.getAlertTypeInfo(alert_dto, univ);
				JSONObject a = null;
				
				al_map.put("alert_id", alert_dto.getAlertId());
				al_map.put("alert_date", alert_dto.getAlertDate());
				al_map.put("alert_type", alert_type_dto.getTitle());
				al_map.put("alert_msg", alert_dto.getAlertMsg());
				al_map.put("is_read", alert_dto.getIsRead());
				al_map.put("user_id", alert_dto.getUserId());
						
				int type = alert_dto.getAlertType();
				if((type >= 0 && type <= 4) || type == 6) {
					al_map.put("url", "myPage.do");
				}
				else if(type == 5) {
					al_map.put("url", "message.do");
				}
				else if(type == 7) {
					if(alert_dto.getAlertMsg().length() == 40) {
						al_map.put("url", "myPage.do");
					}
					else {
						al_map.put("url", "index.do#target_cal");
					}
				}
				
				a = new JSONObject(al_map);
				alertJsonArray.add(a);
			}
			
			// System.out.println(alertJsonArray);
			req.setAttribute("alerts", alertJsonArray);
		}
		
		// read가 0인 알림내역 1로 변경
		boolean change_success = alert_dao.changeRead(user_id, univ);
		if(!change_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "change alert failed");
		}
		
		return "/alert/alert.jsp";
	}
	
}
