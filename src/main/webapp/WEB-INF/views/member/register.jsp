<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<h1>회원 가입</h1>
<!-- 
		novalidate : html5 유효성 검증 사용하지 않겠음 
	    required, maxlength, max, min, email, url
	-->
<link href="/css/registerpage.css" rel="stylesheet">
<form action='<c:url value="/member/register" />' method="post" novalidate>
	<div class="row">

		<table id="tbl_info" class="table table-user">
			<tbody>
				<tr id="tr_phone">
					<th>휴대전화인증</th>
					<td>
						<div id="div_phone_Y">
							<span class="fs-20 fw-b"> <span class="fc-mint">인증이 필요합니다. </span></span>
							<button id="btn_phone" type="button" class="btn btn-black w200">휴대전화인증</button>
							<br> <br> 개인화된 맛집추천, 좋아요, 비밀번호찾기, 맛집평가작성, 포인트 적 립 및 사용, 다코박스 상품구매, 할인쿠폰 등의 모든 서비스 혜택을 받을 수 있습니다.
						</div>
					</td>
				</tr>
				<tr id="tr_name">
					<th>닉네임</th>
					<td><input class="input-text w400" type="text" id="userid" name="userid" placeholder="닉네임을 입력하세요." maxlength="10" required pattern="^(?=[A-Za-z])(?=.*\d))[A-Za-z\d!@#$%]{5,12}$"><br> <br> <span id="lbl_name_check" class="fc-blue"></span>

						<div class="col-2">
							<button type="button" class="w-100 btn btn-danger">중복확인</button>
						</div>
				</tr>
				<tr id="tr_intro">
					<th>자기소개</th>
					<td><input id="txt_intro" class="input-text w400" type="text" value="" placeholder="자기소개를 입력하세요." onkeyup="CutStr(this, 25, 'lbl_limit');"><br> <br>
						<div class="w400 tr">
							<span id="lbl_limit">0</span> ~ 25자
						</div></td>
				</tr>
				<tr id="tr_email">
					<th>이메일</th>
					<td><input id="email" class="input-text w400" type="text" id="email" name="email" placeholder="이메일을 입력하세요."><br> <br> <span id="lbl_email_check" class="fc-blue"></span></td>
				</tr>
				<tr id="tr_pw">
					<th>비밀번호</th>
					<td>
						<div id="div_password_Y">
							<input id="password" class="input-text w400" type="password" name="password" style="margin-bottom: 8px;" placeholder="비밀번호를 입력하세요." aria-autocomplete="list"><br> <input id="password2" class="input-text w400" type="password" name="password2" placeholder="비밀번호 확인"><br> <br> 특수문자(예: !@#$ 등) 1자 이상을 포함한 10~15 글자의 비밀번호로 설정해주세요.
						</div>
						<div class="invalid-feedback">비밀번호를 확인해 주세요</div>
					</td>
				</tr>
				<tr id="tr_photo">
					<th>프로필 사진</th>
					<td><iframe name="fImage" frameborder="0" style="display: none; width: 0; height: 0;"></iframe>
						<form id="frm_image" method="POST" action="/2018/ajax/uploader.php" target="fImage" enctype="multipart/form-data">
							<input name="key" type="hidden" value="profile"> <input name="val" type="hidden" value="i0231588"> <input id="hid_photo" type="hidden" value=""> <input id="hid_image" name="fImage" type="file" class="hide">

							<div class="fl" style="width: 110px; height: 110px; background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/img-profile-default.png);">
								<img id="img_photo" src="" width="110" height="110" style="border-radius: 50%; display: none;">
							</div>
							<div class="fl" style="height: 110px; padding-top: 70px;">
								<button id="btn_image" type="button" class="btn btn-black w150" style="margin-left: 12px;">찾아보기</button>
							</div>
							<div class="clear"></div>
						</form> <br> 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.</td>
				</tr>

			</tbody>
		</table>

		<div class="row tc" style="padding: 50px 0 55px 0;">
			<button id="btn_submit" type="button" class="btn btn-mint w400 fs-16" style="height: 65px;">회원가입하기</button>
		</div>
	</div>

</form>
<script>
	const path = '<c:url value="/list.do"/>';
</script>
<script src='<c:url value="/js/register.js" />'></script>
<%@ include file="../include/footer.jsp"%>








