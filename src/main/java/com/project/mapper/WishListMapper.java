package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.WishListDTO;

@Mapper
public interface WishListMapper {
	public int insert(WishListDTO wishList);
	public List<WishListDTO> getWishList(String userId);
	public int delete(WishListDTO wishList);
	public int countWishList(int restaurantId);
}
