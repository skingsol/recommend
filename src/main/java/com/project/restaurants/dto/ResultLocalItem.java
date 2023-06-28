package com.project.restaurants.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ResultLocalItem {
	private String title;  		  	//업체, 기관명
	private String link;		  	//업체, 기관의 상세 정보 URI
	private String category;		//업체, 기관의 분류 정보	
	private String address;			//업체, 기관명의 지번 주소
	private String roadAddress;		//업체, 기관명의 도로명 주소
	private String mapx;			//업체, 기관이 위치한 장소의 x 좌표
	private String mapy;			//업체, 기관이 위치한 장소의 y 좌표
}
