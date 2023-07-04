<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Custom styles for this template-->
<link href="/login/css/loginpage.css" rel="stylesheet">

<div class="container">
	<div class="row">
		<form id="login" method="POST" action="/login">			
			<div class="login">
				<div class="title bb-gray">로그인 및 회원가입</div>
				<div class="fs-15 fw-b" style="padding: 24px 0;">로그인을 통해 다양한
					혜택을 누리세요.</div>
				<div>
					<input id="floatingInput" type="text" class="input-text" placeholder="아이디 입력" name="username"> 
					<input id="floatingPassword" type="password" class="input-text"	placeholder="비밀번호 입력" name="password">
				</div>
				<div style="padding: 24px 0;">
					<div class="fl">
						<label class="checkbox">
						<input id="ckb_auto"  type="checkbox" name="remember-me"/> 
						<i class="check-icon"></i> <span class="fs-13 fw-b">로그인상태 유지</span></label>
					</div>
					<%-- 로그인 에러 메세지 보여주기 --%>
					<div class="text-danger text-center mt-2">
						<small>${error}</small>
					</div>
					<div class="clear"></div>
				</div>
				<button type="submit" class="btn btn-black">로그인</button>
				<div style="padding: 14px 0;">
					<div class="fl"
						style="border-bottom: solid #E0E0E0 1px; width: 180px; height: 7px;"></div>

					<div class="fr"
						style="border-bottom: solid #E0E0E0 1px; width: 180px; height: 7px;"></div>
					<div class="clear"></div>
				</div>
				<a button id="btn_facebook" type="button" class="btn btn-facebook"
					href="/oauth2/authorization/facebook">페이스북으로 로그인</a>
				<div
					style="margin: 24px 0 100px 0; padding: 24px 0; border: solid #E0E0E0 1px; line-height: 24px;">
					<span class="fs-15 fw-b">아직 회원이 아니신가요?</span><br> <span>회원가입을
						하시면 더 많은 정보와 혜택을 받으실 수 있습니다.</span> <a button id="btn_intro"
						type="button" class="btn btn-white w200" href="/member/step1"
						style="margin-top: 12px;">회원가입</a>
				</div>
			</div>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
			
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>