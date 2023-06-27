package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.domain.AuthDTO;


public class AuthCheckInterceptor implements HandlerInterceptor {
	
	//  http://localhost:8080/member/changePwd ==> 인터셉터가 요청 가로채기
	//  session 정보가 있는지 확인
	//   true : 원래 담당 컨트롤러 요청 넘기기
	//   false : 로그인 페이지로 이동
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		AuthDTO authDTO = (AuthDTO)session.getAttribute("authDTO");
		if(authDTO!=null) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
	}
	
	
}










