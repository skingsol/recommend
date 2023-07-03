package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WishListDTO {
	private String userId;
	private int restaurantId;
	private String title;
	private String address;
	private int reviewCount;
	private int wishlistCount;
}
