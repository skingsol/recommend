package com.project.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.ms.dto.BringNaverApiDTO;
import com.project.service.BringNaverService;
import com.project.service.RegisterRstrntService;
import com.project.service.StarService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class HomeController {

	@Autowired
	private BringNaverService brService;
	@Autowired
	private RegisterRstrntService reqService;
//	@Autowired
//	private StarService stService;

	// 메인페이지 화면단 api 정보 가져오기
	@GetMapping("/")
	public String home(Model model) {
		log.info("메인 페이지 요청");

		List<BringNaverApiDTO> list = brService.main("한식");

		model.addAttribute("list", list);
		
		return "main";
	}

	// 등록요청 삭제(마스터 권한 - del 페이지)
	@GetMapping("/delete")
	public String deleteGet(int reqId, RedirectAttributes rttr) {
		log.info("요청 삭제: "+reqId);
		
		reqService.deleteRequest(reqId);
			rttr.addFlashAttribute("result", "삭제가 완료되었습니다.");
			
			return "redirect:/api/master";			
		}
}
