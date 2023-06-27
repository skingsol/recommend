<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 메인페이지 헤드2 -게시판 안내- -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">
				<li class="notice"><a href='<c:url value="/board/notice"  />'>
						<span>공지사항</span>
					</a></li>
				<li class="qna"><a href='<c:url value="/board/qna"  />'>
						<span>자주 묻는 질문</span>
					</a></li>
			</ul>
		</nav>
		<!--// gnb -->
	</div>
	<!--// inner -->
</div>



<!-- 대문 이미지 슬라이드 -->
<div class="slideshow-container">
	<div class="slides">
		<div class="mySlides fade1 active">
			<img src="https://file.rankingdak.com/image/RANK/BANNER/AR_IMG_1/20230620/IMG1687lsj254602389.jpg" style="width: 100%">
		</div>
		<div class="mySlides fade1 active">
			<img src="https://file.rankingdak.com/image/RANK/BANNER/AR_IMG_1/20230615/IMG1686JWG791986458.jpg" style="width: 100%">
		</div>
		<div class="mySlides fade1 active">
			<img src="https://file.rankingdak.com/image/RANK/BANNER/AR_IMG_1/20230620/IMG1687cTW219471789.jpg" style="width: 100%">
		</div>
		<div class="slide_btn" style="text-align: center">
			<div class="dot active"></div>
			<div class="dot"></div>
			<div class="dot"></div>
		</div>
	</div>
</div>




<!-- 메뉴 선택 박스 -->
<section class="box highlight">
	<ul class="special">
		<li><a href="#korean" id="scroll_move">
				<img src="/main/img/korean.png" alt="" /> <span>한식</span>
			</a></li>
		<li><a href="#japanese" id="scroll_move">
				<img src="/main/img/japanese.png" alt="" /> <span>일식</span>
			</a></li>
		<li><a href="#chinese" id="scroll_move">
				<img src="/main/img/chinese.png" alt="" /> <span>중식</span>
			</a></li>
		<li><a href="#western" id="scroll_move">
				<img src="/main/img/western.png" alt="" /> <span>양식</span>
			</a></li>
		<li><a href="#fastfood" id="scroll_move">
				<img src="/main/img/fastfood.png" alt="" /> <span>패스트 푸드</span>
			</a></li>
		<li><a href="#desert" id="scroll_move">
				<img src="/main/img/desert.png" alt="" /> <span>카페</span>
			</a></li>
	</ul>
</section>

<!-- 중간 : 카테고리별 음식점 랭킹순 정렬 -->
<div class="category_section_wrap">
	<!-- 라인 반복 -->
	<section id="korean" class="bg-white category_section_line_wrap">
		<div class="loop">
			<span class="food_category_name"><a href='<c:url value="/search?keyword=한식"  />'>#한식</a></span>
		</div>
		<div class="container mx-auto flex items-center flex-wrap ">
		
			<!-- 라인 내 음식점 반복구간 -->
			
				<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link" >
					
					<a href="">
						<img src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230106/IMG1672nhu966250394_330_330.jpg" data-title="파스타즈">
					</a>
						
						<div id="shortcuts" class="pt-3 flex items-center">
							<div class="line_diveider">							
								<p>							
									<a href="">
										<span class="restaurant_name">파스타즈</span> <strong class="point search_point "></strong>							
									</a>
								</p>
								<div id="star_image" style="display: inline-block; vertical-align: top;">
									<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
								</div>
								<div id="review_score" style="display: inline-block;">
									<span class="review">3.8점(77)</span>
								</div>
							</div>
							<div class="save_restaurant">
								<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
								<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
							</div>
						</div>					
				</div>			
		</div>
	</section>
	
	


	<!-- 일식 카테고리 -->
	<section id="japanese" class="bg-white category_section_line_wrap">
		<div class="loop">
			<span class="food_category_name"><a href='<c:url value="/search?keyword=일식"  />'>#일식</a></span>
		</div>
		<div class="container mx-auto flex items-center flex-wrap ">
			<!-- 라인 내 음식점 반복구간 -->
			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link">
				<a href="" class="image_link">
					<img src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230106/IMG1672nhu966250394_330_330.jpg">
				</a>
				<div id="shortcuts" class="pt-3 flex items-center">
					<div class="line_diveider">
						<p>
							<a href="..." alt="음식점 상세페이지로 연결 링크">
								#상호명 <strong class="point search_point "></strong>
							</a>
						</p>
						<div id="star_image" style="display: inline-block; vertical-align: top;">
							<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
						</div>
						<div id="review_score" style="display: inline-block;">
							<span class="review">3.8점(77)</span>
						</div>
					</div>
					<div class="save_restaurant">
						<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
						<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- 중식 카테고리 -->
	<section id="chinese" class="bg-white category_section_line_wrap">
		<div class="loop">
			<span class="food_category_name"><a href='<c:url value="/search?keyword=중식"  />'>#중식</a></span>
		</div>
		<div class="container mx-auto flex items-center flex-wrap ">
			<!-- 라인 내 음식점 반복구간 -->
			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link">
				<a href="" class="image_link">
					<img src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230106/IMG1672nhu966250394_330_330.jpg">
				</a>
				<div id="shortcuts" class="pt-3 flex items-center">
					<div class="line_diveider">
						<p>
							<a href="..." alt="음식점 상세페이지로 연결 링크">
								#상호명 <strong class="point search_point "></strong>
							</a>
						</p>
						<div id="star_image" style="display: inline-block; vertical-align: top;">
							<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
						</div>
						<div id="review_score" style="display: inline-block;">
							<span class="review">3.8점(77)</span>
						</div>
					</div>
					<div class="save_restaurant">
						<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
						<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- 양식 카테고리 -->
	<section id="western" class="bg-white category_section_line_wrap">
		<div class="loop">
			<span class="food_category_name"><a href='<c:url value="/search?keyword=양식"  />'>#양식</a></span>
		</div>
		<div class="container mx-auto flex items-center flex-wrap ">
			<!-- 라인 내 음식점 반복구간 -->
			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link">
				<a href="" class="image_link">
					<img src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230106/IMG1672nhu966250394_330_330.jpg">
				</a>
				<div id="shortcuts" class="pt-3 flex items-center">
					<div class="line_diveider">
						<p>
							<a href="..." alt="음식점 상세페이지로 연결 링크">
								#상호명 <strong class="point search_point "></strong>
							</a>
						</p>
						<div id="star_image" style="display: inline-block; vertical-align: top;">
							<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
						</div>
						<div id="review_score" style="display: inline-block;">
							<span class="review">3.8점(77)</span>
						</div>
					</div>
					<div class="save_restaurant">
						<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
						<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- 패스트푸드 카테고리 -->
	<section id="fastfood" class="bg-white category_section_line_wrap">
		<div class="loop">
			<span class="food_category_name"><a href='<c:url value="/search?keyword=패스트푸드"  />'>#패스트 푸드</a></span>
		</div>
		<div class="container mx-auto flex items-center flex-wrap ">
			<!-- 라인 내 음식점 반복구간 -->
			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link" >
				<a href="" class="image_link">
					<img src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230106/IMG1672nhu966250394_330_330.jpg">
				</a>
				<div id="shortcuts" class="pt-3 flex items-center">
					<div class="line_diveider">
						<p>
							<a href="..." alt="음식점 상세페이지로 연결 링크">
								#상호명 <strong class="point search_point "></strong>
							</a>
						</p>
						<div id="star_image" style="display: inline-block; vertical-align: top;">
							<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
						</div>
						<div id="review_score" style="display: inline-block;">
							<span class="review">3.8점(77)</span>
						</div>
					</div>
					<div class="save_restaurant">
						<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
						<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
					</div>
				</div>
			</div>

		</div>
	</section>	
	
	<!-- 카페 카테고리 -->
	<section id="desert" class="bg-white category_section_line_wrap">
		<div class="loop">
			<span class="food_category_name"><a href='<c:url value="/search?keyword=카페"  />'>#카페</a></span>
		</div>
		<div class="container mx-auto flex items-center flex-wrap ">
			<!-- 라인 내 음식점 반복구간 -->
			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link">
				<a href="" class="image_link">
					<img src="https://file.rankingdak.com/image/RANK/PRODUCT/PRD001/20230106/IMG1672nhu966250394_330_330.jpg">
				</a>
				<div id="shortcuts" class="pt-3 flex items-center">
					<div class="line_diveider">
						<p>
							<a href="..." alt="음식점 상세페이지로 연결 링크">
								#상호명 <strong class="point search_point "></strong>
							</a>
						</p>
						<div id="star_image" style="display: inline-block; vertical-align: top;">
							<img class="score_image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png" alt="img" />
						</div>
						<div id="review_score" style="display: inline-block;">
							<span class="review">3.8점(77)</span>
						</div>
					</div>
					<div class="save_restaurant">
						<!-- 좋아요 누른 하트 : class="fa fa-heart"  -->
						<span class="icon is-small"><i class="fa fa-heart-o" aria-hidden="true"></i></span> &nbsp;<span class="like-num"></span>
					</div>
				</div>
			</div>

		</div>
	</section>
</div>



<script src="/restaurants/js/result.js"></script>
<script type="module" src="/main/js/main.js"></script>
<%@ include file="../include/footer.jsp"%>