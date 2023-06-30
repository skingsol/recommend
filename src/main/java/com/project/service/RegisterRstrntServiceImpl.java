package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.RegisterRstrntDTO;
import com.project.mapper.RequestMapper;

@Service
public class RegisterRstrntServiceImpl implements RegisterRstrntService {
	
	@Autowired
	private RequestMapper mapper;
	
	@Override
	public boolean sendRequest(RegisterRstrntDTO dto) {
		
		return mapper.sendRequest(dto)==1?true:false;
	}

	@Override
	public RegisterRstrntDTO readRequest(int reqId) {
		
		return mapper.readRequest(reqId);
	}

}
