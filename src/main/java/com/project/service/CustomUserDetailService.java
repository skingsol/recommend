package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.domain.CustomUser;
import com.project.domain.MemberDTO;
import com.project.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;


//@Service("detail")

@Slf4j
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("userid"+username);
		
		MemberDTO memberDTO = mapper.read(username);
		
		// memberDTO 는 User 클래스 상속 받아서 만든 클래스를 이용해서 리턴해야 함
		
		return new CustomUser(memberDTO);
	}

}