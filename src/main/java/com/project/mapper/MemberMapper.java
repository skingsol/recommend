package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.MemberAuthDTO;
import com.project.domain.ChangeDTO;
import com.project.domain.LoginDTO;
import com.project.domain.MemberDTO;

@Mapper
public interface MemberMapper {
	public String getPass(String userid);	
	public MemberAuthDTO login(String userid);
	public int insert(MemberDTO memberDTO);
	public int dupId(String userid);
	public int leave(String userid);
	public int update(ChangeDTO changeDTO);
	
	public int setAuth(MemberAuthDTO memberAuthDTO);
	
	public MemberDTO read(String userid);
	
	

   

    
}