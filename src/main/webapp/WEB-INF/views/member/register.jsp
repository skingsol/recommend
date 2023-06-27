<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<h1>회원 가입</h1>
<!-- 
		novalidate : html5 유효성 검증 사용하지 않겠음 
	    required, maxlength, max, min, email, url
	-->
<link href="/login/css/registerpage.css" rel="stylesheet">
<form action='<c:url value="/member/register" />' method="post"	novalidate>
	<div class="row">

		<table id="tbl_info" class="table table-user">
			<tbody>
				<tr id="tr_phone">
					<th>휴대전화인증</th>
					<td>

						<div id="div_phone_Y">
							<div id="contents">
								받는사람 : <input type="text" id="phone" name="phone" />
								<!-- 인증번호 받을사람 휴대폰 번호 -->
								<button type="button" id="send">전송</button>
								<br>
								<!-- 문자보내는 전송버튼 -->

								인증번호 : <input type="text" id="userNum">
								<!-- 인증번호 입력창 -->
								<button type="button" id="enterBtn">확인</button>
								<!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
							</div>
							<div id="phoneError" class="error"></div>


							<br> <br> 개인화된 맛집추천, 좋아요, 비밀번호찾기, 맛집평가작성, 포인트 적립 및 사용,
							할인쿠폰 등의 모든 서비스 혜택을 받을 수 있습니다.
						</div>


					</td>
				</tr>
				<tr id="tr_name">
					<th>아이디</th>
					<td><input class="input-text w400" type="text" id="userid"
						name="userid" placeholder="아이디를 입력하세요." maxlength="10" required
						pattern="^(?=[A-Za-z])(?=.*\d))[A-Za-z\d!@#$%]{5,12}$"><br>
						<br> <span id="lbl_name_check" class="fc-blue"></span>
						<div id="idError" class="error"></div>

						<div class="col-2">
							<button type="button" class="w-100 btn btn-danger">중복확인</button>
						</div>
				</tr>
				<tr id="tr_pw">
					<th>비밀번호</th>
					<td><input id="password" class="input-text w400"
						type="password" name="password" style="margin-bottom: 8px;"
						placeholder="비밀번호를 입력하세요." required
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%])[A-Za-z\d!@#$%]{5,15}$"
						aria-autocomplete="list">
						<div id="passwordError" class="error"></div> <br> <input
						id="password2" class="input-text w400" type="password"
						name="password2" placeholder="비밀번호 확인"><br> <br>
						특수문자(예: !@#$ 등) 1자 이상을 포함한 5~15 글자의 비밀번호로 설정해주세요.

						<div class="invalid-feedback">비밀번호를 확인해 주세요</div>
						<div id="password2Error" class="error"></div></td>
				</tr>

				<tr id="tr_email">
					<th>이메일</th>
					<td><input id="email" class="input-text w400" type="text"
						id="email" name="email" placeholder="이메일을 입력하세요.">
						<div id="emailError" class="error"></div> <br> <br> <span
						id="lbl_email_check" class="fc-blue"></span></td>
				</tr>
				<tr id="tr_intro">
					<th>자기소개</th>
					<td><input id="txt_intro" class="input-text w400" type="text"
						name="txt_intro" placeholder="자기소개를 입력하세요."
						onkeyup="CutStr(this, 25, 'lbl_limit');">
						<div id="txt_introError" class="error"></div> <br> <br>
						<div class="w400 tr">
							<span id="lbl_limit">0</span> ~ 25자
						</div></td>
				</tr>


				<tr id="tr_photo">
					<th>프로필 사진</th>
					<td>
						<input name="key" type="hidden" value="profile"> <input
							name="val" type="hidden" value=""> <input id="hid_photo"
							type="hidden" value=""> <input id="hid_image"
							name="fImage" type="file" class="hide">

						<div class="fl"
							style="width: 110px; height: 110px; background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/img-profile-default.png);">
							<img id="img_photo" src="" width="110" height="110"
								style="border-radius: 50%; display: none;">
						</div>
						<div class="clear"></div>
					<br> 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.</td>
				</tr>

			</tbody>
		</table>

		<div class="row tc" style="padding: 50px 0 55px 0;">
			<button id="btn_submit" type="submit" class="btn btn-mint w400 fs-16"
				style="height: 65px;">회원가입하기</button>
		</div>
	</div>

</form>
<!--<script>
	const path = '<c:url value="/list.do"/>';
</script>  -->

<script src='<c:url value="/login/js/register.js" />'></script>
<%@ include file="../include/footer.jsp"%>








