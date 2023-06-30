package com.project.ms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// api 응답 결과 중 상위객체 items 리스트 안에 있는 하위 세부 항목 객체 생성

@Data @AllArgsConstructor @NoArgsConstructor
public class SearchImageItem {
	
	private String title;					// 이미지가 검색된 문서의 제목
	private String link;					// 이미지 URL
	private String thumbnail;			// 이미지 썸네일 URL
	private String sizeheight;		// 이미지 세로 크기(단위: 픽셀)
	private String sizewidth;			// 이미지 가로 크기(단위: 픽셀)

}

