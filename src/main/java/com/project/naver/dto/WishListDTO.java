package com.project.naver.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class WishListDTO {

	// 화면에 보여줄 내용 + db 에서 가져온 내용 담을 객체
	
	private Long idx;			
	
	// SearchLocalItem + SearchImageItem
	private String title;							// 음식명
	private String category;					// 음식 분류
	private String address;					// 주소			
	private String roadAddress;			// 도로명 주소
	private String imageLink;					// 음식, 가게 이미지 주소
	private String homePageLink;			// 홈페이지 링크
	
	private boolean isVisit;					// 방문여부
	private int visitCount;						// 방문 횟수
	private LocalDateTime lastVisitDate;			// 마지막 방문 일자
}
