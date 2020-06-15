package com.tech.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.project.dao.IDaoF;
import com.tech.project.dao.NDao;
import com.tech.project.dto.FreeDto;
import com.tech.project.dto.FreeReplyDto;
import com.tech.project.vopage.SearchVO;

@Controller
public class FreeController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "free/fList")
	public String fList(HttpServletRequest request, SearchVO searchVo, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

		}
		System.out.println("pass fList()");

		// search
		String ftitle = "";
		String fcontent = "";

		String[] type = request.getParameterValues("searchType");

		if (type != null) {
			for (String val : type) {
				if (val.equals("ftitle")) {
					model.addAttribute("ftitle", "true");
					ftitle = "ftitle";
				} else if (val.equals("fcontent")) {
					model.addAttribute("fcontent", "true");
					fcontent = "fcontent";
				}

			}
		}

		String searchKeyword = request.getParameter("sk");

		if (searchKeyword == null) {
			searchKeyword = "";
		}

		IDaoF daoF = sqlSession.getMapper(IDaoF.class);

		int total = 0;

		if (ftitle.equals("ftitle") && fcontent.equals("")) {
			total = daoF.selectSearchCount(searchKeyword, "1");
		} else if (ftitle.equals("") && fcontent.equals("fcontent")) {
			total = daoF.selectSearchCount(searchKeyword, "2");
		} else if (ftitle.equals("ftitle") && fcontent.equals("fcontent")) {
			total = daoF.selectSearchCount(searchKeyword, "3");
		} else if (ftitle.equals("") && fcontent.equals("")) {
			total = daoF.selectSearchCount(searchKeyword, "0");
		}

		model.addAttribute("total", total);
		model.addAttribute("searchKeyword", searchKeyword);

		String strPage = request.getParameter("page");

		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		System.out.println("strPage :" + strPage);

		int page = Integer.parseInt(strPage);
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

		if (ftitle.equals("ftitle") && fcontent.equals("")) {
			model.addAttribute("list", daoF.list(rowStart, rowEnd, searchKeyword, "1"));
			model.addAttribute("totoRowCnt", daoF.selectSearchCount(searchKeyword, "1"));
		} else if (ftitle.equals("") && fcontent.equals("fcontent")) {
			model.addAttribute("list", daoF.list(rowStart, rowEnd, searchKeyword, "2"));
			model.addAttribute("totoRowCnt", daoF.selectSearchCount(searchKeyword, "2"));
		} else if (ftitle.equals("ftitle") && fcontent.equals("fcontent")) {
			model.addAttribute("list", daoF.list(rowStart, rowEnd, searchKeyword, "3"));
			model.addAttribute("totoRowCnt", daoF.selectSearchCount(searchKeyword, "3"));
		} else if (ftitle.equals("") && fcontent.equals("")) {
			model.addAttribute("list", daoF.list(rowStart, rowEnd, searchKeyword, "0"));
			model.addAttribute("totoRowCnt", daoF.selectSearchCount(searchKeyword, "0"));
		}

		model.addAttribute("searchVo", searchVo);
		// model.addAttribute("list", daoF.list());

		return "free/fList";
	}

	@RequestMapping("free/fwrite_view")
	public String fwrite_view(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

		}
		System.out.println("pass fwrite_view()");

		return "free/fwrite_view";
	}

	@RequestMapping("free/fwrite")
	public String fwrite(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		System.out.println("pass fwrite()");

//		String attachPath="resources\\upload\\";
//		String uploadPath=request.getSession().getServletContext().getRealPath("/");
//		String path=uploadPath+attachPath;

		String path = this.getClass().getResource("").getPath();
		path = path.substring(1, path.indexOf(".metadata")) + "project_UDB/src/main/webapp/resources/upload";

		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		String ftitle = req.getParameter("ftitle");
//		String fwriter = req.getParameter("fwriter");
		String fwriter = (String) session.getAttribute("memberID");
		String fName = req.getFilesystemName("file");
		String fcontent = req.getParameter("fcontent");
		if (fName == null) {
			fName = "";

		}
		System.out.println("file :" + fName);

		IDaoF daoF = sqlSession.getMapper(IDaoF.class);
		daoF.write(ftitle, fwriter, fName, fcontent);

		return "redirect:../free/fList";
	}

	@RequestMapping("free/fcontent_view")
	public String fcontent_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

		}
		System.out.println("pass fcontent_view()");

		String fno = request.getParameter("fno");
		IDaoF daoF = sqlSession.getMapper(IDaoF.class);

		daoF.upHit(fno);
		FreeDto dto = daoF.contentView(fno);

		// 댓글 불러와보기
		ArrayList<FreeReplyDto> rdto = daoF.rcontentView(fno);

		model.addAttribute("frcontent_view", rdto);
		model.addAttribute("fcontent_view", dto);

		return "free/fcontent_view";
	}

	@RequestMapping("free/fmodify_view")
	public String fmodify_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

		}
		System.out.println("pass fmodify_view");

		String fno = request.getParameter("fno");
		IDaoF daoF = sqlSession.getMapper(IDaoF.class);

		FreeDto dto = daoF.modifyView(fno);
		model.addAttribute("fmodify_view", dto);

		return "free/fmodify_view";
	}

	@RequestMapping("free/fmodify")
	public String fmodify(HttpServletRequest request, Model model) {
		System.out.println("pass fmodify()");

		String fno = request.getParameter("fno");
		String ftitle = request.getParameter("ftitle");
		String fcontent = request.getParameter("fcontent");

		IDaoF daoF = sqlSession.getMapper(IDaoF.class);
		daoF.modify(fno, ftitle, fcontent);

		return "redirect:../free/fcontent_view?fno=" + fno;
	}

	@RequestMapping("free/fdelete")
	public String fdelete(HttpServletRequest request, Model model) {
		System.out.println("pass fdelete()");

		String fno = request.getParameter("fno");
		IDaoF daoF = sqlSession.getMapper(IDaoF.class);
		daoF.rdelete(fno);
		daoF.delete(fno);

		return "redirect:../free/fList";
	}

//	@RequestMapping(value = "free/freply_view")
//	public String freply_view(HttpServletRequest request,Model model) {
//		System.out.println("pass freply_view");
//		
//		String fno=request.getParameter("fno");
//		IDaoF daoF=sqlSession.getMapper(IDaoF.class);
//		FreeDto dto= daoF.replyView(fno);
//		model.addAttribute("freply_view", dto);
//		return "free/freply_view";
//	}

	@RequestMapping("free/freply")
	public String freply(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("pass freply()");

		String fno = request.getParameter("fno");

//		String frwriter = request.getParameter("frwriter");
		String frwriter = (String) session.getAttribute("memberID");
		String frcontent = request.getParameter("frcontent");

		System.out.println("frwriter:" + frwriter);

		IDaoF daoF = sqlSession.getMapper(IDaoF.class);

		daoF.rwrite(fno, frwriter, frcontent);

		return "redirect:../free/fcontent_view?fno=" + fno;
	}

//	@RequestMapping(value = "free/freply")
//	public String freply(HttpServletRequest request,Model model) {
//		System.out.println("pass freply()");
//		
//		String fno=request.getParameter("fno");
//		String freply=request.getParameter("freply");
//		String fgroup=request.getParameter("fgroup");
//		String fstep=request.getParameter("fstep");
//		String findent=request.getParameter("findent");
//		
//		IDaoF daoF=sqlSession.getMapper(IDaoF.class);
//		daoF.stepup(fgroup,fstep);
//		
//		daoF.reply(fno,freply);
//		
//		
//		//model.addAttribute("freply", dto);
//		
//		
//		
//		return "redirect:../free/fcontent_view?fno="+fno;
//	}
}
