package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.ms.dto.BringNaverApiDTO;
import com.project.service.BringNaverService;


import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private BringNaverService brService;
	
	// 메인에서 카테고리 클릭 시 작동하는 컨트롤러
	@GetMapping("/main")
	@ResponseBody
	public List<BringNaverApiDTO> main(String query) {
		log.info("푸드 카테고리별 맛집 요청"+query);
		
		return brService.main(query);
	}

	// 서치페이지에서 작동하는 컨트롤러(메인에서 검색 시에도 작동)
	@GetMapping("/search")
	public  String search(String query, Model model) {
		log.info("맛집 정보 검색 요청" + query);
		
		List<BringNaverApiDTO> srchList= brService.search(query);
		
		model.addAttribute("query", query);
		model.addAttribute("srchList", srchList);
		
		if(srchList.isEmpty()) return "recheck";
		
		return "search";
	}
}
