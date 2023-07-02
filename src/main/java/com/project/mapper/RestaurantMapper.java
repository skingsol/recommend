package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.RestaurantDTO;

@Mapper
public interface RestaurantMapper {
	public int insert(RestaurantDTO restaurant);
}
