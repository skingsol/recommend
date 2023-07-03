package com.project.service;

import org.springframework.stereotype.Service;

import com.project.mapper.StarMapper;
@Service
public class StarServiceImpl implements StarService {

	private StarMapper mapper;
	
	@Override
	public double starAvg(int restaurantId) {
		// 음식점 별점 평균
		Double starAvg = mapper.starAvg(restaurantId);
		return starAvg;
		
	}

}
