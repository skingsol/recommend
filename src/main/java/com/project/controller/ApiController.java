package com.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.domain.LoginDTO;
import com.project.domain.MemberAuthDTO;
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
	
	
	
	
	@GetMapping("/master")
	public String master(Model model) {
		
		List<RegisterRstrntDTO> list = reqService.listRequest();
		log.info("요청 목록 조회 ");

		//int total = rgService.getTotalCnt(cri);

		model.addAttribute("list", list);
		//model.addAttribute("pageDTO", new PageDTO(cri, total));
		return "master";
	}
	
	// http://localhost:8080/api/del/reqId
	@GetMapping({"/del/{reqId}"})
	public String readGet(@PathVariable("reqId") int reqId,Model model){
		log.info("등록요청 건 번호: "+reqId);
		
		//post_id 에 맞는 내용 가져오기
		RegisterRstrntDTO dto = reqService.readRequest(reqId);
		log.info("내용조회: "+dto);
		model.addAttribute("dto", dto);	
		
		return "del";
	}
	
	
//	// 등록요청 삭제(마스터 권한 - del 페이지)
//	@GetMapping("/delete")
//	public String deleteGet(int reqId) {
//		log.info("요청 삭제: "+reqId);
//		
//		reqService.deleteRequest(reqId);
//
//		return "master";			
//		}
	

	
	//서치페이지 내에서 맛집등록 요청 시 작동하는 컨트롤러
	@PostMapping("/search")
	//@PreAuthorize("principal.username == #dto.reqUser")
	public ResponseEntity<String> requestRegister(@RequestBody RegisterRstrntDTO dto, Principal pricipal , Model model) {
		log.info("맛집 등록 요청 내용: ", dto);
		 model.addAttribute("dto",dto);
		return reqService.sendRequest(dto)?
					new ResponseEntity<String>("success",HttpStatus.OK):
						new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	
}
