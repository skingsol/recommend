package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.ms.dto.BringNaverApiDTO;
import com.project.service.BringNaverService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class HomeController {

	@Autowired
	private BringNaverService brService;
	
	@GetMapping("/")
	public String home(Model model) {
		log.info("메인 페이지 요청");		

		List<BringNaverApiDTO> list= brService.main("한식");
		
		log.info("음식점 리스트"+list);
		
		model.addAttribute("list", list);
		return "main"; 
	}
	


	

}
