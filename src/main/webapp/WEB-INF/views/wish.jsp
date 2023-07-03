<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>


<!-- 메인페이지 헤드2 -게시판 안내- -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">
				<li class=""><a href="/board/list"> <span>공지사항</span>
				</a></li>
				<li class=""><a href=".."> <span>자주 묻는 질문</span>
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
				<!-- 검색결과 리스트 반복 구간 -->
				<c:forEach var="srch" items="${srchList}">
					<div class="col-12 boxing space_wrap">
						<div class="post-entry horizontal d-md-flex"
							style="align-items: center;">
							<div class="media">
								<a href=""> <img id="search_image" src="${srch.imageLink}"
									alt="음식점 썸네일" class="img-fluid" data-title="${srch.title}">
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
									<div style="display: inline-block; vertical-align: top;">
										<img class="score_image"
											src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png"
											alt="img" />
									</div> 
									<div style="display: inline-block;">
										<span class="review">3.8점(77)</span>
									</div>
									<div class="save_restaurant">
										<!-- 좋아요 누른 하트 : class="
										fafa-heart"  -->
										<span class="icon is-small"><i class="fa fa-heart-o"
											aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>

										
									</div>
								</div>
								<c:if test="${srch.homePageLink ne ''}">
									<p class="store_link_result">
										<a id='search_homePageLink' target='_blank' class='' href="${srch.homePageLink}">홈페이지 바로가기</a>
									</p>
								</c:if>
								<c:if test="${srch.homePageLink eq '' }">
									<p class="store_link_result">&nbsp;&nbsp;</p>
								</c:if>


								<p id="search_road_address" class="store_address_result">${srch.roadAddress}</p>
							<div class="review_info">
									<p class="likes">
										<span>12</span>명이 추천했습니다.
									</p>
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


	</div>
</div>


<script>
	// CSRF 토큰 값 생성
	const csrfToken = '${_csrf.token}';
</script>


<script src="/restaurants/js/result2.js"></script>
<!-- <script src="/search/js/request.js"></script> -->
<script src="/search/js/search.js"></script>
<%@ include file="include/footer.jsp"%>