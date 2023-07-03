package com.project.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class BoardDTO {
	private int postId;
	private String postTitle;
	private String postContent;
	private String userid;
	private Date postRegdate;
//	private Date updateDate;
	private int replyCnt;
	private int postAuth;
	//첨부파일 정보
	private List<AttachFileDTO> attachList;
	public int getPostAuth() {
        return postAuth;
    }
}


















