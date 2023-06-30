package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor @NoArgsConstructor
@Getter @Setter @ToString
public class RegisterRstrntDTO {
	private int reqId;
	private String reqName;
	private String reqContent;
	private Date regDate;
}
