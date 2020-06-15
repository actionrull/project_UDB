package com.tech.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;

public class SetTELCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String hID = request.getParameter("hID");
		String changedTEL = request.getParameter("changedTEL");

		MemberDAO dao = new MemberDAO();
		dao.setTEL(hID, changedTEL);

		return "member/mypage";
	}
}
