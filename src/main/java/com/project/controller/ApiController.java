package com.project.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.naver.service.WishListService;
import com.project.naver.dto.WishListDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private WishListService wishListService;
	
	@GetMapping("/main")
	public List<WishListDTO> main(String query) {
		log.info("푸드 카테고리별 맛집 요청"+query);
		//음식점 리스트 api 똑바로 가져오는지 확인용 코드(2줄)
		List<WishListDTO> list= wishListService.main(query);
		log.info("음식점 리스트"+list);
		return wishListService.main(query);
	}

	
	@GetMapping("/search")
	public List<WishListDTO> search(String query, Model model) {
		log.info("맛집 정보 검색 요청" + query);
		List<WishListDTO> srchList= wishListService.search(query);
		model.addAttribute("query", query);
		model.addAttribute("srchList", srchList);
		log.info("음식점 리스트"+srchList);
		return wishListService.search(query);
	}
}
