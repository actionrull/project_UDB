package com.tech.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.project.dao.IDaoI;
import com.tech.project.dao.NDao;
import com.tech.project.dto.InformDto;
import com.tech.project.vopage.SearchVO;

@Controller
public class InformController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("inform/iList")
	public String iList(HttpServletRequest request, SearchVO searchVo, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass iList()");

		// 페이징
		String strPage = request.getParameter("page");
		System.out.println("strPage :" + strPage);
		if (strPage == null) {
			strPage = "1";
		}
		System.out.println("strPage :" + strPage);

		int page = Integer.parseInt(strPage);
		searchVo.setPage(page);

		IDaoI daoI = sqlSession.getMapper(IDaoI.class);

		int total = daoI.selectInformCount();// 전체 글의 갯수를 알기 위한 메소드
		System.out.println("total :" + total);
		searchVo.pageCalculate(total);

		System.out.println("==================");
		System.out.println("clickPage :" + searchVo.getPage());// 잘 전달 됐는지 확인
		System.out.println("pageStart :" + searchVo.getPageStart());// 잘 전달 됐는지 확인
		System.out.println("pageEnd :" + searchVo.getPageEnd());// 잘 전달 됐는지 확인
		System.out.println("pageTot :" + searchVo.getTotPage());// 잘 전달 됐는지 확인
		System.out.println("rowStart :" + searchVo.getRowStart());// 잘 전달 됐는지 확인
		System.out.println("rowEnd :" + searchVo.getRowEnd());// 잘 전달 됐는지 확인

		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();

		model.addAttribute("totalcnt", total);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("list", daoI.list(rowStart, rowEnd));

		return "inform/iList";
	}

	@RequestMapping("inform/iwrite_view")
	public String iwrite_view(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass iwrite_view()");

		return "inform/iwrite_view";
	}

	@RequestMapping("inform/iwrite")
	public String iwrite(HttpServletRequest request, Model model) throws Exception {
		System.out.println("pass iwrite()");

		String path = this.getClass().getResource("").getPath();
		path = path.substring(1, path.indexOf(".metadata")) + "project_UDB/src/main/webapp/resources/upload";

		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		String ititle = req.getParameter("ititle");
		String icontent = req.getParameter("icontent");
		String iName = req.getFilesystemName("file");
		if (iName == null) {
			iName = "";
		}

		IDaoI daoI = sqlSession.getMapper(IDaoI.class);
		daoI.write(ititle, icontent, iName);

		return "redirect:../inform/iList";
	}

	@RequestMapping("inform/icontent_view")
	public String icontent_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass icontent_view()");

		String ino = request.getParameter("ino");
		IDaoI daoI = sqlSession.getMapper(IDaoI.class);

		daoI.upHit(ino);
		InformDto dto = daoI.contentView(ino);
		model.addAttribute("icontent_view", dto);

		return "inform/icontent_view";
	}

	@RequestMapping("inform/imodify_view")
	public String imodify_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		System.out.println("pass imodify_view()");

		String ino = request.getParameter("ino");
		IDaoI daoI = sqlSession.getMapper(IDaoI.class);

		InformDto dto = daoI.modifyView(ino);
		model.addAttribute("imodify_view", dto);

		return "inform/imodify_view";
	}

	@RequestMapping("inform/imodify")
	public String imodify(HttpServletRequest request, Model model) {
		System.out.println("pass imodify()");

		String ino = request.getParameter("ino");
		String ititle = request.getParameter("ititle");
		String icontent = request.getParameter("icontent");

		IDaoI daoI = sqlSession.getMapper(IDaoI.class);
		daoI.modify(ino, ititle, icontent);

		return "redirect:../inform/icontent_view?ino=" + ino;
	}

	@RequestMapping("inform/idelete")
	public String idelete(HttpServletRequest request, Model model) {
		System.out.println("pass idelete()");

		String ino = request.getParameter("ino");
		IDaoI daoI = sqlSession.getMapper(IDaoI.class);
		daoI.delete(ino);

		return "redirect:../inform/iList";
	}
}
