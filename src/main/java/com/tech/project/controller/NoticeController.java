package com.tech.project.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.tech.project.dao.NDao;
import com.tech.project.dto.NoticeDto;
import com.tech.project.vopage.SearchVO;

@Controller
public class NoticeController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/notice/notice")
	public String notice(Model model, HttpServletRequest request, HttpSession session, SearchVO searchVo) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}

		String strPage = request.getParameter("page");
		String ordertype = (String) session.getAttribute("order");
		if (ordertype == null) {
			ordertype = "1";
		}
		if (strPage == null) {
			strPage = "1";
		}

		int page = Integer.parseInt(strPage);
		searchVo.setPage(page);

		int total = dao.selectBoardCount();
		searchVo.pageCalculate(total);

		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();

		if (ordertype.equals("1"))
			model.addAttribute("list", dao.list(rowStart, rowEnd));
		else if (ordertype.equals("2"))
			model.addAttribute("list", dao.list2(rowStart, rowEnd));
		else if (ordertype.equals("3"))
			model.addAttribute("list", dao.list3(rowStart, rowEnd));
		else if (ordertype.equals("4"))
			model.addAttribute("list", dao.list4(rowStart, rowEnd));

		model.addAttribute("totalcnt", total);
		model.addAttribute("searchVo", searchVo);

		return "/notice/notice";
	}

	@RequestMapping("/notice/ordercheck")
	public String ordercheck(HttpServletRequest request, HttpSession session) {
		String ordertype = request.getParameter("ot");

		session.setAttribute("order", ordertype);

		return "redirect:notice";
	}

	@RequestMapping("/notice/previewon")
	public String previewon(HttpSession session, HttpServletRequest request, SearchVO searchVo) {
//		마감일까지 남은 날짜 구하기
		String dday = request.getParameter("dday");
		String now = request.getParameter("now");
		if (dday.isEmpty()) {
			session.setAttribute("lefttime", "");
		} else {
			Date d = Date.valueOf(dday);
			Date n = Date.valueOf(now);

			long left = d.getTime() - n.getTime();
			int time = (int) (Math.floor(left) / (1000 * 60 * 60 * 24) + 1);
			String day = time + "일 남음";

			session.setAttribute("lefttime", day);
		}

		String pn = request.getParameter("pn");
		session.setAttribute("preview", pn);

		String strpage = request.getParameter("remainpage");

		return "redirect:notice?page=" + strpage;
	}

	@RequestMapping("/notice/previewoff")
	public String previewoff(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("preview");
		String strpage = request.getParameter("remainpage");

		return "redirect:notice?page=" + strpage;
	}

	@RequestMapping("/notice/content_view")
	public String content_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

		}
		String nseq = request.getParameter("c");
		if (nseq != null) {
			dao.uphit(nseq);
		}
		NoticeDto dto = dao.content_view(nseq);
		model.addAttribute("content_view", dto);

		if (session.getAttribute("pickcheck") != null) {
			session.removeAttribute("pickcheck");
		}
		if (msid != null) {
			ArrayList<NoticeDto> dtos = dao.redundancy_check(msid);
			for (int i = 0; i < dtos.size(); i++) {
				if (dtos.get(i).getNseq() == Integer.parseInt(nseq)) {
					session.setAttribute("pickcheck", 1);
				}
			}
		}

		return "/notice/content_view";
	}

	@RequestMapping("/notice/pickitem")
	public String pickitem(HttpServletRequest request, Model model, HttpSession session) {
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		String msid = request.getParameter("msid");
		if (session.getAttribute("pickcheck") != null) {
			session.removeAttribute("pickcheck");
		}
		NDao dao = sqlSession.getMapper(NDao.class);
		ArrayList<NoticeDto> dto = dao.redundancy_check(msid);
		for (int i = 0; i < dto.size(); i++) {
			if (dto.get(i).getNseq() == nseq) {
				session.setAttribute("pickcheck", 1);
				return "redirect:content_view?c=" + nseq;
			}
		}
		dao.pickitem(msid, nseq);
		session.setAttribute("pickcheck", 1);
		return "redirect:content_view?c=" + nseq;
	}

	@RequestMapping("/notice/deletepickitem")
	public String deletepickitem(HttpServletRequest request, HttpSession session) {
		int nseq;
		if (request.getParameter("nseq") == null) {
			nseq = 0;
		} else {
			nseq = Integer.parseInt(request.getParameter("nseq"));
		}
		NDao dao = sqlSession.getMapper(NDao.class);
		dao.deletepickitem(nseq);
		session.removeAttribute("pickcheck");
		return "redirect:content_view?c=" + nseq;
	}

	@RequestMapping("/notice/write_view")
	public String write_view() {

		return "/notice/write_view";
	}

	@RequestMapping("/notice/write")
	public String write(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String msid = (String) session.getAttribute("memberID");
		
		String attachPath = "resources\\uploadimg\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		System.out.println("업로드 경로 : " + path);
		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());
		String ntitle = req.getParameter("ntitle");
		String ncontent = req.getParameter("ncontent");
		String naddr = req.getParameter("naddr");
		String nlocation = req.getParameter("nlocation");
		String nnearsub = req.getParameter("nnearsub");
		String npersonnel = req.getParameter("npersonnel");
		String ndeadline = req.getParameter("ndeadline");
		String ncategory = req.getParameter("ncategory");
		String nwelfare = req.getParameter("nwelfare");
		if (nwelfare==null) {
			nwelfare="없음";
		}
		String nwriter = req.getParameter("nwriter");
		String nreception = req.getParameter("nreception");
		String nperiod = req.getParameter("nperiod");
		String nday = req.getParameter("nday");
		String ntime = req.getParameter("ntime");
		String ntpay = req.getParameter("ntpay");
		int npay = Integer.parseInt(req.getParameter("npay"));
		String ngender = req.getParameter("ngender");
		String nage = req.getParameter("nage");
		String nag = req.getParameter("nag");
		if(nag==null) {
			nag="0";
		}
		String npt = req.getParameter("npt");
		if(npt==null) {
			npt="없음";
		}
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		String nimg = req.getFilesystemName("nimg");
		if (nimg == null) {
			nimg = "";
		}

		NDao dao = sqlSession.getMapper(NDao.class);
		dao.write(ntitle, ncontent, naddr, nlocation, nnearsub, nimg, npersonnel, ndeadline, ncategory, nwelfare,
				nwriter, nreception, nperiod, nday, ntime, ntpay, npay, ngender, nage, nag, npt, lat, lng, msid);

		return "redirect:nmanage";
	}

	@RequestMapping("/notice/delete")
	public String delete(HttpServletRequest request, Model model) {
		NDao dao = sqlSession.getMapper(NDao.class);
		String nseq = request.getParameter("nseq");

		String filePath = "resources\\uploadimg\\";
		String deletePath = request.getSession().getServletContext().getRealPath("/");
		String path = deletePath + filePath;
		String filename = dao.getimgname(nseq);

		File deleteFile = new File(path + "/" + filename);

		if (deleteFile.exists()) {

			deleteFile.delete();

			System.out.println("파일삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		System.out.println("file : " + deleteFile);
		dao.delete(nseq);

		return "redirect:notice";
	}

	@RequestMapping("/notice/modify_view")
	public String modify_view(HttpServletRequest request, Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

		}

		String nseq = request.getParameter("nseq");

		NoticeDto dto = dao.modify_view(nseq);
		model.addAttribute("modify_view", dto);

		return "/notice/modify_view";
	}

	@RequestMapping("/notice/modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {

		String attachPath = "resources\\uploadimg\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		String nseq = req.getParameter("nseq");
		String ntitle = req.getParameter("ntitle");
		String ncontent = req.getParameter("ncontent");
		String naddr = req.getParameter("naddr");
		String nlocation = req.getParameter("nlocation");
		String nnearsub = req.getParameter("nnearsub");
		String npersonnel = req.getParameter("npersonnel");
		String ndeadline = req.getParameter("ndeadline");
		String ncategory = req.getParameter("ncategory");
		String nwelfare = req.getParameter("nwelfare");
		String nwriter = req.getParameter("nwriter");
		String nreception = req.getParameter("nreception");
		String nperiod = req.getParameter("nperiod");
		String nday = req.getParameter("nday");
		String ntime = req.getParameter("ntime");
		String ntpay = req.getParameter("ntpay");
		int npay = Integer.parseInt(req.getParameter("npay"));
		String ngender = req.getParameter("ngender");
		String nage = req.getParameter("nage");
		String nag = req.getParameter("nag");
		String npt = req.getParameter("npt");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		String nregdate = req.getParameter("nregdate");
		String nimg = req.getFilesystemName("nimg");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (nimg == null) {
			nimg = dao.getimgname(nseq);
			if (dao.getimgname(nseq) == null) {
				nimg = "";
			}
		} else {
			String filename = dao.getimgname(nseq);
			File deleteFile = new File(path + "/" + filename);
			if (deleteFile.exists()) {
				deleteFile.delete();
			}
		}

		dao.modify(nseq, ntitle, ncontent, naddr, nlocation, nnearsub, nimg, npersonnel, ndeadline, ncategory, nwelfare,
				nwriter, nreception, nperiod, nday, ntime, ntpay, npay, ngender, nage, nag, npt, lat, lng, nregdate);

		return "redirect:../notice/content_view?c=" + nseq;
	}

	@RequestMapping("/notice/nmanage")
	public String nmanage(HttpSession session, Model model, HttpServletRequest request) {
		String msid = (String) session.getAttribute("memberID");
		String nseq = request.getParameter("nseq");
		String nregdate = request.getParameter("nregdate");
		NDao dao = sqlSession.getMapper(NDao.class);

		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);

			ArrayList<NoticeDto> ncheck = dao.noti_check(msid, nseq);
			model.addAttribute("ncheck", ncheck);

			ArrayList<NoticeDto> nmanage = dao.nmanage(msid, nseq, nregdate);
			model.addAttribute("nmanage", nmanage);

		}

		return "/notice/nmanage";
	}

//	//공개 비공개
//		@RequestMapping("notice/notion")
//		public String notion(HttpSession session,Model model) {
//			String msid = (String) session.getAttribute("memberID");
//			NDao dao = sqlSession.getMapper(NDao.class);
//			
//			ArrayList<NoticeDto> check = dao.noti_check(msid);
//			
//			if (check!=null) {
//				dao.notion(msid);
//			}		
//			return "redirect:nmanage";
//		}
//		@RequestMapping("notice/notioff")
//		public String notioff(HttpSession session) {
//			String msid = (String) session.getAttribute("memberID");
//			NDao dao = sqlSession.getMapper(NDao.class);
//			dao.notioff(msid);
//			
//			return "redirect:nmanage";
//		}

	// 지원버튼 클릭
	@RequestMapping("/notice/apply")
	public String apply(HttpServletRequest request, HttpSession session) {
		NDao dao = sqlSession.getMapper(NDao.class);
		String msid = (String) session.getAttribute("memberID");
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		// 중복 지원 체크
		int count = dao.redundancy_check_apply(msid, nseq);
		if (count <= 0) {
			// 지원 등록
			dao.apply(msid, nseq);
		}

		return "redirect:../notice/content_view?c=" + nseq;
	}

	// 프리미엄 등록
	@RequestMapping("/notice/premium")
	public String premium(HttpServletRequest request) {
		NDao dao = sqlSession.getMapper(NDao.class);
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		dao.getpremium(nseq);

		return "redirect:nmanage";
	}
}
