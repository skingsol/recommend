package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
@Mapper
public interface ReplyMapper {
	public ReplyDTO read(int rno);
	public int insert(ReplyDTO dto);
	public List<ReplyDTO> listAll(@Param("cri") Criteria cri,@Param("bno") int bno);
	public int getCountByBno(int bno);
	public int update(ReplyDTO dto);
	public int delete(int rno);
	public int deleteAll(int bno);
}


















