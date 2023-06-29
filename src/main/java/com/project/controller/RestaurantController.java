package com.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.ResultDTO;
import com.project.domain.ReviewDTO;
import com.project.service.ResultService;
import com.project.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	@Autowired
	private ResultService resultService;
	@Autowired
	private ReviewService reviewService;
	
		
	@GetMapping("/profile")
	public void profileGet(String restaurantName, Model model) {
		log.info("맛집 상세페이지 요청: " + restaurantName);
		ResultDTO result = resultService.result(restaurantName);
		model.addAttribute("result", result);	
		log.info("result"+result);
	}
	
	
	// 리뷰 보여주기
	@GetMapping("/list/{restauantId}")
	public List<ReviewDTO> reviewList(@PathVariable("restauantId") int restauantId){
		log.info("리뷰 요청" + restauantId);
		return reviewService.getList(restauantId);
	}
	
	// 특정 조회
	@GetMapping(value="/{reviewId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReviewDTO> get(@PathVariable int reviewId){
		log.info("댓글 조회 "+reviewId);
		return new ResponseEntity<ReviewDTO>(reviewService.read(reviewId), HttpStatus.OK);
	}
	
	// insert 작업
//	@PostMapping("/new")
//	public ResponseEntity<String> create(@RequestBody ReviewDTO movieDetailReplyDTO,Model model){
	@GetMapping("/new")
	public ResponseEntity<String> create(@RequestParam ReviewDTO movieDetailReplyDTO,Model model){
		log.info("댓글 삽입 "+movieDetailReplyDTO);
		
		model.addAttribute("dto", movieDetailReplyDTO);
		return reviewService.insert(movieDetailReplyDTO)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// update 작업
	@PutMapping("/{reviewId}")
	public ResponseEntity<String> modify(@RequestBody ReviewDTO movieDetailReplyDTO){
		log.info("댓글 수정 "+movieDetailReplyDTO);
		
		return reviewService.update(movieDetailReplyDTO)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// delete 작업
	@DeleteMapping("/{reviewId}")
	public ResponseEntity<String> remove(@PathVariable("reviewId") int reviewId){
		log.info("댓글 삭제 "+reviewId);
		return reviewService.delete(reviewId)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	
}









