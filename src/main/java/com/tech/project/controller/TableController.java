package com.tech.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.project.dao.IDao;
import com.tech.project.dto.BoardDto;
import com.tech.project.vopage.SearchVO;

@Controller
public class TableController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/practice/login")
	public String login() {
		
		return "/practice/login";
	}
	@RequestMapping("/practice/join")
	public String join() {
		
		return "/practice/join";
	}
	@RequestMapping("/practice/content_view")
	public String content_view() {
		
		return "/practice/content_view";
	}
	@RequestMapping("/practice/table")
	public String table(HttpServletRequest request, Model model, SearchVO searchVo) {
		String btitle="";
		String bcontent="";
		
		String[] brdtitle=
				request.getParameterValues("searchType");

		if (brdtitle!=null) {
			for (String val : brdtitle) {
				if(val.equals("btitle")) {
					model.addAttribute("btitle","true");
					btitle="btitle";
				}else if(val.equals("bcontent")) {
					model.addAttribute("bcontent","true");
					bcontent="bcontent";
				}	
			}
		}
		
		String searchKeyword=request.getParameter("sk");
		if(searchKeyword==null) {
			searchKeyword="";
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int total=0;
		
		if(btitle.equals("btitle") && bcontent.equals("")) {
			 total=dao.selectBoardCount(searchKeyword ,"1" );
			System.out.println("go total >list1");
		}else if(btitle.equals("") && bcontent.equals("bcontent")) {
			 total=dao.selectBoardCount(searchKeyword, "2" );
			System.out.println("go total >list2");
		}else if(btitle.equals("btitle") && bcontent.equals("bcontent")) {
			 total=dao.selectBoardCount(searchKeyword, "3" );
			System.out.println("go total >list3");
		}else if(btitle.equals("") && bcontent.equals("")) {
			 total=dao.selectBoardCount(searchKeyword, "0" );
			System.out.println("go total >list0");
		}
		
		//pageVO=new PageVO();
		String strPage=request.getParameter("page");
		
		System.out.println("searchKeyword >>"+searchKeyword);
		model.addAttribute("searchKeyword",searchKeyword);
		
		System.out.println("strPage >>"+strPage);

			if(strPage==null || strPage.equals("")) {
				strPage="1";
			}
		System.out.println("strPage >>"+strPage);

		int page=Integer.parseInt(strPage);
		searchVo.setPage(page);
		
		searchVo.pageCalculate(total);

		int rowStart=searchVo.getRowStart();
		int rowEnd=searchVo.getRowEnd();
		
//		select check query
		System.out.println("btitle>>"+btitle);
		System.out.println("bcontent>>"+bcontent);
		
		if(btitle.equals("btitle") && bcontent.equals("")) {
			model.addAttribute("list", dao.table(rowStart,rowEnd,searchKeyword,"1"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword,"1"));
			System.out.println("gogo >list1");
		}else if(btitle.equals("") && bcontent.equals("bcontent")) {
			model.addAttribute("list", dao.table(rowStart,rowEnd,searchKeyword,"2"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword,"2"));
			System.out.println("gogo >list2");
		}else if(btitle.equals("btitle") && bcontent.equals("bcontent")) {
			model.addAttribute("list", dao.table(rowStart,rowEnd,searchKeyword,"3"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword,"3"));
			System.out.println("gogo >list3");
		}else if(btitle.equals("") && bcontent.equals("")) {
			model.addAttribute("list", dao.table(rowStart,rowEnd,searchKeyword,"0"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword,"0"));
			System.out.println("gogo >list0");
		}

		model.addAttribute("searchVo",searchVo);
		return "/practice/table";
	}
	@RequestMapping("/practice/table_view")
	public String table_view(HttpServletRequest request, Model model) {
		String bid=request.getParameter("bid");
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.upHit(bid);
		BoardDto dto=dao.table_view(bid);
		model.addAttribute("table_view", dto);
		
		return "/practice/table_view";
	}
	@RequestMapping("/practice/table_write_view")
	public String table_write_view( ) {
		return "/practice/table_write_view";
	}
	@RequestMapping("/practice/table_write")
	public String table_write(HttpServletRequest request) {
		String bname=request.getParameter("bname");
		String btitle=request.getParameter("btitle");
		String bcontent=request.getParameter("bcontent");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.table_write(bname, btitle, bcontent);
		
		return "redirect:table";
	}
	@RequestMapping(value="/practice/modify",method=RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model) {
		String bid=request.getParameter("bid");
		String bname=request.getParameter("bname");
		String btitle=request.getParameter("btitle");
		String bcontent=request.getParameter("bcontent");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.modify(bid, bname, btitle, bcontent);
		
		return "redirect:table";
	}
	@RequestMapping("/practice/delete")
	public String delete(HttpServletRequest request) {
		String bid=request.getParameter("bid");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.delete(bid);
		
		return "redirect:table";
	}
	@RequestMapping("/practice/table_reply_view")
	public String table_reply_view(HttpServletRequest request, Model model) {
		String bid=request.getParameter("bid");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		BoardDto dto=dao.table_reply_view(bid);
		model.addAttribute("table_reply_view", dto);
		
		return "/practice/table_reply_view";
	}
	@RequestMapping("practice/table_reply")
	public String table_reply(HttpServletRequest request) {
		String bid=request.getParameter("bid");
		String bname=request.getParameter("bname");
		String btitle=request.getParameter("btitle");
		String bcontent=request.getParameter("bcontent");
		String bgroup=request.getParameter("bgroup");
		String bstep=request.getParameter("bstep");
		String bindent=request.getParameter("bindent");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		dao.stepup(bgroup,bstep);
		dao.table_reply(bid, bname, btitle, bcontent, bgroup, bstep, bindent);
		
		return "redirect:table";
	}
	@RequestMapping("practice/contract")
	public String contract() {
		
		return "practice/contract";
	}
	@RequestMapping("practice/offercontract")
	public String offercontract() {
		
		return "practice/offercontract";
	}
}
