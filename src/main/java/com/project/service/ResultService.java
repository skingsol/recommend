package com.project.service;


import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.ResultDTO;


public interface ResultService {
	public ResultDTO result(String restaurantName);
}
