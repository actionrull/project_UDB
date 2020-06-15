package com.tech.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;
import com.tech.project.util.SHA256;

public class SetPWCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String hID = request.getParameter("hID");
		String changedPW = request.getParameter("changedPW");

		MemberDAO dao = new MemberDAO();
		dao.setPW(hID, SHA256.getSHA256(changedPW));

		return "member/mypage";
	}
}
