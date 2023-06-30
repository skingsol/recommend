package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyPageDTO;
import com.project.mapper.BoardMapper;
import com.project.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper reMapper;
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public ReplyDTO read(int replyId) {		
		return reMapper.read(replyId);
	}

	@Transactional
	@Override
	public boolean insert(ReplyDTO dto) {
		//댓글 수 추가
		mapper.updateReplyCnt(dto.getPostId(), 1);
		//댓글 등록
		return reMapper.insert(dto)==1?true:false;
	}

	@Override
	public ReplyPageDTO getList(Criteria cri,int postId) {		
		List<ReplyDTO> list = reMapper.listAll(cri,postId);
		int replyCnt = reMapper.getCountBypostId(postId);
		return new ReplyPageDTO(replyCnt, list);
	}

	@Override
	public boolean update(ReplyDTO dto) {		
		return reMapper.update(dto)==1?true:false;
	}

	@Transactional
	@Override
	public boolean delete(int replyId) {	
		
		ReplyDTO dto = reMapper.read(replyId);
		
		// 댓글 수 차감
		mapper.updateReplyCnt(dto.getPostId(), -1);
		// 댓글 제거
		return reMapper.delete(replyId)==1?true:false;
	}

}












