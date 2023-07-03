package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class WishListController {
	
	//위시리스트 목록
	@GetMapping("/wishlist")
	public void wishList() {
		log.info("wishlist 페이지 요청");		
	}

}
