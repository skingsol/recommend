package com.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.inject.spi.Message;
import com.project.domain.MemberAuthDTO;
import com.project.domain.ChangeDTO;
import com.project.domain.LoginDTO;
import com.project.domain.MemberDTO;
import com.project.mapper.MemberMapper;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bPasswordEncoder;

	@Override
	public MemberAuthDTO login(LoginDTO loginDTO) {	
		// 1234 ==> bPasswordEncoder.encode(1234) ==> 암호화
		// matches(암호화하기 전 코드, 암호화된 코드)
		// matches(1234,db암호화된 문자)
		
		// 비밀번호가 일치하는가?
		// db에서 암호화된 비번 가져오기
		String encodePass = mapper.getPass(loginDTO.getUserid());
		
		if(bPasswordEncoder.matches(loginDTO.getPassword(), encodePass)) {
			return mapper.login(loginDTO.getUserid());			
		}else {
			return null;
		}		
	}
	
	
	@Transactional
	@Override
	public boolean register(MemberDTO memberDTO) {
		// 비밀번호 암호화 : encode(암호화할 원본 코드)
		//                   matches(암호화하기 전, 암호화 코드)
		//                   1234, 암호화된 코드
		memberDTO.setPassword(bPasswordEncoder.encode(memberDTO.getPassword()));
		
		
		
//		// 회원 가입 정보 저장
        boolean result = mapper.insert(memberDTO)==1?true:false;
		
		

        // 권한 정보 저장
        MemberAuthDTO memberAuthDTO = new MemberAuthDTO(memberDTO.getUserid(), "ROLE_USER");
       
        mapper.setAuth(memberAuthDTO);

		
		return result;
	}

	@Override
	public boolean dupId(String userid) {		
		return mapper.dupId(userid) == 0 ? true:false;
	}	

	
	
	@Transactional
	@Override
	public boolean remove(LoginDTO loginDTO) {		
		
		//비밀번호 확인
		String encodePass = mapper.getPass(loginDTO.getUserid());
		
		
		
		if(bPasswordEncoder.matches(loginDTO.getPassword(), encodePass)) {
			//auth 삭제 호출
						
			return mapper.leave_auth(loginDTO.getUserid()) == 1 && mapper.leave(loginDTO.getUserid()) == 1;
		}
		return false;
		
		
	}
	
	@Override
	public boolean update(ChangeDTO changeDTO) {		
		
		//현재 비밀번호 확인
		String encodePass = mapper.getPass(changeDTO.getUserid());
		
		if(bPasswordEncoder.matches(changeDTO.getCurrentPassword(), encodePass)) {
			
			//변경 비밀번호 암호화
			changeDTO.setNewPassword(bPasswordEncoder.encode(changeDTO.getNewPassword()));			
			
			return mapper.update(changeDTO)==1?true:false;			
		}
		return false;
	}


	@Override
	public boolean updateMember(MemberDTO memberDTO) {
		return mapper.updateMember(memberDTO)==1?true:false;
	}


	

	
	
	
	
}






