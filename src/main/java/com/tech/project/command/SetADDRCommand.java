package com.tech.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;

public class SetADDRCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String hID = request.getParameter("hID");
		String changedADDR = request.getParameter("changedADDR");
		String mspostcode = request.getParameter("mspostcode");
		String msdetailaddress = request.getParameter("msdetailaddress");
		String msextraaddress = request.getParameter("msextraaddress");

		MemberDAO dao = new MemberDAO();
		dao.setADDR(hID, changedADDR,mspostcode,msdetailaddress,msextraaddress);

		return "member/mypage";
	}
}
