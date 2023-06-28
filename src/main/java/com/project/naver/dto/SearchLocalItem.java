package com.project.naver.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// api 응답 결과 중 상위객체 items 리스트 안에 있는 하위 세부 항목 객체 생성

@Data @AllArgsConstructor @NoArgsConstructor
public class SearchLocalItem {
	
	private String title;					// 업체 or 기관명
	private String link;					// 업체 or 기관의 상세 정보 URL
	private String category;			// 업체 or 기관의 분류 정도
	private String description;		// 업체 or 기관에 대한 설명
	private String address;			// 업체 or 기관의 지번 주소
	private String roadAddress;	// 업체 or 기관의 도로명 주소
	private String mapx;				// 업체 or 기관이 위치한 장소의 x좌표
	private String mapy;					// 업체 or 기관이 위치한 장소의 y좌표
}

