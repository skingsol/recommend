package com.project.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int page; //페이지번호
	private int amount;  //한 페이지당 몇 개의 게시물을 보여줄 것인지	
	private String type; //검색조건
	private String keyword; //검색어	
	public Criteria() {
		this(1,10);
	}
	public Criteria(int page, int amount) {
		super();
		this.page = page;
		this.amount = amount;
	}	
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}





