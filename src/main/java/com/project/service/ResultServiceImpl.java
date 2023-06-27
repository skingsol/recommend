package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.api.NaverClient;
import com.project.domain.ResultDTO;
import com.project.restaurants.dto.ResultImageItem;
import com.project.restaurants.dto.ResultImageReq;
import com.project.restaurants.dto.ResultImageRes;
import com.project.restaurants.dto.ResultLocalItem;
import com.project.restaurants.dto.ResultLocalReq;
import com.project.restaurants.dto.ResultLocalRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ResultServiceImpl implements ResultService {

	@Autowired
	private NaverClient naverClient;
	
	@Override
	public ResultDTO result(String restaurantName) {
		
		// 지역 검색 요청
		ResultLocalReq req = new ResultLocalReq();
		//해운대암소갈비집
		req.setQuery(restaurantName);	
		
		
		// 지역 검색 결과 받기
		ResultLocalRes res = naverClient.ResultLocal(req);
		
		if(res.getTotal() >0) {			
			// 지역 검색 중에서 첫번째 가져오기
			ResultLocalItem localItem = res.getItems().get(0);
			
			// 해당 가게 사진 검색하기 위해 제목 추출
			String imageQuery = localItem.getTitle().replaceAll("<[^>]*>", "");
			
			// 이미지 검색 요청
			ResultImageReq imageReq = new ResultImageReq();
			imageReq.setQuery(imageQuery);
			
			// 이미지 검색 결과 받기
			ResultImageRes imageRes = naverClient.ResultImage(imageReq);
			
			if(imageRes.getTotal() > 0) {
				// 이미지 정보들 중에서 첫번째 가져오기
				 List<ResultImageItem> imageItems = imageRes.getItems();
				
				// 받은 정보들을 원하는 데이터만 추출해서 ResultDTO 담기
				ResultDTO dto = new ResultDTO();
				dto.setTitle(localItem.getTitle());
				dto.setCategory(localItem.getCategory());
				dto.setAddress(localItem.getAddress());
				dto.setRoadAddress(localItem.getRoadAddress());
				dto.setHomePageLink(localItem.getLink());
				
				List<String> imageLinks = new ArrayList<>();
			    for (ResultImageItem imageItem : imageItems) {
			        imageLinks.add(imageItem.getLink());
			    }
			    dto.setImageLink(imageLinks);
				
				return dto;
			
				
			}
		}		
		return new ResultDTO();
	}
}
