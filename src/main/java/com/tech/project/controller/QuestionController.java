package com.tech.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.project.dao.IDaoQ;
import com.tech.project.dao.NDao;
import com.tech.project.dto.QuestionDto;
import com.tech.project.vopage.SearchVO;

@Controller
public class QuestionController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("question/qList")
	public String qList(HttpServletRequest request, SearchVO searchVo, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass qList()");

		String qtype = request.getParameter("qtype");
		if (qtype == null) {
			qtype = "";
		}

		if (qtype.equals("all")) {
			model.addAttribute("all", "true");
		} else if (qtype.equals("modi")) {
			model.addAttribute("modi", "true");
		} else if (qtype.equals("service")) {
			model.addAttribute("service", "true");
		} else if (qtype.equals("insert")) {
			model.addAttribute("insert", "true");
		} else if (qtype.equals("write")) {
			model.addAttribute("write", "true");
		}

		System.out.println("qtype:" + qtype);
//		if (type!=null) {
//			for (int i = 0; i < type.length; i++) {
//				System.out.println("type :"+type[i]);
//			}
//		}
		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);

		int total = 0;

		if (qtype.equals("") || qtype.equals("all")) {
			total = daoQ.selectCount(qtype, "1");
		} else if (qtype.equals("modi") || qtype.equals("service") || qtype.equals("insert") || qtype.equals("write")) {
			total = daoQ.selectCount(qtype, "2");

		}

		System.out.println("total:" + total);

		String strPage = request.getParameter("page");

		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		System.out.println("strPage :" + strPage);

		int page = Integer.parseInt(strPage);
		searchVo.setPage(page);
		searchVo.pageCalculate(total);

		System.out.println("==============");
		System.out.println("clickPage : " + searchVo.getPage());
		System.out.println("pageStart : " + searchVo.getPageStart());
		System.out.println("pageEnd : " + searchVo.getPageEnd());
		System.out.println("pageTot : " + searchVo.getTotPage());
		System.out.println("rowStart : " + searchVo.getRowStart());
		System.out.println("rowEnd : " + searchVo.getRowEnd());

		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();

		if (qtype.equals("") || qtype.equals("all")) {
			model.addAttribute("list", daoQ.list(rowStart, rowEnd, qtype, "1"));
			// total=daoQ.selectCount(qtype,"1");
		} else if (qtype.equals("modi") || qtype.equals("service") || qtype.equals("insert") || qtype.equals("write")) {
			model.addAttribute("list", daoQ.list(rowStart, rowEnd, qtype, "2"));
		}

		model.addAttribute("searchVo", searchVo);

		// ArrayList<QuestionDto> dto=daoQ.list(qtype);
		// model.addAttribute("list", dto);

		return "question/qList";
	}

	@RequestMapping("question/qwrite_view")
	public String qwrite_view(Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass qwrite_view");
		return "question/qwrite_view";
	}

	@RequestMapping("question/qwrite")
	public String qwrite(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("pass qwrite()");

		String qtitle = request.getParameter("qtitle");
//		String qwriter=request.getParameter("qwriter");
		String qwriter = (String) session.getAttribute("memberID");
		String qcontent = request.getParameter("qcontent");
		String qtype = request.getParameter("qtype");
		System.out.println("qtype :" + qtype);

//		if (qtype!=null) {
//			for (int i = 0; i < qtype.length; i++) {
//				System.out.println("qtype :"+qtype[i]);
//			}
//		}
		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);
		daoQ.write(qtitle, qwriter, qcontent, qtype);

		return "redirect:../question/qList";
	}

	@RequestMapping("question/qcontent_view")
	public String qcontent_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass qcontent_view()");

		String qno = request.getParameter("qno");

		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);
		daoQ.upHit(qno);
		QuestionDto dto = daoQ.contentView(qno);

		model.addAttribute("qcontent_view", dto);

		return "question/qcontent_view";
	}

	@RequestMapping("question/qmodify_view")
	public String qmodify_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass qmodify_view()");

		String qno = request.getParameter("qno");

		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);

		QuestionDto dto = daoQ.modifyView(qno);
		model.addAttribute("qmodify_view", dto);

		return "question/qmodify_view";
	}

	@RequestMapping("question/qmodify")
	public String qmodify(HttpServletRequest request, Model model) {
		System.out.println("pass qmodify()");

		String qno = request.getParameter("qno");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");

		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);

		daoQ.modify(qno, qtitle, qcontent);

		return "redirect:../question/qcontent_view?qno=" + qno;
	}

	@RequestMapping("question/qdelete")
	public String qdelete(HttpServletRequest request, Model model) {
		System.out.println("pass qdelete()");

		String qno = request.getParameter("qno");
		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);
		daoQ.delete(qno);

		return "redirect:../question/qList";
	}

	@RequestMapping("question/qreply_view")
	public String qreply_view(HttpServletRequest request, Model model) {
		System.out.println("pass qreply_view");

		String qno = request.getParameter("qno");

		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);
		QuestionDto dto = daoQ.replyView(qno);
		model.addAttribute("qreply_view", dto);

		return "question/qreply_view";
	}

	@RequestMapping("question/qreply")
	public String qreply(HttpServletRequest request, Model model) {
		System.out.println("pass qreply()");

		String qno = request.getParameter("qno");
		String qtype = request.getParameter("qtype");
		String qcontent = request.getParameter("qcontent");
		String qrcontent = request.getParameter("qrcontent");
		String qgroup = request.getParameter("qgroup");
		String qstep = request.getParameter("qstep");
		String qindent = request.getParameter("qindent");
		String qtitle = request.getParameter("qtitle");

		IDaoQ daoQ = sqlSession.getMapper(IDaoQ.class);
		daoQ.stepup(qgroup, qstep);
		daoQ.reply(qno, qtype, qcontent, qrcontent, qgroup, qstep, qindent, qtitle);

		return "redirect:../question/qList";
	}
}
