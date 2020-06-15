package com.tech.project.command;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;
import com.tech.project.util.SHA256;

public class LoginCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("login");
		String pw = request.getParameter("password");
		String msmaster = request.getParameter("msmaster");

		String newpw = SHA256.getSHA256(pw);
		
		MemberDAO dao = new MemberDAO();
		String result = dao.login(id, newpw);
		if (result.equals("아이디나 비밀번호를 확인해주세요")) {
			model.addAttribute("error",result);
			return "/member/login";
		} else if (result.equals("아이디나 비밀번호를 확인해주세요")) {
			model.addAttribute("error",result);
			return "/member/login";
		} else if (result.equals("데이터베이스 오류")) {
			model.addAttribute("error",result);
			return "/member/login";
		} else if (result.equals("이메일 인증이 필요합니다")) {
			model.addAttribute("error",result);
			return "/member/login";
		} else {// 성공
			request.getSession().setAttribute("memberNickname", result);
			request.getSession().setAttribute("memberID", id);
			request.getSession().setAttribute("memberPW", pw);
			request.getSession().setAttribute("msmaster", dao.msmaster(id));

			model.addAttribute("mailChecked", dao.getMemberEmailChecked(id));

			return "redirect:/";
		}
	}
}
