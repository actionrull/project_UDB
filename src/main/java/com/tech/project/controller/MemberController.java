package com.tech.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.project.command.DeleteIDCommand;
import com.tech.project.command.EmailCheckCommand;
import com.tech.project.command.FindPassCommand;
import com.tech.project.command.JoinCommand;
import com.tech.project.command.LoginCommand;
import com.tech.project.command.LogoutCommand;
import com.tech.project.command.MailConfirmCommand;
import com.tech.project.command.ReLoginCommand;
import com.tech.project.command.SCommand;
import com.tech.project.command.SetADDRCommand;
import com.tech.project.command.SetPWCommand;
import com.tech.project.command.SetTELCommand;
import com.tech.project.command.VCommand;
import com.tech.project.dao.NDao;
import com.tech.project.dto.AppMngDto;
import com.tech.project.dto.ApplicationDto;
import com.tech.project.dto.MDto;
import com.tech.project.dto.NoticeDto;
import com.tech.project.dto.ResumeDto;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;

	SCommand scommand;
	VCommand vcommand;

	// 홈 -> 마이페이지 -> 정보변경 -> 회원탈퇴 기능 구현
	@RequestMapping("member/deleteID")
	public String deleteID(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new DeleteIDCommand();
		String str = scommand.execute(model);

		return str;
	}

	// 홈 -> 마이페이지 -> 회원탈퇴 페이지로 이동
	@RequestMapping("member/deleteid_view")
	public String deleteid_view(Model model) {
		return "member/deleteid";
	}

	// 홈 -> 마이페이지 -> 전화번호 변경 페이지로 이동
	@RequestMapping("member/changetel_view")
	public String changetel_view(Model model) {
		return "member/changetel";
	}

	// 홈 -> 마이페이지 -> 전화번호 변경 기능 구현
	@RequestMapping("member/setTEL")
	public String setTEL(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new SetTELCommand();
		String str = scommand.execute(model);

		return str;
	}

	// 홈 -> 마이페이지 -> 주소변경 기능 구현
	@RequestMapping("member/setADDR")
	public String setADDR(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new SetADDRCommand();
		String str = scommand.execute(model);

		return str;
	}

	// 홈 -> 마이페이지 -> 주소 변경페이지로 이동
	@RequestMapping("member/changeaddr_view")
	public String changeaddr_view(Model model) {
		return "member/changeaddr";
	}

	// 홈 -> 마이페이지 -> 정보변경 -> 비밀번호 변경 후 다시 로그인 페이지로 이동
	@RequestMapping("member/reLogin")
	public String reLogin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		vcommand = new ReLoginCommand();
		vcommand.execute(model);

		return "member/login";
	}

	// 홈 -> 마이페이지 -> 정보변경 -> 비밀번호 변경 기능 구현
	@RequestMapping("member/setPW")
	public String setPW(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new SetPWCommand();
		String str = scommand.execute(model);

		return str;
	}

	// 홈 -> 마이페이지 -> 비밀번호 변경 페이지로 이동
	@RequestMapping("member/changepass_view")
	public String changeinfo_view(Model model) {
		return "member/changepass";
	}

	// 홈 -> 비밀번호 찾기 기능 구현
	@RequestMapping("member/findpass")
	public String lookupPW(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new FindPassCommand();
		String str = scommand.execute(model);

		return str;
	}

	// 로그인 화면 -> 비밀번호 찾기로 이동
	@RequestMapping("member/findpass_view")
	public String findpass(Model model) {
		return "/member/findpass";
	}

	// 홈 -> 개인회원 마이페이지로 이동
	@RequestMapping("member/mypage")
	public String mypage(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			// 마이페이지 이력서 수
			int totalresume = dao.totalresume(msid);
			model.addAttribute("totalresume", totalresume);
			// 마이페이지 이력서 공개여부
			String open = dao.resume_open(msid);
			model.addAttribute("open", open);
			// 마이페이지 지원 현황 수
			int appcount = dao.appcount(msid);
			model.addAttribute("appcount", appcount);
			// 마이페이지 이력서 열람 기업 수
			int checkresumecount = dao.recount(msid);
			model.addAttribute("rcount", checkresumecount);
			// 마이페이지 입사지원 요청 수
			int confirm = dao.getconfirm(msid);
			model.addAttribute("confirm", confirm);
			// 마이페이지 총 스크랩 수
			int totalpick = dao.totalpick(msid);
			if (totalpick >= 1) {
				model.addAttribute("totalpick", totalpick);
				// 마이페이지 스크랩 리스트
				ArrayList<NoticeDto> picknum = dao.redundancy_check(msid);
				ArrayList<NoticeDto> scrab = new ArrayList<NoticeDto>();
				for (int j = 0; j < picknum.size(); j++) {
					NoticeDto picker = dao.picklist(picknum.get(j).getNseq());
					scrab.add(picker);
				}
				model.addAttribute("scrab", scrab);
			}
			// 이력서 등록 여부 체크
			String check = dao.resume_check(msid);
			model.addAttribute("rcheck", check);
		}

		return "/member/mypage";
	}

	// 홈 -> 로그인페이지로 이동
	@RequestMapping("/login-view")
	public String loginView(Model model) {
		return "/member/login";
	}

	@RequestMapping("member/login-view")
	public String loginViewother(Model model) {
		return "/member/login";
	}

	// 홈 -> 회원가입페이지로 이동
	@RequestMapping("/join-view")
	public String joinView(Model model) {
		return "/member/join";
	}

	// 홈 => 회원가입 기능 구현
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new JoinCommand();
		String str = scommand.execute(model);
		if (str.equals("iddupl")) {
			model.addAttribute("idDupl", "이미 가입된 아이디입니다");
			return "/member/join";
		}
		if (str.equals("nndupl")) {
			model.addAttribute("nnDupl", "사용할 수 없는 닉네임입니다");
			return "/member/join";
		}
		return str;
	}

	// 홈 -> 회원가입 -> 이메일 확인 기능 구현
	@RequestMapping("emailCheck")
	public String emailCheck(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new EmailCheckCommand();
		scommand.execute(model);

		return "redirect:/";
	}

	// 홈 -> 로그인 기능 구현
	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new LoginCommand();
		String str = scommand.execute(model);
		model.addAttribute("url", "/");

		return str;
	}

	// 홈 -> 로그인 기능 구현
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String relogin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new LoginCommand();
		String str = scommand.execute(model);

		return str;
	}

	// 홈 -> 로그인 기능 구현
	@RequestMapping(value = "loginfail", method = RequestMethod.POST)
	public String loginfail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new LoginCommand();
		scommand.execute(model);

		return "/member/login";
	}

	// 홈 -> 로그아웃 기능 구현
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		scommand = new LogoutCommand();
		scommand.execute(model);

		return "redirect:/";
	}

	// 홈 -> 회원가입 -> 이메일 인증 기능 구현
	@RequestMapping("/mailConfirm")
	public String mailConfirm(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		vcommand = new MailConfirmCommand();
		vcommand.execute(model);

		return "/member/sendMail";
	}

	@RequestMapping("member/customer")
	public String customerpage() {
		return "/member/customer";
	}

	// 이력서 등록 화면
	@RequestMapping("member/resume")
	public String resume_view(Model model, HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		return "/member/resume";
	}

	// 이력서 등록
	@RequestMapping("member/resumeupload")
	public String resume_reg(HttpServletRequest request, HttpSession session) throws Exception {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		// 이력서 등록 경로
		String pathsource = this.getClass().getResource("").getPath();

		String path = pathsource.substring(1, pathsource.indexOf(".metadata"))
				+ "Project_UDB/src/main/webapp/resources/resume";
		String path2 = pathsource.substring(1, pathsource.indexOf("project_UDB")) + "project_UDB/resources/resume";

		// 이력서 등록여부 체크
		String check = dao.resume_check(msid);
		// 이력서 존재 시 덮어씌우기
		if (check != null) {
			File f = new File(path2 + "/" + check);
			File f2 = new File(path + "/" + check);
			if (f.exists()) {
				System.out.println("이력서 삭제");
				f.delete();
				f2.delete();
			}
			dao.resume_delete(msid);
		}
		// 이력서 지정 경로에 업로드
		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		String nfile = req.getFilesystemName("file");
		// db에 이력서 업로드
		dao.resume_reg(msid, nfile);

		return "redirect:mypage";
	}

	// 이력서 다운로드
	@RequestMapping("member/resume_download")
	public void resume_download(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		String msid = (String) session.getAttribute("memberID");
		if (msid != null) {
			NDao dao = sqlSession.getMapper(NDao.class);
			String rref = dao.resume_download(msid);
			if (rref != null) {
				response.setHeader("Content-Disposition", "Attachment;filename=" + URLEncoder.encode(rref, "utf-8"));

				String attachPath = "resources\\resume\\";
				String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + rref;

				FileInputStream fin = new FileInputStream(realPath);
				ServletOutputStream sout = response.getOutputStream();

				byte[] buf = new byte[1024];
				int size = 0;

				while ((size = fin.read(buf, 0, 1024)) != -1) {
					sout.write(buf, 0, size);
				}

				fin.close();
				sout.close();
			}
		}
	}

	// 이력서 공개전환
	@RequestMapping("member/resumeon")
	public String resumeon(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		// 이력서 등록 여부 체크
		String check = dao.resume_check(msid);
		// 이력서가 등록된 경우
		if (check != null) {
			// 이력서 공개칼럼(ropen) 값을 '1'로
			dao.resumeon(msid);
		}
		return "redirect:mypage";
	}

	// 이력서 비공개전환
	@RequestMapping("member/resumeoff")
	public String resumeoff(HttpSession session) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		dao.resumeoff(msid);

		return "redirect:mypage";
	}

	// 개인회원 정보수정
	@RequestMapping("member/infmod")
	public String infmod() {
		return "/member/infmod";
	}

	// 기업회원 지원자 관리
	@RequestMapping("member/appmanage")
	public String appmanage(HttpSession session, Model model) {
		String msid = (String) session.getAttribute("memberID");
		NDao dao = sqlSession.getMapper(NDao.class);
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);
			model.addAttribute("totalnoti", totalnoti);
		}
		ArrayList<MDto> appname = new ArrayList<MDto>();
		if (msid != null) {
			// 현재 로그인한 아이디가 등록한 공고 번호
			ArrayList<ApplicationDto> anseq = dao.getnotice(msid);
			for (int i = 0; i < anseq.size(); i++) {
				// 지원자가 있는지 체크
				ArrayList<ApplicationDto> appid = dao.getappcheck(anseq.get(i).getNseq());
				// 지원자가 있으면 글번호 글제목 지원자아이디 가져오기
				if (appid != null) {
					ArrayList<AppMngDto> appdto = dao.getapp(msid);
					// 지원자 정보 모델에 등록
					model.addAttribute("app", appdto);
				}

			}
		}

		return "/member/appmanage";
	}

	// 기업회원 지원자 이력서 다운로드
	@RequestMapping("member/resume_download_other")
	public void resume_download_other(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NDao dao = sqlSession.getMapper(NDao.class);
		String msid = request.getParameter("msid");
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		String rref = dao.resume_download(msid);
		// 이력서 다운로드
		if (rref != null) {
			response.setHeader("Content-Disposition", "Attachment;filename=" + URLEncoder.encode(rref, "utf-8"));

			String attachPath = "resources\\resume\\";
			String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + rref;

			FileInputStream fin = new FileInputStream(realPath);
			ServletOutputStream sout = response.getOutputStream();

			byte[] buf = new byte[1024];
			int size = 0;

			while ((size = fin.read(buf, 0, 1024)) != -1) {
				sout.write(buf, 0, size);
			}

			// 이력서 열람 여부 갱신
			dao.resume_novation(msid, nseq);

			fin.close();
			sout.close();
		}
	}

	// 기업회원 지원자 합격처리
	@RequestMapping("member/pass")
	public String pass(HttpServletRequest request) {
		NDao dao = sqlSession.getMapper(NDao.class);
		int nseq = Integer.parseInt(request.getParameter("c"));
		String msid = request.getParameter("p");
		// 지원 테이블의 합격여부를 '합격'으로
		dao.passapply(nseq, msid);

		return "redirect:/member/appmanage";
	}

	// 기업회원 지원자 불합격처리
	@RequestMapping("member/fail")
	public String fail(HttpServletRequest request) {
		NDao dao = sqlSession.getMapper(NDao.class);
		int nseq = Integer.parseInt(request.getParameter("c"));
		String msid = request.getParameter("p");
		// 지원 테이블의 합격여부를 '불합격'으로
		dao.failapply(nseq, msid);

		return "redirect:/member/appmanage";
	}

	// 기업회원 마이페이지
	@RequestMapping("member/corpage")
	public String corpage(HttpSession session, Model model) {
		NDao dao = sqlSession.getMapper(NDao.class);
		String msid = (String) session.getAttribute("memberID");
		if (msid != null) {
			int totalnoti = dao.totalnoti(msid);			
			model.addAttribute("totalnoti", totalnoti);
			
			int countnotice = dao.totalnoti_bymember(msid);
			model.addAttribute("count", countnotice);

			int countapply = dao.totalapply_bymember(msid);
			model.addAttribute("count2", countapply);
		}

		return "/member/corpage";
	}

	// 지원현황
	@RequestMapping("member/application")
	public String application(HttpSession session, Model model) {

		NDao dao = sqlSession.getMapper(NDao.class);
		String msid = (String) session.getAttribute("memberID");
		if (msid != null) {

			ArrayList<ApplicationDto> nseqlist = dao.selectnseq(msid);
			ArrayList<ApplicationDto> list = new ArrayList<ApplicationDto>();

			for (int i = 0; i < nseqlist.size(); i++) {
				System.out.println("지원서 번호 :" + nseqlist.get(i).getNseq());

				list.addAll((dao.applylist(nseqlist.get(i).getNseq())));
				System.out.println(i + "번 등록");
			}
			model.addAttribute("list", list);
		}

		return "member/application";
	}
}