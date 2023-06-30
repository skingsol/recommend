package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.ms.dto.BringNaverApiDTO;
import com.project.service.BringNaverService;
import com.project.service.RegisterRstrntService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class HomeController {

	@Autowired
	private BringNaverService brService;
	@Autowired
	private RegisterRstrntService reqService;

	// 메인페이지 화면단 api 정보 가져오기
	@GetMapping("/")
	public String home(Model model) {
		log.info("메인 페이지 요청");

		List<BringNaverApiDTO> list = brService.main("한식");

		log.info("음식점 리스트" + list);

		model.addAttribute("list", list);
		return "main";
	}

//	// 서치페이지에서 맛집등록 요청 시 입력정보 DB insert 하기
//	@PostMapping("/api/search")
//	public String requsetReg(RegisterRstrntDTO dto) {
//		log.info("입력 정보: "+dto);
//
//			boolean flag = reqService.sendRequest(dto);
//		
//			return "/";
//		
//	}
}
