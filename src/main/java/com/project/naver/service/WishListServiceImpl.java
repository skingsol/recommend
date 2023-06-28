package com.project.naver.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.naver.NaverClient;
import com.project.naver.dto.SearchImageItem;
import com.project.naver.dto.SearchImageReq;
import com.project.naver.dto.SearchImageRes;
import com.project.naver.dto.SearchLocalItem;
import com.project.naver.dto.SearchLocalReq;
import com.project.naver.dto.SearchLocalRes;
import com.project.naver.dto.WishListDTO;

@Service
public class WishListServiceImpl implements WishListService {

	@Autowired
	private NaverClient naverClient;

	@Override
	public List<WishListDTO> search(String query) {
		// index 에서 보여줄 음식점 리스트
		// 상호명(title), 이미지링크(imageLink)

		List<WishListDTO> list = new ArrayList<>();
		
		// 지역 검색 요청
		SearchLocalReq req = new SearchLocalReq();
		req.setQuery(query);

		// 지역 검색 결과 받기
		SearchLocalRes res = naverClient.searchLocal(req);

		if (res.getTotal() > 0) {
			
			// display=4로 결과 4개 반환해야 하므로 반복문 필요
			for (SearchLocalItem item : res.getItems()) {

				// 4개의 음식점 중에서 하나 가져오기
				SearchLocalItem localItem = item;

				// 해당 가게 사진 검색하기 위해 제목 추출(+특문 제거)
				String imageQuery = localItem.getTitle().replaceAll("<[^>]*>", "");

				// 이미지 검색 요청
				SearchImageReq imageReq = new SearchImageReq();
				imageReq.setQuery(imageQuery);

				// 이미지 검색 결과 받기
				SearchImageRes imageRes = naverClient.searchImage(imageReq);

				if (imageRes.getTotal() > 0) {

					// 이미지 정보들 중에서 첫번째 가져오기
					SearchImageItem imageItem = imageRes.getItems().get(0);

					// 받은 정보들을 원하는 데이터만 추출해서 WishListDTO 담기
					WishListDTO dto = new WishListDTO();
					dto.setTitle(localItem.getTitle());					
					dto.setImageLink(imageItem.getLink());
					list.add(dto);
				}
			}
		}
		return list;
	}
}
