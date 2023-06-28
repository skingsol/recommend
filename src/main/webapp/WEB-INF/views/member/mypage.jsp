<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<link href="/login/css/mypage.css" rel="stylesheet">
<!-- Add this line to link the custom CSS -->
</head>
<body>
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
						<tr id="tr_photo">
							<th>프로필 사진</th>
							<td><iframe name="fImage" frameborder="0"
									style="display: none; width: 0; height: 0;"></iframe>
								<form id="frm_image" method="POST"
									action="/2018/ajax/uploader.php" target="fImage"
									enctype="multipart/form-data">
									<input name="key" type="hidden" value="profile"> <input
										name="val" type="hidden" value="2wlNkbXYa1uoaOlujVeDIw==">
									<input id="hid_photo" type="hidden" value=""> <input
										id="hid_image" name="fImage" type="file" class="hide">

									<div class="fl"
										style="width: 110px; height: 110px; background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/img-profile-default.png);">
										<img id="img_photo" src="" width="110" height="110"
											style="border-radius: 50%; display: none;">
									</div>
									<div class="fl" style="height: 110px; padding-top: 70px;">
										<button id="btn_image" type="button"
											class="btn btn-black w150" style="margin-left: 12px;">찾아보기</button>
									</div>
									<div class="clear"></div>
								</form> <br> <br>회원 프로필 사진으로 사용될 이미지를 등록해 주세요.</td>
						</tr>
						<tr id="tr_name">
							<th>닉네임</th>
							<td><input id="txt_name" class="input-text w400" type="text"
								value="" placeholder="닉네임"><br> <br> <span
								id="lbl_name_check" class="">회원정보로 등록하실 닉네임을 입력해주세요. (영문
									또는 숫자 4~10자, 한글 포함 시 2~10자)</span></td>
						</tr>
						<tr id="tr_intro">
							<th>자기소개</th>
							<td><input id="txt_intro" class="input-text w400"
								type="text" value="" placeholder="자기소개를 입력하세요."
								onkeyup="CutStr(this, 25, 'lbl_limit');"><br> <br>
								<div class="w400 tr">
									<span id="lbl_limit">0에서 25글자까지 입력해주세요.</span>
								</div></td>
						</tr>
						<tr id="tr_email">
							<th>이메일</th>
							<td><input id="txt_email" class="input-text w400"
								type="text" value="" placeholder="이메일"><br> <br>
								<span id="lbl_email_check" class="">이용하실 이메일을 입력해 주세요.</span></td>
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
								<div id="div_password_Y">
									<a class="nav-link" href="/member/changePwd">비밀번호변경</a>
								</div>
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
		</div>
-->

	</div>
</body>
<%@ include file="../include/footer.jsp"%>