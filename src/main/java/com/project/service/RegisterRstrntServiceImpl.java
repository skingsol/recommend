package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.RegisterRstrntDTO;
import com.project.mapper.RequestMapper;

@Service
public class RegisterRstrntServiceImpl implements RegisterRstrntService {
	
	@Autowired
	private RequestMapper mapper;
	
	// 맛집 등록 요청 입력
	@Override
	public boolean sendRequest(RegisterRstrntDTO dto) {
		
		return mapper.sendRequest(dto)==1?true:false;
	}

	// 맛집 등록 요청 상세 보기
	@Override
	public RegisterRstrntDTO readRequest(int reqId) {
		
		return mapper.readRequest(reqId);
	}

	// 맛집 등록 요청 목록
	@Override
	public List<RegisterRstrntDTO> listRequest() {
		
		return mapper.listRequest();
	}

	// 맛집 등록 요청 삭제
	@Override
	public boolean deleteRequest(int reqId) {
		
		return mapper.deleteRequest(reqId)==1?true:false;
	}


}
