<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<link href="/login/css/mypage.css" rel="stylesheet">

<form id="myForm" method="post" action="/member/update">

	<!-- Add this line to link the custom CSS -->
	<div id="div_activate">
		<input type="hidden" name="before_name" id="before-name"
			value="ssbcard">
		<div>
			<div class="title">
				<div class="row">프로필 수정하기</div>
			</div>
			<!-- 회원가입 폼 -->
			<div class="row">

				<table id="tbl_info" class="table table-user">
					<tbody>
						
						<tr id="tr_name">
							<th>아이디</th>
							<td><input type="text" class="form-control" id="userid"
								name="userid" readonly
								value="${pageContext.request.userPrincipal.name}" /><br> <br>
								<span id="lbl_name_check" class="">회원정보로 등록하실 아이디를
									입력해주세요.</span></td>
						</tr>
						<!-- <tr id="tr_intro">
							<th>자기소개</th>
							<td><input id="txt_intro" class="input-text w400"
								type="text" value="" placeholder="자기소개를 입력하세요."
								onkeyup="CutStr(this, 25, 'lbl_limit');"><br> <br>
								<div class="w400 tr">
									<span id="lbl_limit">0에서 25글자까지 입력해주세요.</span>
								</div></td>
						</tr> -->
						<tr id="tr_email">
							<th>이메일</th>
							<td><input id="email" class="input-text w400" type="text" name="email"
								value="" placeholder="이메일"><br> <br> <span
								id="lbl_email_check" class="">이용하실 이메일을 입력해 주세요.</span></td>
						</tr>
						<tr id="tr_phone">
							<th>휴대전화인증</th>
							<td>
								<div id="div_phone_Y">
									<span class="fs-20 fw-b"> <span class="fc-mint">인증필요
											<img
											src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-on.png"
											style="width: 16px; border-radius: 50%;">
									</span></span>
									<button id="btn_phone" type="button" class="btn btn-black w200">휴대전화인증</button>
									<br> <br> 개인화된 맛집추천, 좋아요, 비밀번호찾기, 맛집평가작성, 포인트 적 립 및
									사용, 할인쿠폰 등의 모든 서비스 혜택을 받을 수 있습니다.
								</div>
							</td>
						</tr>
						<tr id="tr_pw">
							<th>비밀번호</th>
							<td>
								<sec:authorize access="isAuthenticated()">
									<div id="div_password_Y">
										<a class="nav-link" href="/member/changePwd">비밀번호변경</a>
									</div>
								</sec:authorize>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="row" style="padding: 24px 0 0 40px;">
				<a id="btn_deactivate" href="/member/leave"
					style="color: #222222; text-decoration: none;">회원탈퇴하기</a> <span>
				</span>
				<div class="row tc" style="padding: 50px 0 55px 0;">
					<button id="btn_submit" type="button"
						class="btn btn-mint w400 fs-16" style="height: 65px;">변경사항저장</button>
				</div>
			</div>
		</div>
	</div>


	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>




<script>
document.querySelector("#btn_submit").addEventListener("click", () => {
    
    const form = document.getElementById("myForm");

    form.submit();
  });
</script>







<%@ include file="../include/footer.jsp"%>
















