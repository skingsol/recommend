package com.project.service;

import com.project.domain.RegisterRstrntDTO;

public interface RegisterRstrntService {
	public boolean sendRequest(RegisterRstrntDTO dto);
	public RegisterRstrntDTO readRequest(int reqId);
}
