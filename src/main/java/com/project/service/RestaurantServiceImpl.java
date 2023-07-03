package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.RestaurantDTO;
import com.project.mapper.RestaurantMapper;

@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;
		
	@Override
	public int saveRestaurant(RestaurantDTO restaurantDTO) {
	    String title = restaurantDTO.getTitle().replaceAll("<b>", "").replaceAll("</b>", "");
	    String address = restaurantDTO.getAddress();
	    List<RestaurantDTO> restaurantList = restaurantMapper.checkRestaurant(title, address);
	    if (!restaurantList.isEmpty()) {
            // 이미 존재하는 음식점인 경우
            return restaurantList.get(0).getRestaurantId();
        } else {
            // 아니면 새로운 음식점을 저장하고 생성된 ID를 반환합니다.
            restaurantDTO.setTitle(title);
            restaurantMapper.insert(restaurantDTO);
            // 생성된 ID가 있는 음식점을 조회합니다.
            List<RestaurantDTO> newList = restaurantMapper.checkRestaurant(title, address);
            return newList.get(0).getRestaurantId();
        }
	}
}
