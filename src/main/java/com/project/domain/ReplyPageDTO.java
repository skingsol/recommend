package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ReplyPageDTO {
	private int replyCnt; // 특정 게시물에 달린 댓글 총 수
	private List<ReplyDTO> list;  // 특정 게시물 댓글 리스트
} 
