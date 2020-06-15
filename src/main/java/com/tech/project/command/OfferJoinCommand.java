package com.tech.project.command;

import java.io.PrintWriter;
import java.sql.Timestamp;
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
import com.tech.project.dto.MemberDTO;
import com.tech.project.util.Gmail;
import com.tech.project.util.SHA256;

public class OfferJoinCommand implements SCommand {
	MemberDAO dao;

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
//		int msno = Integer.parseInt(request.getParameter("0"));
		
		String msid = request.getParameter("id");
		String mspw = request.getParameter("pw1");
		String msname = request.getParameter("msname");
		String msemail = request.getParameter("email");
		String msaddr = request.getParameter("msaddr");
		String mstel = request.getParameter("mstel");
		String mspostcode = request.getParameter("mspostcode");
		String msdetailaddress = request.getParameter("msdetailaddress");
		String msextraaddress = request.getParameter("msextraaddress");
		String molisense =  request.getParameter("molisense");


		dao = new MemberDAO();

		int result = dao.offerjoin(new MemberDTO(0, msid, SHA256.getSHA256(mspw), msname, msemail, SHA256.getSHA256(msemail), 0, msaddr, mstel, "", "", "offer", mspostcode, msdetailaddress, msextraaddress, molisense));
		
		if (result == 1) {// 성공
			/* request.getSession().setAttribute("memberNickname", nickname); */
			emailSendAction(msid);
			return "member/sendMail";
		} else if (result == -1) {// ID 중복
			return "iddupl";
		} else if (result == -2) {// 닉네임 중복
			return "nndupl";
		} else {
			return "error";
		}
	}

	private void emailSendAction(String id) {
		String host = "http://localhost:9000/project_UDB/";
		String from = "qotkddls9498@gmail.com";

		String to = dao.getMemberEmail(id);
		String code = new SHA256().getSHA256(to);
		String subject = "회원가입 인증을 위한 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + "<a href='" + host + "emailCheck?code=" + code + "&id=" + id
				+ "'>이메일 인증하기</a>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
