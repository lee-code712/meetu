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
		
		// new alert list json 만들어 반환
		AlertDAO alert_dao = AlertDAO.getInstance();
			
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
				
				a = new JSONObject(al_map);
				alertJsonArray.add(a);
			}
			
			System.out.println(alertJsonArray);
			req.setAttribute("alerts", alertJsonArray);
		}
		return "/alert/alert.jsp";
	}
	
}