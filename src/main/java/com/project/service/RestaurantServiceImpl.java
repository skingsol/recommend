package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.RestaurantDTO;
import com.project.mapper.RestaurantMapper;

@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;
	
	@Override
	public boolean saveRestaurant(RestaurantDTO restaurantDTO) {
	    String title = restaurantDTO.getTitle().replaceAll("<b>", "").replaceAll("</b>", "");
	    restaurantDTO.setTitle(title);
	    return restaurantMapper.insert(restaurantDTO) == 1 ? true : false;
	}

}
