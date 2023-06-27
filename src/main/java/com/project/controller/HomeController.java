package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.project.domain.SearchDTO;
import com.project.naver.dto.WishListDTO;
import com.project.naver.service.WishListService;
import com.project.service.SearchService;

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

		List<WishListDTO> list= wishListService.search("한식");
		
		log.info("음식점 리스트"+list);
		
		model.addAttribute("list", list);
		return "main"; 
	}
	
	@GetMapping("/search")
	public String searchGet(SearchDTO search, Model model) {
		log.info("검색 결과 페이지 요청"+search);
		model.addAttribute("searchDTO", search);

		return "search"; 
	}

	

}