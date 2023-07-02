package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RestaurantDTO {
	private int restaurantId;
	private String title;
	private String address;
	private int wishlistCount;
	private int reviewCount;
	private int menuId;
}
