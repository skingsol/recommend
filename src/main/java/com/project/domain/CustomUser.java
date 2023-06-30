package com.project.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	
	private MemberDTO memberDTO;

	public CustomUser(String userid, String password, Collection<? extends GrantedAuthority> authorities) {
		super(userid, password, authorities);		
	}

	public CustomUser(MemberDTO memberDTO) {
		super(memberDTO.getUserid(),memberDTO.getPassword(), memberDTO.getAuthorities()
				                                                    .stream()
				                                                    .map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				                                                    .collect(Collectors.toList()));
		this.memberDTO = memberDTO;
	}
	
	

}