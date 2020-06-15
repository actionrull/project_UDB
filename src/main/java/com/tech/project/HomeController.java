package com.tech.project;

import java.sql.Date;

import java.text.DateFormat;
import java.util.ArrayList;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.project.dao.IDaox;
import com.tech.project.dao.NDao;
import com.tech.project.dto.NoticeDto;
import com.tech.project.vopage.SearchVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		
		IDaox dao=sqlSession.getMapper(IDaox.class);
		model.addAttribute("home", dao.home());
		
		String msid = (String) session.getAttribute("memberID");
		NDao ndao = sqlSession.getMapper(NDao.class);
		
		if (msid != null) {
			int totalnoti = ndao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		
		ArrayList<NoticeDto> premium=dao.homepremium();
		model.addAttribute("premium", premium);
		
		return "home";
	}
	
	@RequestMapping("MainSearch")
	public String MainSearch(HttpServletRequest request,Model model,SearchVO searchVo,HttpSession session) {
		System.out.println("pass MainSearch()");
		
		String ordertype = (String) session.getAttribute("order");
		if (ordertype == null) {
			ordertype = "1";
		}
		
		
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
		System.out.println("ncategory :"+ncategory);
		
		NDao dao= sqlSession.getMapper(NDao.class);
		
		//page
		int total=0;
		total=dao.mainSearchCount(ncategory);
		System.out.println("total:"+total);
		
		String mspage=request.getParameter("page");
		
		if (mspage==null || mspage.equals("")) {
			mspage="1";
		}
		System.out.println("mspage :"+mspage);
		
		int page=Integer.parseInt(mspage);
		searchVo.setPage(page);
		searchVo.pageCalculate(total);
		
		System.out.println("====================");
		System.out.println("clickPage : " + searchVo.getPage());
		System.out.println("pageStart : " + searchVo.getPageStart());
		System.out.println("pageEnd : " + searchVo.getPageEnd());
		System.out.println("pageTot : " + searchVo.getTotPage());
		System.out.println("rowStart : " + searchVo.getRowStart());
		System.out.println("rowEnd : " + searchVo.getRowEnd());
		
		int rowStart=searchVo.getRowStart();
		int rowEnd=searchVo.getRowEnd();
		
		model.addAttribute("ncategory", ncategory);
		model.addAttribute("total", total);
		model.addAttribute("searchVo", searchVo);
		
		if (ordertype.equals("1")) {
			model.addAttribute("ms", dao.MainSearchList(ncategory,rowStart,rowEnd));
		}else if (ordertype.equals("2")) {
			model.addAttribute("ms", dao.MainSearchList2(ncategory,rowStart,rowEnd));
		}else if (ordertype.equals("3")) {
			model.addAttribute("ms", dao.MainSearchList3(ncategory,rowStart,rowEnd));
		}else if (ordertype.equals("4")) {
			model.addAttribute("ms", dao.MainSearchList4(ncategory,rowStart,rowEnd));
		}
		
		
		
		
		//ArrayList<NoticeDto> ms= dao.mainsearch(ncategory);
		//model.addAttribute("ms", ms);
		return "mainsearch/MainSearch";
	}
	
	@RequestMapping("ordercheck")
	public String ordercheck(HttpServletRequest request, HttpSession session,RedirectAttributes redirectAttributes) {
		String ordertype=request.getParameter("ot");
		
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
		System.out.println("ncategory :"+ncategory);
		
		session.setAttribute("order", ordertype);
		
		redirectAttributes.addAttribute("ncategory", ncategory);
		
		
		return "redirect:MainSearch";
		
	}
	
	@RequestMapping("previewon")
	public String previewon(HttpSession session, HttpServletRequest request, SearchVO searchVo, RedirectAttributes redirectAttributes) {
		System.out.println("previewon pass");
		
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
			System.out.println("ncategory :"+ncategory);
			
//			마감일까지 남은 날짜 구하기
			String dday = request.getParameter("dday");
			String now = request.getParameter("now");
			if (dday.isEmpty()) {
				session.setAttribute("lefttime", "");
			}else {
				Date d = Date.valueOf(dday);
				Date n = Date.valueOf(now);
				
				long left = d.getTime() - n.getTime();
				int time = (int) (Math.floor(left) / (1000 * 60 * 60 * 24) + 1);
				String day=time+"일 남음";
				
				session.setAttribute("lefttime", day);
			}

			String pn = request.getParameter("pn");
			session.setAttribute("dspreview", pn);	
			
			String strpage=request.getParameter("remainpage");
			redirectAttributes.addAttribute("ncategory", ncategory);
			
		return "redirect:MainSearch?page="+strpage;
	}
	
	@RequestMapping("previewoff")
	public String previewoff(HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("previewoff pass");
		
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
		System.out.println("ncategory :"+ncategory);
		
		session.removeAttribute("dspreview");
		String strpage = request.getParameter("remainpage");
		
		redirectAttributes.addAttribute("ncategory", ncategory);
		
		return "redirect:MainSearch?page="+strpage;
	}
	
	
}
