<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>


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
						<option value="review">리뷰순</option>
						<option value="recommendation">추천순</option>
					</select>
				</div>
			</div>

			<div class="row" id="search_result" ><%-- style='visibility: hidden'--%>
				<!-- 검색결과 리스트 반복 구간 -->
				<div class="col-12 boxing">
					<div class="post-entry horizontal d-md-flex">
						<div class="media">
							<a href="#">
								<img id="search_image" src="/main/img/korean.png" alt="음식점 썸네일" class="img-fluid">
							</a>
						</div>
						<div class="content_text">
							<div>
								<div class="store_category_result">
									<a href="#" id="search_title" class="store_name">상호명</a>
									&nbsp; &nbsp; <p id="search_category">멕시코,남미음식</p>
								</div>
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
							</div>
							<p class="store_link_result">
								<a id='search_link' target='_blank' class=''>홈페이지 바로가기</a> 
							</p>
							<p id = "search_road_address" class="store_address_result">서울특별시 마포구 월드컵로3길 14 지하1층</p>
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
				<div class="load_more">
					<a aria-label="show more results" href="" alt="리스트 더 불러오는 쿼리문 연결된 링크" id="list_more_btn">
						<img class="more_btn_icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAApCAYAAAChi6CMAAAABHNCSVQICAgIfAhkiAAAAc9JREFUWEftmY1NwzAQhe0JoBMAEwATkG7ABpQJ2m6QbgAT0E4ATNBsQLtBRmgnCO9JDgTj/DSxXUeypShq0tx9fo7vzo4siuJOCPGGg2e95biwlFJ+GO6d7ZIE9A7ebxsIDoCenI3Q4JjQhbq+xJkdqLat+jEFeBYKeBX6H1ilQ0boDqPkop+r3tAATkBUjoQLuFqbQ6AvYZUT9cIrsRCfvaEJCrUJboo6zvrBuUVoqnXV4mWCPx+ckZxomNCPeGbdMMwrAKcn2nX6d1laVxNLd7YLSeES7gfaqTSWjUdoy4LWx2lfjmz6Ge/rgcgxq4nVOaLHxqZKNmwxTr/A0LzBWAbwqQ1ntmwQmpmO9cMeh571HpSjG4AzcwbRhtYezKZNCwgXndz0hlbLtC8XVC028zFCH3tDUw2oneKUeFZ7UYVew7k+2QjFdo+JqK8fPbP+uiM0YZ8aCPYA9lrot6lBaK4+ZjgYCfRGddPQytPxpvG24QjtflTa14hEpb0prWqIdzi8Njhl1cetXsbyYFrc6vU1FL0LJpVJuWvqO8W/DoFOABy3eju+Xn9WLgs8pJefmTJU9yUgbvV2VFp02ep9Di5Ol70zbfWG9EWrOgrfyNkNmKd2R2cAAAAASUVORK5CYII=" alt="검색 결과 더보기 버튼 이미지">&nbsp; 검색 결과 더보기
					</a>
				</div>


				<!-- 검색결과 더보기 없을 때 맛집등록 요청 메뉴 화면에 보이기 -->

				<div class="sc-fHekdT cJGyla rq_reg_restaurant">
					<div class="sc-ifyqMZ ijJQce AddPoi">
						<h1>찾으시는 식당이 없으신가요?</h1>
						<button class="sc-blmETK dzoqkg Add__Poi__Button" id="rq_reg_btn" type="button">맛집 등록 요청하기</button>
						<span>보통 당일 등록이 이루어지며, 등록 시 즉시 푸시 알림을 드립니다.</span>
					</div>
				</div>


				<!-- 음식점 등록 요청 팝업창 -->
				<div class="modal" tabindex="-1" id="requestModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">맛집 등록 요청하기</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<input type="hidden" name="rno" id="rno" />
								<div class="form-group">
									<textarea name="restaurant_name" id="name" rows="1" class="form-control" placeholder="식당 이름"></textarea>
								</div>
								<div class="form-group">
									<textarea name="restarant_info" id="info" rows="4" class="form-control" placeholder="식당의 주소, 지역명, 전화번호 등 알고있는 정보를 자유롭게 입력해 주세요."></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="register_btn">등록 요청</button>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>


<!-- 테스트 끝 -->

<script type="module" src="/search/js/search.js"></script>
<%@ include file="include/footer.jsp"%>