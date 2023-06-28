package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.naver.dto.WishListDTO;
import com.project.naver.service.WishListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class HomeController {

	@Autowired
	private WishListService wishListService;
	
	@GetMapping("/")
	public String home(Model model) {
		log.info("메인 페이지 요청");		

		List<WishListDTO> list= wishListService.main("한식");
		
		log.info("음식점 리스트"+list);
		
		model.addAttribute("list", list);
		return "main"; 
	}
	


	

}
