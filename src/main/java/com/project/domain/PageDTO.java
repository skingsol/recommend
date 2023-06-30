package com.project.domain;
// 페이지 나누기 정보 객체
// 요청된 페이지 : pageNum
// 한 페이지당 목록 수 : amount
// 시작 페이지(startPage), 끝나는 페이지(endPage)    => 1      5      10
//                                                      11    15      20
// 끝나는 페이지 재계산(realEnd)
// 전체 게시물 개수(total)

import lombok.Getter;
import lombok.ToString;

// 전체 게시물 35 개, 한 페이지당 10개씩 보여주기 => 1 2 3 4

@ToString
@Getter
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.total = total;
		this.cri = cri;	
		
		this.endPage = (int)(Math.ceil(cri.getPage() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
				
		int realEnd = (int)(Math.ceil((total / 1.0) / cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}




