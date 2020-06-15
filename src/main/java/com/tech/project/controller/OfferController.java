package com.tech.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.project.command.EmailCheckCommand;
import com.tech.project.command.JoinCommand;
import com.tech.project.command.LoginCommand;
import com.tech.project.command.LogoutCommand;
import com.tech.project.command.FindPassCommand;
import com.tech.project.command.MailConfirmCommand;
import com.tech.project.command.OfferJoinCommand;
import com.tech.project.command.ReLoginCommand;
import com.tech.project.command.SCommand;
import com.tech.project.command.SetADDRCommand;
import com.tech.project.command.SetPWCommand;
import com.tech.project.command.SetTELCommand;
import com.tech.project.command.VCommand;

@Controller
public class OfferController {

	SCommand scommand;
	VCommand vcommand;

	// 홈 -> 회원가입페이지로 이동
	@RequestMapping("/offerjoin-view")
	public String joinView(Model model) {
		return "offer/offerjoin";
	}

	// 홈 => 회원가입 기능 구현
	@RequestMapping("/offerjoin")
	public String offerjoin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new OfferJoinCommand();
		String str = scommand.execute(model);
		if (str.equals("iddupl")) {
			model.addAttribute("idDupl", "이미 가입된 아이디입니다");
			return "/offer/offerjoin";
		}
		if (str.equals("nndupl")) {
			model.addAttribute("nnDupl", "사용할 수 없는 닉네임입니다");
			return "/offer/offerjoin";
		}
		return str;
	}

}