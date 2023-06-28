package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.SearchDTO;
import com.project.mapper.SearchMapper;
@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;

	@Override
	public boolean insertSearchKeyword(SearchDTO dto) {
		return mapper.insertSearchKeyword(dto)==1?true:false;
	}

	@Override
	public boolean deleteAll() {
		return mapper.deleteAll()==1?true:false;
	}

	@Override
	public List<SearchDTO> getRecentSearchKeywords() {
		return mapper.getRecentSearchKeywords();
	}

	@Override
	public boolean deleteSearchKeyword(int searchId) {
		return mapper.deleteSearchKeyword(searchId)==1?true:false;
	}





	


}
