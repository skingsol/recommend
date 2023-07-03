package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.WishListDTO;

@Mapper
public interface WishListMapper {
	public int insert(@Param("restaurantId")int restaurantId,@Param("userId")String userId);
	public List<WishListDTO> getWishList(String userId);
	public int delete(WishListDTO wishList);
	public int countWishList(int restaurantId);
}
