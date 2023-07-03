package com.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.project.service.StarService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	@Autowired
	private ResultService resultService;
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StarService stService;
	
	@GetMapping("/profile")
	public void profileGet(String restaurantName, Model model) {
		log.info("맛집 상세페이지 요청: " + restaurantName);
		ResultDTO result = resultService.result(restaurantName);
	//	int restaurantId
	//	double star = stService.starAvg(restaurantId);
		model.addAttribute("result", result);	
	//	model.addAttribute("star", star);
		log.info("result"+result);
	}
	
	// 카톡 공유기능 테스트용 컨트롤러(삭제예정)
	@GetMapping("/profile2")
	public void profileGet2(String restaurantName, Model model) {
		log.info("맛집 상세페이지 요청: " + restaurantName);
		ResultDTO result = resultService.result(restaurantName);
		model.addAttribute("result", result);	
		log.info("result"+result);
	}
	
	// 리뷰 보여주기
	@GetMapping("/list/{restauantId}")
	public ResponseEntity<List<ReviewDTO>> reviewList(@PathVariable("restauantId") int restauantId){
		log.info("리뷰 요청" + restauantId);
		return new ResponseEntity<List<ReviewDTO>>(reviewService.getList(restauantId), HttpStatus.OK);
	}
	
	// 특정 조회
	@GetMapping(value="/{reviewId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReviewDTO> get(@PathVariable int reviewId){
		log.info("댓글 조회 "+reviewId);
		return new ResponseEntity<ReviewDTO>(reviewService.read(reviewId), HttpStatus.OK);
	}
	
	// insert 작업
//	@PostMapping("/new")
//	public ResponseEntity<String> create(@RequestBody ReviewDTO ReviewDTO,Model model){
	@GetMapping("/new")
	public ResponseEntity<String> create(@ModelAttribute ReviewDTO ReviewDTO,Model model){
		log.info("댓글 삽입 "+ReviewDTO);
		
		model.addAttribute("dto", ReviewDTO);
		return reviewService.insert(ReviewDTO)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// update 작업
	@GetMapping("/update")
	public ResponseEntity<String> modify(@ModelAttribute ReviewDTO ReviewDTO){
		log.info("댓글 수정 "+ReviewDTO);
		
		return reviewService.update(ReviewDTO)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// delete 작업
	@GetMapping("/delete/{reviewId}")
	public ResponseEntity<String> remove(@PathVariable("reviewId") int reviewId){
		log.info("댓글 삭제 "+reviewId);
		return reviewService.delete(reviewId)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	
}









