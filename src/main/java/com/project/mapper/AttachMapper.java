package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.AttachFileDTO;
@Mapper
public interface AttachMapper {
	public int insert(AttachFileDTO dto);
	public List<AttachFileDTO> select(int postId);
	public int deleteAll(int postId);
	
	public List<AttachFileDTO> oldFiles();
}
