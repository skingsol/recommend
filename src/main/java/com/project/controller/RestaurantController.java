package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	@Autowired
	//private  service;
	
	//login.jsp 보여주는 컨트롤러 작성
	@GetMapping("/profile")
	public void profileGet() {
		log.info("맛집상세페이지 요청");
	}
}









