<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>


<!-- 메인페이지 헤드2 -게시판 안내- -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">
				
				<li class=""><a href=".."> <span>게시판</span>
				</a></li>
			</ul>
		</nav>
		<!--// gnb -->
	</div>
	<!--// inner -->
</div>



<!-- 바디-->
<div class="section-latest">
	<div class="container">
		<div class="row gutter-v1 align-items-stretch mb-5">
			<div class="row" id="search_result">
				<div class="msg_wrap">
					<h3 style="font-weight: bold;">검색 결과가 존재하지 않습니다.</h3>
					<span>검색어를 확인해 주세요.</span>
				</div>

				<!-- 검색결과 더보기 없을 때 맛집등록 요청 메뉴 화면에 보이기 -->
				<div class="sc-fHekdT cJGyla rq_reg_restaurant">
					<div class="sc-ifyqMZ ijJQce AddPoi">
						<h1>찾으시는 식당이 없으신가요?</h1>
						<button class="sc-blmETK dzoqkg Add__Poi__Button" id="rq_reg_btn"
							type="button">맛집 등록 요청하기</button>
						<span>보통 당일 등록이 이루어지며, 등록 시 즉시 푸시 알림을 드립니다.</span>
					</div>
				</div>


				<!-- 음식점 등록 요청 팝업창 -->
		<form action='<c:url value="/api/search"/>' method="post"
			id="modalForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="modal" tabindex="-1" id="requestModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">맛집 등록 요청하기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<textarea name="reqName" rows="1" class="form-control reqName"
									placeholder="맛집 이름"></textarea>
							</div>
							<div class="form-group">
								<textarea name="reqContent" id="info" rows="2"
									class="form-control reqContent"
									placeholder="맛집의 주소, 지역명을 입력해 주세요. 구체적인 정보일수록 등록에 도움이 됩니다."></textarea>
							</div>
							
							<div class="form-group">
								<textarea name="reqContent" id="info" rows="4"
									class="form-control reqAddress"
									placeholder="맛집에 대한 정보를 자유롭게 입력해 주세요."></textarea>
							</div>
							<div class="form-group">
							<!-- 로그인 유저 아이디 정보 value에 가져오기 -->
		    					 <input type="text" class="form-control" id="loginUser" name="loginUser" value="${pageContext.request.userPrincipal.name}" readonly/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="register_btn">등록
								요청</button>
						</div>
					</div>
				</div>
			</div>
		</form>
			

			</div>
		</div>
	</div>
</div>




<!-- 테스트 끝 -->




<script type="module" src="/search/js/search.js"></script>
<%@ include file="include/footer.jsp"%>