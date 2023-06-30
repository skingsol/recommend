package com.project.restaurants.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ResultImageItem {
	private String title;  		  	// 이미지가 검색된 문서 제목
	private String link;		  	// 이미지의 URL
	private String thumbnail;		// 썸네일 이미지의 URL
	private String sizeheight;		// 이미지의 세로 크기(단위: 픽셀)
	private String sizewidth;		// 이미지의 가로 크기(단위: 픽셀)
}
