package com.project.service;

import com.project.domain.WishListDTO;

import java.util.List;

public interface WishListService {
    int insertWishList(WishListDTO wishList);
    List<WishListDTO> getWishList(String userId);
    int deleteWishList(WishListDTO wishList);
    int countWishList(int restaurantId);
}

