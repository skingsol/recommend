package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter @ToString
public class ReplyDTO {
	private int replyId;
	private int postId;
	private String replyContent;
	private String replyer;
	private Date replyRegdate;	
//	private Date updateDate;
	private int replyAuth;
	
}
