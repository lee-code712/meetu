<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	String email = request.getParameter("email");
	
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
		HttpSession session = req.getSession();
		session.setAttribute("code", n);
		
		msg.setContent(mail_body, "text/html;charset=UTF-8");
		msg.setHeader("Content-Transfer-Encoding", "base64");
		msg.setSentDate(new java.util.Date());
		Transport.send(msg);
		
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	
	out.println("success");
}
%>