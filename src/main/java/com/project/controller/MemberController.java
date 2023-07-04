package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberAuthDTO;
import com.project.domain.ChangeDTO;
import com.project.domain.LoginDTO;
import com.project.domain.MemberDTO;
import com.project.mapper.MemberMapper;
import com.project.service.MemberService;
import com.project.service.MemberServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;

	
	// login.jsp 보여주는 컨트롤러 작성
	@GetMapping("/login")
	public void loginGet() {
		log.info("로그인 폼 요청");
	}

	// register_complete.jsp 보여주는
	@GetMapping("/registerComplete")
	public void registerCompleteGet() {
		log.info("회원가입 완료 폼 요청");
	}

	// mypage.jsp 보여주는
	@GetMapping("/mypage")
	public void mypageGet() {
		log.info("마이페이지 폼 요청");
	}

	// changePwd.jsp 보여주는
	@GetMapping("/changePwd")
	public void changePwdGet() {
		log.info("비밀번호 변경 페이지 요청 ");
	}

//	@PostMapping("/login")
//	public String loginPost(LoginDTO loginDTO,HttpSession session) {
//		log.info("로그인 요청 "+loginDTO);
//		
//		MemberAuthDTO memberAuthDTO = service.login(loginDTO);
//		
//		if(authDTO != null) {
//			//session 로그인 정보 담기
//			session.setAttribute("memberAuthDTO", memberAuthDTO);
//			//main 이동
//			return "redirect:/";			
//		}else {
//			return "redirect:/member/login";
//		}
//	}

	@GetMapping("/login-error")
	public String loginError(Model model) {

		model.addAttribute("error", "아이디나 비밀번호를 확인해 주세요");

		return "/member/login";
	}

//	@GetMapping("/logout")
//	public String logoutGet(HttpSession session) {
//		log.info("로그아웃 요청");
//		
//		session.removeAttribute("memberAuthDTO");
//		
//		//session 해제 main 이동
//		return "redirect:/main";
//	}

	@GetMapping("/step1")
	public void stepGet() {
		// member/step1.jsp 보여주기
		log.info("약관 페이지 보여주기");
	}

	@PostMapping("/step1")
	public String stepPost(boolean agree, RedirectAttributes rttr) {
		log.info("약관동의 " + agree);
		// true 인경우 register.jsp 보여주기
		if (agree)
			return "redirect:/member/register";
		// false 인 경우 step1.jsp 보여주기
		else {
			rttr.addFlashAttribute("check", false);
			return "redirect:/member/step1";
		}
	}

	@GetMapping("/register")
	public void registerGet() {
		log.info("회원가입 폼 요청 ");
	}

	@PostMapping("/register")
	public String registerPost(MemberDTO dto) {
		log.info("회원가입 요청 " + dto);

		// 회원가입 성공 시 성공 완료 화면
		if (service.register(dto)) {
			return "redirect:/member/registerComplete";
		} else {
			return "/member/register";
		}
	}

	// 중복 아이디
	@PostMapping("/dupId")
	@ResponseBody // 컨트롤러 작업이 완료될때 결과값으로 리턴시킴(뷰리졸버 동작시키지 않음)
	public String dupIdCheck(String userid) {
		log.info("중복 아이디 체크 " + userid);

		boolean idCheck = service.dupId(userid);

		if (idCheck) {
			return "true";
		} else {
			return "false";
		}
	}

	@GetMapping("/leave")
	public void leaveGet() {
		// leave.jsp 보여주기
		log.info("회원 탈퇴 페이지 요청 ");
	}

	// 회원탈퇴 성공 시 main 이동
	@PostMapping("/leave")
	public String leavePost(LoginDTO loginDTO, HttpSession session) {
		log.info("회원 탈퇴 요청 ");

		if (service.remove(loginDTO)) {
			session.invalidate();
			return "redirect:/";
		}
		return "redirect:/member/leave";
	}

	@PostMapping("/changePwd")
	public String changePwdPost(ChangeDTO changeDTO, HttpSession session) {
		log.info("비밀번호 변경 요청 " + changeDTO);

		if (changeDTO.passwordEquals()) {
			// 현재 비밀번호 일치 확인
			// true : 비밀번호 변경 ==> session 제거 ==> 로그인 페이지 보여주기
			// false : 비밀번호변경 페이지 보여주기

			if (service.update(changeDTO)) {
				session.invalidate();
				return "redirect:/member/login";
			}
		}
		return "redirect:/member/changePwd";
	}

	@GetMapping("/admin")
	public void adminGet() {
		log.info("admin 요청");
	}

	@GetMapping("/auth")
	@ResponseBody
	public Authentication auth() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	@GetMapping("/login-success")
	public String loginSuccess(Model model) {
		// 로그인 성공 시 처리할 로직 작성
		return "redirect:/"; // 로그인 성공 후 이동할 페이지 지정
	}

	@GetMapping("/login-error2")
	public String loginError2(Model model) {
		// 로그인 실패 시 처리할 로직 작성
		return "redirect:/member/login"; // 로그인 실패 후 이동할 페이지 지정
	}

	
	@PostMapping("/update")
	public String updateMember(MemberDTO memberDTO) {
		log.info("회원 정보 수정 요청 "+memberDTO);

		 service.updateMember(memberDTO);
		 
		return "redirect:/";
	}

}
