package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;

import meetu.authentication.MyAuthentication;

public class JoinSendMailAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		
		String email = (String) session.getAttribute("email");
		
		if (email != null && !email.equals("")) {
			String mail_title = "meetU 이메일 인증";
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
				
				Random rand = new Random();
				String n = Integer.toString(rand.nextInt(10000));
				
				String mail_body = "meetU 회원가입 인증 메일입니다. 인증 란에 [ " + n + " ]를 입력해 주세요.";
				
				session.setAttribute("authNum", n);
				session.setAttribute("email", email);
				
				msg.setContent(mail_body, "text/html;charset=UTF-8");
				msg.setHeader("Content-Transfer-Encoding", "base64");
				msg.setSentDate(new java.util.Date());
				Transport.send(msg);
				
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			// 이메일 발송 후 페이지 반환
			return "joinAuthForm.do?ck=1";
		}
		else {
			return "/join/join.jsp?ck=-5"; // 메일이 null인 경우
		}
	}
}
