package com.tech.project.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.project.dao.MDao;
import com.tech.project.vopage.SearchVO;



@Controller
public class MTableController {
	@Autowired
	private SqlSession sqlSession;
	
	


	
	@RequestMapping("member/offerlist")
	public String offerlist(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVo) {
		String strPage=request.getParameter("page");
		String ordertype=(String) session.getAttribute("order");
		System.out.println("정렬방식 : "+ordertype);
		if (ordertype==null) {
			ordertype="1";
		}
		if (strPage==null) {
			strPage="1";
		}
		
		int page=Integer.parseInt(strPage);
		searchVo.setPage(page);
		
		MDao dao=sqlSession.getMapper(MDao.class);
		int total=dao.selectOfferBoardCount();
		searchVo.pageCalculate(total);
		
		int rowStart=searchVo.getRowStart();
		int rowEnd=searchVo.getRowEnd();
		
		if (ordertype.equals("1")) 
			model.addAttribute("list", dao.list3(rowStart, rowEnd));
		else if(ordertype.equals("2"))
			model.addAttribute("list", dao.list4(rowStart, rowEnd));
		else if(ordertype.equals("3"))
			model.addAttribute("list", dao.list3(rowStart, rowEnd));
		else if(ordertype.equals("4"))
			model.addAttribute("list", dao.list4(rowStart, rowEnd));
		
		model.addAttribute("totalcnt", total);
		model.addAttribute("searchVo",searchVo);
		
		return "/member/offerlist";
	}
	
	@RequestMapping("member/offerordercheck")
	public String offerordercheck(HttpServletRequest request,HttpSession session) {
		String ordertype=request.getParameter("ot");
		
		session.setAttribute("order", ordertype);
	
		return "redirect:offerlist";
	}	
	
	
	
	
	
	

	
	
	
	
	
	
	
	@RequestMapping("member/memberlist")
	public String notice(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVo) {
		String strPage=request.getParameter("page");
		String ordertype=(String) session.getAttribute("order");
		System.out.println("정렬방식 : "+ordertype);
		if (ordertype==null) {
			ordertype="1";
		}
		if (strPage==null) {
			strPage="1";
		}
		
		int page=Integer.parseInt(strPage);
		searchVo.setPage(page);
		
		MDao dao=sqlSession.getMapper(MDao.class);
		int total=dao.selectSeekerBoardCount();
		searchVo.pageCalculate(total);
		
		int rowStart=searchVo.getRowStart();
		int rowEnd=searchVo.getRowEnd();
		
		if (ordertype.equals("1")) 
			model.addAttribute("list", dao.list(rowStart, rowEnd));
		else if(ordertype.equals("2"))
			model.addAttribute("list", dao.list2(rowStart, rowEnd));
		else if(ordertype.equals("3"))
			model.addAttribute("list", dao.list(rowStart, rowEnd));
		else if(ordertype.equals("4"))
			model.addAttribute("list", dao.list2(rowStart, rowEnd));
		
		model.addAttribute("totalcnt", total);
		model.addAttribute("searchVo",searchVo);
		
		return "/member/memberlist";
	}
	
	@RequestMapping("member/ordercheck")
	public String ordercheck(HttpServletRequest request,HttpSession session) {
		String ordertype=request.getParameter("ot");
		
		session.setAttribute("order", ordertype);
	
		return "redirect:memberlist";
	}
	
	
	
	
	
	
	
}