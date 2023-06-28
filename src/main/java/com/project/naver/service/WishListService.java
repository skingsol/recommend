package com.project.naver.service;

import java.util.List;

import com.project.naver.dto.WishListDTO;

public interface WishListService {
	public List<WishListDTO> main(String query);
	public List<WishListDTO> search(String query);
	
	//public WishListDTO add(WishListDTO wishListDTO);
	//public List<WishListDTO> all();
}