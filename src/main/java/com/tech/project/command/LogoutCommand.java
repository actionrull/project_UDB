package com.tech.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class LogoutCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		request.getSession().invalidate();
		return "home";
	}
}
