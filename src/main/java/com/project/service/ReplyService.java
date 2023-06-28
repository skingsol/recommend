package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyPageDTO;

public interface ReplyService {
	public ReplyDTO read(int rno);
	public boolean insert(ReplyDTO dto);
	//댓글 목록만 처리
	//public List<ReplyDTO> getList(Criteria cri, int bno);
	
	//댓글 총 수, 댓글 목록 처리
	public ReplyPageDTO getList(Criteria cri, int bno);
	public boolean update(ReplyDTO dto);
	public boolean delete(int rno);
}
