<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Custom styles for this template-->
<link href="/login/css/loginpage.css" rel="stylesheet">

<div class="container">
	<div class="row">
		<form id="login" method="POST">
			<input name="retURL" type="hidden"
				action='<c:url value="/member/login"/>'>
			<div class="login">
				<div class="title bb-gray">로그인 및 회원가입</div>
				<div class="fs-15 fw-b" style="padding: 24px 0;">로그인을 통해 다양한
					혜택을 누리세요.</div>
				<div>
					<input id="floatingInput" type="text" class="input-text"
						placeholder="아이디 입력" name="userid"> <input
						id="floatingPassword" type="password" class="input-text"
						placeholder="비밀번호 입력" name="password">
				</div>
				<div style="padding: 24px 0;">
					<div class="fl">
						<label class="checkbox"><input id="ckb_auto"
							type="checkbox" value="Y" checked=""><i
							class="check-icon"></i> <span class="fs-13 fw-b">로그인상태 유지</span></label>
					</div>
					<div class="fr" style="padding-top: 3px;">
						<span class="w3-right w3-button w3-hover-white" title="비밀번호 찾기"
							id="find_pw_btn"> <i
							class="fa fa-exclamation-triangle we-hover-text-red w3-large"></i>
						</span>
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
					href="https://ko-kr.facebook.com/">페이스북으로 로그인</a>
				<div
					style="margin: 24px 0 100px 0; padding: 24px 0; border: solid #E0E0E0 1px; line-height: 24px;">
					<span class="fs-15 fw-b">아직 회원이 아니신가요?</span><br> <span>회원가입을
						하시면 더 많은 정보와 혜택을 받으실 수 있습니다.</span> <a button id="btn_intro"
						type="button" class="btn btn-white w200" href="/member/step1"
						style="margin-top: 12px;">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script src='<c:url value="/login/js/login.js" />'></script>

<%@ include file="../include/footer.jsp"%>