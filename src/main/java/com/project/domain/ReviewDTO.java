package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {
	private int reviewId;
	private int restauantId;
	private String userId;
	private String reviewContent;
	private int grade;
	private String reviewDate;
	private String reviewUpdatedate;
}
