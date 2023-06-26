package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultDTO {
	// 화면에 보여줄 내용 + DB에서 가져온 내용
//		private Long idx;
		
		// SearchLocalItem + SearchImageItem
		private String title;				// 음식명
		private String category;			// 음식 분류
		private String address;				// 주소
		private String roadAddress;			// 도로명
		private String homePageLink;
		private String imageLink;			// 음식, 가게 이미지 주소
}
