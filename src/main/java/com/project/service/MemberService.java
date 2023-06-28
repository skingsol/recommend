package com.project.service;

import com.project.domain.AuthDTO;
import com.project.domain.ChangeDTO;
import com.project.domain.LoginDTO;
import com.project.domain.MemberDTO;

public interface MemberService {
	//로그인
	public AuthDTO login(LoginDTO loginDTO);
	//회원가입
	public boolean register(MemberDTO memberDTO);
	//중복 아이디 체크
	public boolean dupId(String userid);
	//회원탈퇴
	public boolean remove(LoginDTO loginDTO);
	//비밀번호 변경
	public boolean update(ChangeDTO changeDTO);

}