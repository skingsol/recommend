package com.project.service;

import java.util.List;
import com.project.domain.SearchDTO;

public interface SearchService {
	public boolean insertSearchKeyword(SearchDTO dto);
	public boolean deleteSearchKeyword(int searchId);
	public boolean deleteAll();
	public List<SearchDTO> getRecentSearchKeywords();
	
}
