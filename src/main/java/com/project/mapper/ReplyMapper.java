package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
@Mapper
public interface ReplyMapper {
	public ReplyDTO read(int replyId);
	public int insert(ReplyDTO dto);
	public List<ReplyDTO> listAll(@Param("cri") Criteria cri,@Param("postId") int postId);
	public int getCountBypostId(int postId);
	public int update(ReplyDTO dto);
	public int delete(int replyId);
	public int deleteAll(int postId);
}


















