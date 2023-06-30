package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultDTO {
		
		private String title;				// 음식명
		private String category;			// 음식 분류
		private String address;				// 주소
		private String roadAddress;			// 도로명
		private String homePageLink;		// homepageLink
		private List<String> imageLink;			// 음식, 가게 이미지 주소
}
