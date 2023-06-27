package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor @NoArgsConstructor
@ToString @Getter @Setter
public class SearchDTO {
	private int search_id;
	private String searchKeyword;
	private Date searchDate;
}
