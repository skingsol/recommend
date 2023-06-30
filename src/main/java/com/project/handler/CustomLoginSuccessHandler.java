package com.project.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	// 로그인 성공 후 시작 페이지로 돌아가는 데
	// 로그인 성공 후 특정 작업 추가하고 싶거나 이동해야 하는 경로 지정
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// 로그인 사용자의 권한 확인
		// ROLE_ADMIN 이라면 adminpage 이동, ROLE_USER 라면 userpage 이동
		
		
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> roleNames.add(auth.getAuthority()));		
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/member/admin");
			return;
		}
		if(roleNames.contains("ROLE_USER") || roleNames.contains("ROLE_MANAGER") ) {
			response.sendRedirect("/");
			return;
		}
		
		response.sendRedirect("/");

	}

}








