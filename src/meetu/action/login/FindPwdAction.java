package meetu.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Properties;
import java.util.ArrayList;
import javax.mail.*;
import javax.mail.internet.*;

import meetu.action.CommandAction;
import meetu.authentication.MyAuthentication;
import meetu.dao.MemberDAO;
import meetu.dao.UniversityDAO;
import meetu.dto.UniversityDTO;

public class FindPwdAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		String role = req.getParameter("role");
		String user_id = req.getParameter("user_id");
		String email = req.getParameter("email");
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
		
        // 입력한 정보에 맞는 패스워드 탐색
		UniversityDTO univ_dto = univ_dao.getUnivInfo(univ_id);
		ArrayList<String> find_info = null;
		if(univ_dto != null) {
			find_info = mem_dao.findPassword(univ_id, user_id, role);
		}
        
		// 패스워드를 못찾은 경우 페이지 반환
        if(find_info == null) {
        	return "findPwdForm.do?ck=" + -1;
        }
        // 이메일이 다른 경우 페이지 반환
        if(!find_info.get(0).equals(email)) {
        	return "findPwdForm.do?ck=" + -2;
        }
        
        // 패스워드를 찾은 경우 해당 이메일로 발송
        String mail_title = "패스워드 찾기";
		String sender = "swddwu@gmail.com";
		String sender_name = "meetU 관리자";
		
		Session sess = null;
		Message msg = null;
		Properties props = null;
		
		try {
			props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.auth", "true");
	        
            Authenticator auth = new MyAuthentication(sender, "ddwusw19");
			sess = Session.getDefaultInstance(props, auth);
			
			msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(sender, sender_name, "UTF-8"));
			InternetAddress[] address = {new InternetAddress(email)};
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(mail_title);
			
			String mail_body = "meetU 패스워드 찾기에 대한 메일입니다. 등록하신 패스워드는 [ " + find_info.get(1) + " ]입니다.";
			msg.setContent(mail_body, "text/html;charset=UTF-8");
			msg.setHeader("Content-Transfer-Encoding", "base64");
			msg.setSentDate(new java.util.Date());
			Transport.send(msg);
			
		} catch (Exception ex) {
			ex.printStackTrace();
        }
		
		// 이메일 발송 후 페이지 반환
		return "findPwdForm.do?ck=" + 1;
	}
}
