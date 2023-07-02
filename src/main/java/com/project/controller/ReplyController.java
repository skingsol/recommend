package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyPageDTO;
import com.project.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

// http://localhost:8080/replies/

@Slf4j
@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService reService;

	
	// http://localhost:8080/replies/1 + GET : 1번 댓글 데이터 가져오기
	@GetMapping(value="/{replyId}")
	public ResponseEntity<ReplyDTO> get(@PathVariable("replyId") Integer replyId){
		log.info("댓글 조회 "+replyId);
		
		return new ResponseEntity<ReplyDTO>(reService.read(replyId), HttpStatus.OK);
	}
	
	
	// http://localhost:8080/replies/new + POST + 입력데이터(json)
	@PostMapping("/new")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto){
		log.info("댓글 삽입 "+dto);
		
		return reService.insert(dto)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	// http://localhost:8080/replies/pages/bno/ + GET
	
	@GetMapping("/pages/{postId}/{page}")
	public ResponseEntity<ReplyPageDTO> select(@PathVariable("postId") Integer postId,@PathVariable("page")Integer page){
		log.info("댓글 조회 "+postId);
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<ReplyPageDTO>(reService.getList(cri,postId), HttpStatus.OK);
	}
	
	// http://localhost:8080/replies/rno + PUT + 수정데이터(json)
	
	@PutMapping("/{replyId}")
	@PreAuthorize("principal.username == #dto.replyer")
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto, @PathVariable("replyId") Integer replyId){
		log.info("댓글 수정 "+dto);
		dto.setReplyId(replyId);
		return reService.update(dto)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
		
	}
	
	// http://localhost:8080/replies/rno + DELETE : 댓글 삭제
	@DeleteMapping("/{replyId}")
	@PreAuthorize("principal.username == #dto.replyer")
	public ResponseEntity<String> remove(@PathVariable("replyId") Integer replyId,@RequestBody ReplyDTO dto){
		log.info("댓글 삭제 "+replyId);
		
		return reService.delete(replyId)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
		
	}
}








