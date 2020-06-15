package com.tech.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;
import com.tech.project.util.SHA256;

public class DeleteIDCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String hID = request.getParameter("hID");
		String deletePW = request.getParameter("deletePW");

		MemberDAO dao = new MemberDAO();
		dao.DeleteID(hID, SHA256.getSHA256(deletePW));

		return "member/mypage";
	}
}
