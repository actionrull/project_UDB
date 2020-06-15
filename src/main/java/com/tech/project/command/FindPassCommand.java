package com.tech.project.command;

import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;
import com.tech.project.util.Gmail;
import com.tech.project.util.SHA256;



public class FindPassCommand implements SCommand {
	MemberDAO dao;
	
	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		
		dao=new MemberDAO();
		int result=dao.lookupPW(id, email);
		if(result==1) {
			String pw=((int)(Math.random()*90000000)+10000000)+"";
			dao.updatePW(id,SHA256.getSHA256(pw));
			emailSendAction(id,pw);
			return "member/sendPWMail";
		}else {
			model.addAttribute("idNE","존재하지 않는 아이디입니다.");
			return "member/lookupPW";
		}
	}

	private void emailSendAction(String id, String pw) {
		String host="http://localhost:9000/project_UDB/";
		String from="qotkddls9498@gmail.com";
		String to=dao.getMemberEmail(id);
		String code=new SHA256().getSHA256(to);
		String subject="임시 비밀번호가 전송되었습니다.";
		String content="회원님의 임시 비밀번호는 <strong>"+pw+"</strong> 입니다. 로그인 후 비밀번호를 재설정해주시기 바랍니다";
		
		
		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth=new Gmail();
			Session ses=Session.getInstance(p,auth);
			ses.setDebug(true);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
