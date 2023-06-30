package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.RegisterRstrntDTO;
import com.project.ms.dto.BringNaverApiDTO;
import com.project.service.BringNaverService;
import com.project.service.RegisterRstrntService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private BringNaverService brService;
	
	@Autowired
	private RegisterRstrntService reqService;
	
	
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
	
	
	//서치페이지 내에서 맛집등록 요청 시 작동하는 컨트롤러
	@PostMapping("/search")
	//@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> requestRegister(@RequestBody RegisterRstrntDTO dto) {
		log.info("맛집 등록 요청 내용: ", dto);
		
		return reqService.sendRequest(dto)?
					new ResponseEntity<String>("success",HttpStatus.OK):
						new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	// http://localhost:8080/api/search/req/1 + GET : 1번 등록요청글 내용 가져오기
	@GetMapping(value="/search/req/{reqId}")
	//@PreAuthorize("isAuthenticated()")
	public ResponseEntity<RegisterRstrntDTO> readRequest(@PathVariable("reqId") int reqId){
		log.info("댓글 조회"+reqId);
		return new ResponseEntity<RegisterRstrntDTO>(reqService.readRequest(reqId), HttpStatus.OK);
	}
	
}
