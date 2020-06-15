package com.tech.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.project.dao.MemberDAO;



public class CheckNicknameCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String changeName = request.getParameter("changeName");

		MemberDAO dao=new MemberDAO();
		int result=dao.nicknameCheck(changeName);
		if(result==0) {
			return "<h5>해당 아이디는 사용 가능합니다.</h5>";
		}else {
			return "<h5>해당 아이디는 이미 사용중입니다.</h5>";
		}
	}
}
