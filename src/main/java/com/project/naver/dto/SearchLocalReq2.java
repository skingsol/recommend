package com.project.naver.dto;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 지역검색 정보요청 파라메터 DTO
// query=갈비집&display=5&start=1&sort=random <이런 거

@Data @AllArgsConstructor @NoArgsConstructor
public class SearchLocalReq2 {

	private String query = "";
	private String display = "10";	//최대 10개
	private String start = "1";
	private String sort = "random";		//관련도 순
	
	public MultiValueMap<String, String> toMultiValueMap(){
		LinkedMultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		
		map.add("query", query);
		map.add("display", display);
		map.add("start", start);
		map.add("sort", sort);
		
		return map;
	}
}
