package com.tech.project.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.project.dao.NDao;

@Controller
public class CustomerController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("customer/faq")
	public String faq(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}

		return "customer/faq";

	}

	@RequestMapping("customer/campaign")
	public String campaign(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}

		return "customer/campaign";

	}

	@RequestMapping("customer/policy")
	public String policy(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}

		return "customer/policy";
	}

	@RequestMapping("customer/cscenter")
	public String cscenter(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		return "/customer/cscenter";
	}

	@RequestMapping("customer/report")
	public String report(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		return "/customer/report";
	}

	@RequestMapping("customer/intro")
	public String intro(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		return "/customer/intro";
	}

	@RequestMapping("customer/ccontract")
	public String ccontract() {
		return "/customer/ccontract";
	}

	@RequestMapping("customer/reportboard")
	public String reportboard() {
		return "/customer/reportboard";
	}

}
