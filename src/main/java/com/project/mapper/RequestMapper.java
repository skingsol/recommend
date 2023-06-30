package com.project.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.project.domain.RegisterRstrntDTO;

@Mapper
public interface RequestMapper {
	public int sendRequest(RegisterRstrntDTO dto);
	public RegisterRstrntDTO readRequest(int reqId);
}
