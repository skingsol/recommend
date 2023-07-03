package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.RegisterRstrntDTO;

public interface RegisterRstrntService {
	public boolean sendRequest(RegisterRstrntDTO dto);
	public RegisterRstrntDTO readRequest(int reqId);
	public List<RegisterRstrntDTO> listRequest();
	public boolean deleteRequest(int reqId);
//	public List<RegisterRstrntDTO> listRequest(Criteria cri);
//	//전체 게시물 개수
//	public int getTotalCnt(Criteria cri);	
}
