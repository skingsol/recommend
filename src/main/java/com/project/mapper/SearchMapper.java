package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.SearchDTO;

@Mapper
public interface SearchMapper {
	public int insertSearchKeyword(SearchDTO dto);
	public int deleteSearchKeyword(int searchId);
	public int deleteAll();
	public List<SearchDTO> getRecentSearchKeywords();
	
}
