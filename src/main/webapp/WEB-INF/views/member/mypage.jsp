<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login 하기</title>
<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<!-- Add this line to link the custom CSS -->
</head>
<body>
	<div id="div_activate">
		<input type="hidden" name="before_name" id="before-name" value="ssbcard">
		<div>
			<div class="title">
				<div class="row">프로필 수정하기</div>
			</div>
			<!-- 회원가입 폼 -->
			<div class="row">

				<table id="tbl_info" class="table table-user">
					<tbody>
						<tr id="tr_photo">
							<th>프로필 사진</th>
							<td><iframe name="fImage" frameborder="0" style="display: none; width: 0; height: 0;"></iframe>
								<form id="frm_image" method="POST" action="/2018/ajax/uploader.php" target="fImage" enctype="multipart/form-data">
									<input name="key" type="hidden" value="profile"> <input name="val" type="hidden" value="2wlNkbXYa1uoaOlujVeDIw=="> <input id="hid_photo" type="hidden" value=""> <input id="hid_image" name="fImage" type="file" class="hide">

									<div class="fl" style="width: 110px; height: 110px; background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/img-profile-default.png);">
										<img id="img_photo" src="" width="110" height="110" style="border-radius: 50%; display: none;">
									</div>
									<div class="fl" style="height: 110px; padding-top: 70px;">
										<button id="btn_image" type="button" class="btn btn-black w150" style="margin-left: 12px;">찾아보기</button>
									</div>
									<div class="clear"></div>
								</form> <br> <br> 다이닝코드의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.</td>
						</tr>
						<tr id="tr_name">
							<th>닉네임</th>
							<td><input id="txt_name" class="input-text w400" type="text" value="" placeholder="닉네임"><br> <br> <span id="lbl_name_check" class="">다이닝코드에서 회원정보로 등록하실 닉네임을 입력해주세요. (영문 또는 숫자 4~10자, 한글 포함 시 2~10자)</span></td>
						</tr>
						<tr id="tr_intro">
							<th>자기소개</th>
							<td><input id="txt_intro" class="input-text w400" type="text" value="" placeholder="자기소개를 입력하세요." onkeyup="CutStr(this, 25, 'lbl_limit');"><br> <br>
								<div class="w400 tr">
									<span id="lbl_limit">0</span> / 25
								</div></td>
						</tr>
						<tr id="tr_email">
							<th>이메일</th>
							<td><input id="txt_email" class="input-text w400" type="text" value="" placeholder="이메일"><br> <br> <span id="lbl_email_check" class="">다이닝코드에서 이용하실 이메일을 입력해 주세요.</span></td>
						</tr>
						<tr id="tr_phone">
							<th>휴대전화인증</th>
							<td>
								<div id="div_phone_Y">
									<span class="fs-20 fw-b"> <span class="fc-mint">인증필요 <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-on.png" style="width: 16px; border-radius: 50%;"></span></span>
									<button id="btn_phone" type="button" class="btn btn-black w200">휴대전화인증</button>
									<br> <br> 개인화된 맛집추천, 좋아요, 비밀번호찾기, 맛집평가작성, 포인트 적 립 및 사용, 다코박스 상품구매, 할인쿠폰 등의 모든 서비스 혜택을 받을 수 있습니다.
								</div>
							</td>
						</tr>
						<tr id="tr_pw">
							<th>비밀번호</th>
							<td>
								<div id="div_password_N" style="display: none;">
									<span class="fs-20 fw-b">미설정</span>
									<button id="btn_password" type="button" class="btn btn-black w200" style="margin-left: 24px;">비밀번호 설정하기</button>
									<br> <br> 페이스북 가입자가 비밀번호를 설정하시면 인증받으신 이메일 혹은 휴대전화번호로도 로그인이 가능합니다.
								</div>
								<div id="div_password_Y">
									<input id="txt_password" class="input-text w400" type="password" style="margin-bottom: 8px;" placeholder="비밀번호"><br> <input id="txt_password2" class="input-text w400" type="password" placeholder="비밀번호 확인"><br> <br> 특수문자(예: !@#$ 등) 1자 이상을 포함한 10~15 글자의 비밀번호로 설정해주세요.
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="row" style="padding: 24px 0 0 40px;">
				<a id="btn_deactivate" href="#" style="color: #222222; text-decoration: none;">회원탈퇴하기</a> <span> </span>
				<div class="row tc" style="padding: 50px 0 55px 0;">
					<button id="btn_submit" type="button" class="btn btn-mint w400 fs-16" style="height: 65px;">변경사항저장</button>
				</div>
				</span>
			</div>
		</div>

		<!-- 이미지 처리
		<iframe name="fImage" src="" class="hide"></iframe>

		<div id="div_activated" class="container" style="display: none;">
			<div class="row w400">
				<div class="title bb-gray tc">가입완료</div>
				<div class="fs-15 fw-b tc" style="padding: 24px 0;">회원가입이 완료되었습니다. 감사합니다.</div>
				<div class="tc">
					로그인 시 휴대전화번호로 로그인하실 수 있습니다.<br> 휴대전화 인증 및 회원정보 수정은 [홈 &gt; 나의프로필]에서 하실 수 있습니다.
				</div>
			</div>
			<div class="row tc" style="padding: 50px 0 55px 0;">
				<button id="btn_login" type="button" class="btn btn-mint w400">확인</button>
			</div>
		</div> -->

		<!-- s: footer-wrap //-->
		<footer id="footer-wrap" class="div-wrapper">
			<div id="footer">
				<ul class="f-gnb">
					<li><a href="/business">데이터 제휴 문의</a></li>
					<li><a href="/policy.privacy.php">개인정보처리방침</a></li>
					<li><a href="/policy.service.php">이용약관</a></li>
					<li><a href="/policy.location.php">위치기반 서비스 이용약관</a></li>
				</ul>
				<ul class="f-copy">
					<li>(주)다이닝코드</li>
					<!-- <li>대표이사 : 신효섭 </li> -->
					<li>소재지 : 서울특별시 강남구 테헤란로79길 6</li>
				</ul>
				<p class="f-email">이메일 문의 : contact@diningcode.com</p>
				<ul class="f-desc">
					<li>전화 문의 : 02-457-1304 (평일 : 10:00 ~ 19:00, 주말/공휴일 제외)</li>
					<li>Copyright ⓒ 2023 Diningcode</li>
				</ul>
			</div>
		</footer>
		<!-- e: footer-wrap //-->
	</div>
</body>
</html>