package com.project.service;

import java.util.List;

import com.project.ms.dto.BringNaverApiDTO;


public interface BringNaverService {
	public List<BringNaverApiDTO> main(String query);
	public List<BringNaverApiDTO> search(String query);
	
	//public WishListDTO add(WishListDTO wishListDTO);
	//public List<WishListDTO> all();
}