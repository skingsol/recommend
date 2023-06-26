package com.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.ResultDTO;
import com.project.service.ResultService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	@Autowired
	private ResultService resultService;
	
		
	@GetMapping("/profile")
	public void profileGet(String restaurantName, Model model) {
		log.info("맛집 상세페이지 요청: " + restaurantName);
		ResultDTO result = resultService.result(restaurantName);
		model.addAttribute("result", result);	
		log.info("result"+result);
	}
	

	
	@GetMapping("/maintest")
	public void maintest() {
		log.info("홈 화면 테스트");
	}
	
}









