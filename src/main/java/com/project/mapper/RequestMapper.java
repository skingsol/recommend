package com.project.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.Criteria;
import com.project.domain.RegisterRstrntDTO;

@Mapper
public interface RequestMapper {
	public int sendRequest(RegisterRstrntDTO dto);
	public RegisterRstrntDTO readRequest(int reqId);
	//public List<RegisterRstrntDTO> listRequest(Criteria cri);
	//public int totalCnt(Criteria cri);
	public List<RegisterRstrntDTO> listRequest();
	public int deleteRequest(int reqId);
}
