package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ms.dto.BringNaverApiDTO;
import com.project.ms.dto.SearchImageItem;
import com.project.ms.dto.SearchImageReq;
import com.project.ms.dto.SearchImageRes;
import com.project.ms.dto.SearchLocalItem;
import com.project.ms.dto.SearchLocalReq;
import com.project.ms.dto.SearchLocalReq2;
import com.project.ms.dto.SearchLocalRes;
import com.project.naver.NaverClient;


@Service
public class BringNaverServiceImpl implements BringNaverService {

	@Autowired
	private NaverClient naverClient;
	

	@Override
	public List<BringNaverApiDTO> main(String query) {
		// main 에서 보여줄 음식점 리스트
		// 상호명(title), 이미지링크(imageLink)

		List<BringNaverApiDTO> list = new ArrayList<>();
		
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
					BringNaverApiDTO dto = new BringNaverApiDTO();
					dto.setTitle(localItem.getTitle().replaceAll("<[^>]*>", ""));
					dto.setImageLink(imageItem.getLink());
					list.add(dto);
				}
			}
		}
		return list;
	}

	
	//검색결과용 메소드
	@Override
	public List<BringNaverApiDTO> search(String query) {
				List<BringNaverApiDTO> list = new ArrayList<>();
				
				SearchLocalReq2 req2 = new SearchLocalReq2();
				req2.setQuery(query);

				SearchLocalRes res = naverClient.searchLocal2(req2);

				if (res.getTotal() > 0) {
					
					
					for (SearchLocalItem item : res.getItems()) {

						SearchLocalItem localItem = item;

						String imageQuery = localItem.getTitle().replaceAll("<[^>]*>", "");

						SearchImageReq imageReq = new SearchImageReq();
						imageReq.setQuery(imageQuery);

						SearchImageRes imageRes = naverClient.searchImage(imageReq);

						if (imageRes.getTotal() > 0) {

							SearchImageItem imageItem = imageRes.getItems().get(0);

							BringNaverApiDTO dto = new BringNaverApiDTO();
							dto.setTitle(localItem.getTitle().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
							dto.setCategory(localItem.getCategory());
							dto.setAddress(localItem.getAddress());
							dto.setRoadAddress(localItem.getRoadAddress());
							dto.setHomePageLink(localItem.getLink());
							dto.setImageLink(imageItem.getLink());
							list.add(dto);
						}
					}
				}
				return list;
	}
}
