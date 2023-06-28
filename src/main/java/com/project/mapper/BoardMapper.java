package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
@Mapper 
public interface BoardMapper {
	public List<BoardDTO> list(Criteria cri);
	public int insert(BoardDTO dto);
	public BoardDTO get(int bno);
	public int update(BoardDTO dto);
	public int delete(int bno);
	public int totalCnt(Criteria cri);
	public int updateReplyCnt(@Param("bno")int bno, @Param("amount")int amount);
	
	//상세조회 + 파일정보
	public BoardDTO readAttach(int bno);
}
