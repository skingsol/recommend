package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@ToString
@NoArgsConstructor
@Getter @Setter
public class MemberDTO {
	private String userid;
	private String password;
	private String name;
	private String gender;
	private String email;
}