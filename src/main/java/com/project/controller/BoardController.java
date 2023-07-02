package com.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AttachFileDTO;
import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	// 전체 리스트 보여주기 컨트롤러 작성 : list.jsp 보여주기 
	
	@GetMapping("/list")
	public void listGet(Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("전체 리스트 요청 ");
		log.info("type "+ Arrays.toString(cri.getTypeArr()));
		
		//사용자 요청한 번호에 맞는 게시물 목록 요청
		List<BoardDTO> list  = service.getList(cri);
		//전체 게시물 숫자
		int total = service.getTotalCnt(cri);
		
		model.addAttribute("list", list);	
		model.addAttribute("pageDTO", new PageDTO(cri, total));
	}
	
	// register.jsp 보여주기
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerGet() {
		log.info("글쓰기 폼 요청");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(BoardDTO dto,RedirectAttributes rttr,Criteria cri) {
		log.info("글쓰기 등록 요청 "+dto);
		
		//첨부파일 확인
//		if(dto.getAttachList() != null) {
//			dto.getAttachList().forEach(attach -> log.info(attach.toString()));
//		}		
		
		if(service.insert(dto)) {
			
			log.info("글 번호 : "+dto.getPostId());
			
			rttr.addFlashAttribute("result", dto.getPostId());
			//페이지 나누기 정보 주소줄에 같이 보내기
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/board/list";
		}
		return "/board/register"; 
	}
	
	//   http://localhost:8080/board/read?page=5&amount=10&bno=1
	//   http://localhost:8080/board/modify?page=5&amount=10&bno=1
	@GetMapping({"/read","/modify"})
	public void readGet(int postId,Model model,@ModelAttribute("cri") Criteria cri){
		log.info("내용 조회 "+postId);
		
		//post_id 에 맞는 내용 가져오기
		BoardDTO dto = service.getRow(postId);
		model.addAttribute("dto", dto);		
	}
	
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #dto.userid") // 로그인 사용자 == 작성자
	public String modifyPost(BoardDTO dto,RedirectAttributes rttr,Criteria cri) {
		log.info("내용 수정 "+cri);
		//성공 시 리스트
		service.update(dto);
		 
		rttr.addFlashAttribute("result", "수정이 완료되었습니다.");
		
		//페이지 나누기 정보 주소줄에 같이 보내기
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("amount", cri.getAmount());
		//검색 정보 주소줄에 보내기
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";		
	}
	
	// /board/remove?bno=21
	
	@GetMapping("/remove")
	@PreAuthorize("principal.username == #userid") // 로그인 사용자 == 작성자
	public String removeGet(int postId,String userid,RedirectAttributes rttr,Criteria cri) {
		
		//폴더에서 첨부 파일 제거
		List<AttachFileDTO> attachList = service.getAttachList(postId);
		deleteAttachFiles(attachList);
		
		//성공 시 리스트
		service.delete(postId);
		
		rttr.addFlashAttribute("result", "삭제가 완료되었습니다.");
		
		//페이지 나누기 정보 주소줄에 같이 보내기
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("amount", cri.getAmount());
		//검색 정보 주소줄에 보내기
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";		
	}
	
	// 첨부파일 가져오기(/getAttachList) + GET + post_id
	
	@GetMapping("/getAttachList")
	public ResponseEntity<List<AttachFileDTO>> attachList(int postId){
		List<AttachFileDTO> attachList = service.getAttachList(postId);
		
		return attachList!= null? new ResponseEntity<List<AttachFileDTO>>(attachList,HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	
	private void deleteAttachFiles(List<AttachFileDTO> attachList) {
		log.info("첨부 파일 폴더에서 제거");
		
		if(attachList == null || attachList.size() <= 0) return;
		
		for(AttachFileDTO dto : attachList) {
			// 파일 경로 
			Path path = Paths.get("c:\\upload\\"+dto.getUploadPath()+"\\"+dto.getUuid()+"_"+dto.getFileName());
			
			try {
				Files.deleteIfExists(path);
				
				// 이미지 파일인 경우 썸네일 제거
				if(Files.probeContentType(path).startsWith("image")) {
					Path thumb = Paths.get("c:\\upload\\"+dto.getUploadPath()+"\\s_"+dto.getUuid()+"_"+dto.getFileName());
					Files.deleteIfExists(thumb);
				}
				
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
	}
	
}










