<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>


<!-- 메인페이지 헤드2 -게시판 안내- -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">
				<li class=""><a href="..">
						<span>공지사항</span>
					</a></li>
				<li class=""><a href="..">
						<span>자주 묻는 질문</span>
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



			<div class="search-results">
				<h2>검색 결과 (nn건)</h2>
				<div class="sorting">
					<label for="sort-select">정렬 기준:</label>
					<select id="sort-select">
						<option value="distance">거리순</option>
						<option value="rating">별점순</option>
						<option value="review">평점순</option>
						<option value="recommendation">추천순</option>
					</select>
				</div>
				<ul id="results-list">
					<!-- 검색 결과 아이템들이 동적으로 추가될 위치 -->
				</ul>
			</div>

				<div class="row">
					<!-- 검색결과 리스트 반복 구간 -->

					<div class="col-12 boxing">
						<div class="post-entry horizontal d-md-flex">
							<div class="media">
								<a href="#">
									<img src="/main/img/korean.png" alt="음식점 썸네일" class="img-fluid">
								</a>
							</div>
							<div class="content_text">
								<span>
									<p class="store_category_result">
										<a href="#" class="store_name">상호명</a>
										&nbsp; &nbsp; 멕시코,남미음식
									</p>
									<div style="display: inline-block; vertical-align: top;">
										<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
									</div>
									<div style="display: inline-block;">
										<span class="review">3.8점(77)</span>
									</div>
									<div class="save_restaurant">
										<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
										<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
									</div>
								</span>
								<p class="store_link_result">
									<a href="">홈페이지 바로 가기</a>
								</p>
								<p class="store_address_result">서울특별시 마포구 월드컵로3길 14 지하1층</p>
								<div class="review_info">
									<p class="likes">
										<span>12</span>명이 추천했습니다.
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 반복 구간 종료 -->

					<!-- 검색결과 더보기 버튼 -->
					<div class="list_more_btn">
						<a aria-label="show more results" href="" alt="리스트 더 불러오는 쿼리문 연결된 링크">
							<img class="more_btn_icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAApCAYAAAChi6CMAAAABHNCSVQICAgIfAhkiAAAAc9JREFUWEftmY1NwzAQhe0JoBMAEwATkG7ABpQJ2m6QbgAT0E4ATNBsQLtBRmgnCO9JDgTj/DSxXUeypShq0tx9fo7vzo4siuJOCPGGg2e95biwlFJ+GO6d7ZIE9A7ebxsIDoCenI3Q4JjQhbq+xJkdqLat+jEFeBYKeBX6H1ilQ0boDqPkop+r3tAATkBUjoQLuFqbQ6AvYZUT9cIrsRCfvaEJCrUJboo6zvrBuUVoqnXV4mWCPx+ckZxomNCPeGbdMMwrAKcn2nX6d1laVxNLd7YLSeES7gfaqTSWjUdoy4LWx2lfjmz6Ge/rgcgxq4nVOaLHxqZKNmwxTr/A0LzBWAbwqQ1ntmwQmpmO9cMeh571HpSjG4AzcwbRhtYezKZNCwgXndz0hlbLtC8XVC028zFCH3tDUw2oneKUeFZ7UYVew7k+2QjFdo+JqK8fPbP+uiM0YZ8aCPYA9lrot6lBaK4+ZjgYCfRGddPQytPxpvG24QjtflTa14hEpb0prWqIdzi8Njhl1cetXsbyYFrc6vU1FL0LJpVJuWvqO8W/DoFOABy3eju+Xn9WLgs8pJefmTJU9yUgbvV2VFp02ep9Di5Ol70zbfWG9EWrOgrfyNkNmKd2R2cAAAAASUVORK5CYII=" alt="검색 결과 더보기 버튼 이미지">&nbsp; 검색 결과 더보기
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- 테스트 끝 -->

<script type="module" src="css/search/js/search.js"></script>
<%@ include file="./include/footer.jsp"%>