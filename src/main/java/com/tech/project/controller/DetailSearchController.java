package com.tech.project.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.project.dao.NDao;
import com.tech.project.vopage.SearchVO;

@Controller
public class DetailSearchController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("detailsearch/DetailSearch_view")
	public String DetailSearch_view(HttpSession session,Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);			
			model.addAttribute("totalnoti", totalnoti);
			
		}
		System.out.println("pass DetailSearch_view()");
		
		return "detailsearch/DetailSearch_view";
	}
	
	@RequestMapping("detailsearch/DetailSearch")
	public String DetailSearch(HttpServletRequest request,SearchVO searchVo, Model model,HttpSession session) {
		System.out.println("pass DetailSearch()");
		
		
		String ordertype = (String) session.getAttribute("order");
		if (ordertype == null) {
			ordertype = "1";
		}
		
		
		//지역
		String nlocation=request.getParameter("nlocation");
		if (nlocation==null) {
			nlocation="";
		}
			System.out.println("nlocation :"+nlocation);
		//업직종
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
			System.out.println("ncategory :"+ncategory);
			
		//근무기간
		String nperiod= request.getParameter("nperiod");
		if (nperiod==null) {
			nperiod="";
		}
			System.out.println("nperiod :"+nperiod);
		
		//근무요일
		String nday=request.getParameter("nday");
		if (nday==null) {
			nday="";
		}
			System.out.println("nday :"+nday);
		
		//근무시간
		String ntime=request.getParameter("ntime");
		if (ntime==null) {
			ntime="";
		}
			System.out.println("ntime :"+ntime);
		
		//급여
			//시급
		String ntpay=request.getParameter("ntpay");
		if (ntpay==null) {
			ntpay="";
		}
			System.out.println("ntpay :"+ntpay);
		
	
		String npay=request.getParameter("npay");
		if (npay==null) {
			npay="";
		}
			System.out.println("npay :"+npay);
			
		//복리후생
		String nwelfare=request.getParameter("nwelfare");
		if (nwelfare==null) {
			nwelfare="";
		}
			System.out.println("nwelfare :"+nwelfare);
			
		//성별	
		String ngender=request.getParameter("ngender");
		if (ngender==null) {
			ngender="";
		}
			System.out.println("ngender :"+ngender);
			
		//연령
		String nage=request.getParameter("nage");
		if (nage==null) {
			nage="";
		}
			System.out.println("nage :"+nage);
		
		
		String nag=request.getParameter("nag");
		if (nag==null) {
			nag="";
		}
			System.out.println("nag :"+nag);
			
		NDao dao=sqlSession.getMapper(NDao.class);	
		
		
		//page
		
		int total=0;
		total=dao.detailSearchCount(nlocation,ncategory,nperiod,nday,ntime,ntpay,
				npay,nwelfare,ngender,nage,nag);
		System.out.println("total :"+total);
		
		String dspage=request.getParameter("page");
		
		if (dspage==null || dspage.equals("")) {
			dspage="1";
		}
		
		System.out.println("dspage :"+dspage);

		int page=Integer.parseInt(dspage);
		searchVo.setPage(page);
		searchVo.pageCalculate(total);
		
		System.out.println("====================");
		System.out.println("clickPage : " + searchVo.getPage());
		System.out.println("pageStart : " + searchVo.getPageStart());
		System.out.println("pageEnd : " + searchVo.getPageEnd());
		System.out.println("pageTot : " + searchVo.getTotPage());
		System.out.println("rowStart : " + searchVo.getRowStart());
		System.out.println("rowEnd : " + searchVo.getRowEnd());
		
		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();
		
		model.addAttribute("total", total);
		model.addAttribute("searchVo", searchVo);
		
		if (ordertype.equals("1")) {
			model.addAttribute("DetailSearchList", 
					dao.DetailSearchList(nlocation, ncategory, nperiod, nday, ntime, 
							ntpay, npay, nwelfare, ngender, nage, nag, rowStart, rowEnd));
		}else if (ordertype.equals("2")) {
			model.addAttribute("DetailSearchList", 
					dao.DetailSearchList2(nlocation, ncategory, nperiod, nday, ntime, 
							ntpay, npay, nwelfare, ngender, nage, nag, rowStart, rowEnd));
		}else if (ordertype.equals("3")) {
			model.addAttribute("DetailSearchList",
					dao.DetailSearchList3(nlocation, ncategory, nperiod, nday, ntime, 
							ntpay, npay, nwelfare, ngender, nage, nag, rowStart, rowEnd));
		}else if (ordertype.equals("4")) {
			model.addAttribute("DetailSearchList",
					dao.DetailSearchList4(nlocation, ncategory, nperiod, nday, ntime, 
							ntpay, npay, nwelfare, ngender, nage, nag, rowStart, rowEnd));
		}
		
		
//		model.addAttribute("DetailSearchList",
//				dao.DetailSearchList(
//				nlocation,ncategory,nperiod,nday,ntime,ntpay,
//				npay,nwelfare,ngender,nage,nag,rowStart,rowEnd));
//	
		
		
		return "detailsearch/DetailSearch";
	}
	
	@RequestMapping("/detailsearch/ordercheck")
	public String ordercheck(HttpServletRequest request, HttpSession session,RedirectAttributes redirectAttributes) {
		String ordertype = request.getParameter("ot");
		
		//지역
				String nlocation=request.getParameter("nlocation");
				if (nlocation==null) {
					nlocation="";
				}
					System.out.println("nlocation :"+nlocation);
				//업직종
				String ncategory=request.getParameter("ncategory");
				if (ncategory==null) {
					ncategory="";
				}
					System.out.println("ncategory :"+ncategory);
					
				//근무기간
				String nperiod= request.getParameter("nperiod");
				if (nperiod==null) {
					nperiod="";
				}
					System.out.println("nperiod :"+nperiod);
				
				//근무요일
				String nday=request.getParameter("nday");
				if (nday==null) {
					nday="";
				}
					System.out.println("nday :"+nday);
				
				//근무시간
				String ntime=request.getParameter("ntime");
				if (ntime==null) {
					ntime="";
				}
					System.out.println("ntime :"+ntime);
				
				//급여
					//시급
				String ntpay=request.getParameter("ntpay");
				if (ntpay==null) {
					ntpay="";
				}
					System.out.println("ntpay :"+ntpay);
				
			
				String npay=request.getParameter("npay");
				if (npay==null) {
					npay="";
				}
					System.out.println("npay :"+npay);
					
				//복리후생
				String nwelfare=request.getParameter("nwelfare");
				if (nwelfare==null) {
					nwelfare="";
				}
					System.out.println("nwelfare :"+nwelfare);
					
				//성별	
				String ngender=request.getParameter("ngender");
				if (ngender==null) {
					ngender="";
				}
					System.out.println("ngender :"+ngender);
					
				//연령
				String nage=request.getParameter("nage");
				if (nage==null) {
					nage="";
				}
					System.out.println("nage :"+nage);
				
				
				String nag=request.getParameter("nag");
				if (nag==null) {
					nag="";
				}
					System.out.println("nag :"+nag);

		session.setAttribute("order", ordertype);

		redirectAttributes.addAttribute("nlocation", nlocation);
		redirectAttributes.addAttribute("ncategory", ncategory);
		redirectAttributes.addAttribute("nperiod", nperiod);
		redirectAttributes.addAttribute("nday", nday);
		redirectAttributes.addAttribute("ntime", ntime);
		redirectAttributes.addAttribute("ntpay", ntpay);
		redirectAttributes.addAttribute("npay", npay);
		redirectAttributes.addAttribute("nwelfare", nwelfare);
		redirectAttributes.addAttribute("ngender", ngender);
		redirectAttributes.addAttribute("nage", nage);
		redirectAttributes.addAttribute("nag", nag);
		
		return "redirect:DetailSearch";
	}
	
	
	
	
	@RequestMapping("detailsearch/previewon")
	public String previewon(HttpSession session, HttpServletRequest request, SearchVO searchVo, RedirectAttributes redirectAttributes) {
		System.out.println("previewon pass");
		String nlocation=request.getParameter("nlocation");
		if (nlocation==null) {
			nlocation="";
		}
			System.out.println("nlocation :"+nlocation);
		//업직종
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
			System.out.println("ncategory :"+ncategory);
			
		//근무기간
		String nperiod= request.getParameter("nperiod");
		if (nperiod==null) {
			nperiod="";
		}
			System.out.println("nperiod :"+nperiod);
		
		//근무요일
		String nday=request.getParameter("nday");
		if (nday==null) {
			nday="";
		}
			System.out.println("nday :"+nday);
		
		//근무시간
		String ntime=request.getParameter("ntime");
		if (ntime==null) {
			ntime="";
		}
			System.out.println("ntime :"+ntime);
		
		//급여
			//시급
		String ntpay=request.getParameter("ntpay");
		if (ntpay==null) {
			ntpay="";
		}
			System.out.println("ntpay :"+ntpay);
		
	
		String npay=request.getParameter("npay");
		if (npay==null) {
			npay="";
		}
			System.out.println("npay :"+npay);
			
		//복리후생
		String nwelfare=request.getParameter("nwelfare");
		if (nwelfare==null) {
			nwelfare="";
		}
			System.out.println("nwelfare :"+nwelfare);
			
		//성별	
		String ngender=request.getParameter("ngender");
		if (ngender==null) {
			ngender="";
		}
			System.out.println("ngender :"+ngender);
			
		//연령
		String nage=request.getParameter("nage");
		if (nage==null) {
			nage="";
		}
			System.out.println("nage :"+nage);
		
		
		String nag=request.getParameter("nag");
		if (nag==null) {
			nag="";
		}
			System.out.println("nag :"+nag);
		
//		마감일까지 남은 날짜 구하기
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

		String strpage = request.getParameter("remainpage");
		redirectAttributes.addAttribute("nlocation", nlocation);
		redirectAttributes.addAttribute("ncategory", ncategory);
		redirectAttributes.addAttribute("nperiod", nperiod);
		redirectAttributes.addAttribute("nday", nday);
		redirectAttributes.addAttribute("ntime", ntime);
		redirectAttributes.addAttribute("ntpay", ntpay);
		redirectAttributes.addAttribute("npay", npay);
		redirectAttributes.addAttribute("nwelfare", nwelfare);
		redirectAttributes.addAttribute("ngender", ngender);
		redirectAttributes.addAttribute("nage", nage);
		redirectAttributes.addAttribute("nag", nag);

		return "redirect:/detailsearch/DetailSearch?page=" + strpage;
	}

	@RequestMapping("detailsearch/previewoff")
	public String previewoff(HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("previewoff pass");
		String nlocation=request.getParameter("nlocation");
		if (nlocation==null) {
			nlocation="";
		}
			System.out.println("nlocation :"+nlocation);
		//업직종
		String ncategory=request.getParameter("ncategory");
		if (ncategory==null) {
			ncategory="";
		}
			System.out.println("ncategory :"+ncategory);
			
		//근무기간
		String nperiod= request.getParameter("nperiod");
		if (nperiod==null) {
			nperiod="";
		}
			System.out.println("nperiod :"+nperiod);
		
		//근무요일
		String nday=request.getParameter("nday");
		if (nday==null) {
			nday="";
		}
			System.out.println("nday :"+nday);
		
		//근무시간
		String ntime=request.getParameter("ntime");
		if (ntime==null) {
			ntime="";
		}
			System.out.println("ntime :"+ntime);
		
		//급여
			//시급
		String ntpay=request.getParameter("ntpay");
		if (ntpay==null) {
			ntpay="";
		}
			System.out.println("ntpay :"+ntpay);
		
	
		String npay=request.getParameter("npay");
		if (npay==null) {
			npay="";
		}
			System.out.println("npay :"+npay);
			
		//복리후생
		String nwelfare=request.getParameter("nwelfare");
		if (nwelfare==null) {
			nwelfare="";
		}
			System.out.println("nwelfare :"+nwelfare);
			
		//성별	
		String ngender=request.getParameter("ngender");
		if (ngender==null) {
			ngender="";
		}
			System.out.println("ngender :"+ngender);
			
		//연령
		String nage=request.getParameter("nage");
		if (nage==null) {
			nage="";
		}
			System.out.println("nage :"+nage);
		
		
		String nag=request.getParameter("nag");
		if (nag==null) {
			nag="";
		}
			System.out.println("nag :"+nag);
		
		session.removeAttribute("dspreview");
		String strpage = request.getParameter("remainpage");

		redirectAttributes.addAttribute("nlocation", nlocation);
		redirectAttributes.addAttribute("ncategory", ncategory);
		redirectAttributes.addAttribute("nperiod", nperiod);
		redirectAttributes.addAttribute("nday", nday);
		redirectAttributes.addAttribute("ntime", ntime);
		redirectAttributes.addAttribute("ntpay", ntpay);
		redirectAttributes.addAttribute("npay", npay);
		redirectAttributes.addAttribute("nwelfare", nwelfare);
		redirectAttributes.addAttribute("ngender", ngender);
		redirectAttributes.addAttribute("nage", nage);
		redirectAttributes.addAttribute("nag", nag);
		
		return "redirect:/detailsearch/DetailSearch?page=" + strpage;
	}
	
	
	
	
}
