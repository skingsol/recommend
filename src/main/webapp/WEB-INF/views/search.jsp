<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<!-- 메인페이지 헤드2 -게시판 안내- -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">

				<li class=""><a
					href="/board/list?page=1&amount=10&type=&keyword="> <span>게시판</span>
				</a></li>
			</ul>
		</nav>
		<!--// gnb -->
	</div>
	<!--// inner -->
</div>


<!-- 바디-->
<div class="section-latest">
	<div class="container" id="listContainer">
		<div class="row gutter-v1 align-items-stretch mb-5">




			<!-- 검색결과 리스트 반복 구간 -->
			<div class="row" id="search_result" data-name="loop_section">
				<c:forEach var="srch" items="${srchList}">

					<div class="col-12 boxing space_wrap">
						<div class="post-entry horizontal d-md-flex"
							style="align-items: center;">
							<div class="media">
								<input type="hidden" class="restaurantId"
									value="${wishList.restaurantId}"
									data-restaurantId="${item.restaurantId}" /> <a href=""> <img
									id="search_image" src="${srch.imageLink}" alt="음식점 썸네일"
									class="img-fluid" data-title="${srch.title}"
									data-image="${srch.imageLink}">
								</a>
							</div>
							<div class="content_text">
								<div>
									<div class="store_category_result"
										style="display: flex; align-items: center;">
										<a href="" id="search_title" class="store_name"
											data-title="${srch.title}">${srch.title}</a> &nbsp;
									</div>
									<p id="search_category">${srch.category}</p>


								</div>
								<c:if test="${srch.homePageLink ne ''}">
									<p class="store_link_result">
										<a id='search_homePageLink' target='_blank'
											data-home="${srch.homePageLink}" href="${srch.homePageLink}"
											style="color: blue;">홈페이지 바로가기</a>
									</p>
								</c:if>
								<c:if test="${srch.homePageLink eq '' }">
									<p class="store_link_result">&nbsp;&nbsp;</p>
								</c:if>
								<p id="search_road_address" class="store_address_result"" >지번
									주소: ${srch.address}</p>
								<p id="search_road_address" class="store_address_result"" >도로명
									주소: ${srch.roadAddress}</p>
								<div class="review_info">
									<p class="likes">
										<span>12</span>명이 추천했습니다.
									</p>
								</div>

			<div class="dataLink">
								<input type="hidden" class="homePageLink" value="${srch.homePageLink}">
								<input type="hidden" class="title" value="${srch.title}">
								<input type="hidden" class="imageLink" value="${srch.imageLink}">
								<input type="hidden" class="roadAddress" value="${srch.roadAddress}">
			
			<!-- 카톡 공유하기 기능 -->
								<a id="kakao-link-btn" id="kakao"
									href="javascript:kakaoShare();"> <img style="height: 40px;"
									name="kakao-icon"
									src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
								</a>
								<!-- 공유하기 기능 종료 -->
			</div>
			
			
								

							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 반복 구간 종료 -->

			</div>

			<!-- 검색결과 더보기 버튼 : naver 지역검색 api 로는 구현 불가 -->
			<div class="load_more">
				<a aria-label="show more results" href=""
					alt="리스트 더 불러오는 쿼리문 연결된 링크" id="list_more_btn"> <img
					class="more_btn_icon"
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAApCAYAAAChi6CMAAAABHNCSVQICAgIfAhkiAAAAc9JREFUWEftmY1NwzAQhe0JoBMAEwATkG7ABpQJ2m6QbgAT0E4ATNBsQLtBRmgnCO9JDgTj/DSxXUeypShq0tx9fo7vzo4siuJOCPGGg2e95biwlFJ+GO6d7ZIE9A7ebxsIDoCenI3Q4JjQhbq+xJkdqLat+jEFeBYKeBX6H1ilQ0boDqPkop+r3tAATkBUjoQLuFqbQ6AvYZUT9cIrsRCfvaEJCrUJboo6zvrBuUVoqnXV4mWCPx+ckZxomNCPeGbdMMwrAKcn2nX6d1laVxNLd7YLSeES7gfaqTSWjUdoy4LWx2lfjmz6Ge/rgcgxq4nVOaLHxqZKNmwxTr/A0LzBWAbwqQ1ntmwQmpmO9cMeh571HpSjG4AzcwbRhtYezKZNCwgXndz0hlbLtC8XVC028zFCH3tDUw2oneKUeFZ7UYVew7k+2QjFdo+JqK8fPbP+uiM0YZ8aCPYA9lrot6lBaK4+ZjgYCfRGddPQytPxpvG24QjtflTa14hEpb0prWqIdzi8Njhl1cetXsbyYFrc6vU1FL0LJpVJuWvqO8W/DoFOABy3eju+Xn9WLgs8pJefmTJU9yUgbvV2VFp02ep9Di5Ol70zbfWG9EWrOgrfyNkNmKd2R2cAAAAASUVORK5CYII="
					alt="검색 결과 더보기 버튼 이미지">&nbsp; 검색 결과 더보기
				</a>
			</div>
		</div>


		<!-- 맛집 등록 요청 버튼 -->
		<div class="sc-fHekdT cJGyla rq_reg_restaurant">
			<div class="sc-ifyqMZ ijJQce AddPoi">
				<h1>찾으시는 식당이 없으신가요?</h1>
				<button class="sc-blmETK dzoqkg Add__Poi__Button" id="rq_reg_btn"
					type="button">맛집 등록 요청하기</button>
				<span>보통 당일 등록이 이루어지며, 등록 시 즉시 등록하신 이메일로 안내 드립니다.</span>
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
									class="form-control reqAddress"
									placeholder="맛집의 주소, 지역명을 입력해 주세요. 구체적인 정보일수록 등록에 도움이 됩니다."></textarea>
							</div>
							<div class="form-group">
								<textarea name="reqContent" id="info" rows="4"
									class="form-control reqContent"
									placeholder="맛집에 대한 정보를 자유롭게 입력해 주세요."></textarea>
							</div>
							<div class="form-group">
								<!-- 로그인 유저 아이디 정보 value에 가져오기 -->
								<input type="text" class="form-control" id="loginUser"
									name="loginUser"
									value="${pageContext.request.userPrincipal.name}" readonly />
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


<script>
	// CSRF 토큰 값 생성
	const csrfToken = '${_csrf.token}';
</script>



<script src="/main/js/wish.js"></script>
<script src="/kakao/kakao.js"></script>
<script src="/restaurants/js/result2.js"></script>
<script src="/search/js/search.js"></script>
<%@ include file="include/footer.jsp"%>