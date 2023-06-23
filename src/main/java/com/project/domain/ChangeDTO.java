package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString @AllArgsConstructor
@NoArgsConstructor
public class ChangeDTO {
   //changePwd.jsp 와 일치
	private String userid;	
	
	private String currentPassword;
	private String newPassword;
	private String confirmPassword;	
	
	public boolean passwordEquals() {
		return newPassword.equals(confirmPassword);
	}
}