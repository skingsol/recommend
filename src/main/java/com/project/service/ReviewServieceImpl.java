package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ReviewDTO;
import com.project.mapper.ReviewMapper;

@Service
public class ReviewServieceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewDTO> getList(int restauantId) {
		return reviewMapper.ReviewList(restauantId);
	}

	@Override
	public boolean insert(ReviewDTO dto) {
		return reviewMapper.insert(dto) == 1 ? true : false;
	}

	@Override
	public boolean update(ReviewDTO dto) {
		return reviewMapper.update(dto) == 1 ? true : false;
	}

	@Override
	public ReviewDTO read(int reviewId) {
		return reviewMapper.read(reviewId);
	}

	@Override
	public boolean delete(int reviewId) {
		return reviewMapper.delete(reviewId) == 1 ? true : false;
	}

}
