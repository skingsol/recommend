<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header_restaruant.jsp"%>
  
    
    <!-- 맛집 상세 이미지 표시 -->
    <div class="restaurant_profile">
    <section class="">
	<div class="restaurant_poto_slider">
		<div class="slider-container owl-carousel">
			<div class="item">
				<img src="/main/img/desert.png" alt="이미지 1">
			</div>
			<div class="item">
				<img src="/main/img/chinese.png" alt="이미지 2">
			</div>
			<div class="item">
				<img src="/main/img/japanese.png" alt="이미지 3">
			</div>
			<div class="item">
				<img src="/main/img/desert.png" alt="이미지 4">
			</div>
			<div class="item">
				<img src="/main/img/chinese.png" alt="이미지 5">
			</div>
			<div class="item">
				<img src="/main/img/japanese.png" alt="이미지 6">
			</div>
		</div>
	</div>
	</section>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<!-- 지도 가져다 보여줄 영역 -->
					<div id="map" style="width:100%;height:350px;"></div>					
				</div>
				<div class="col-md-6">
					<h2 class="display-5 fw-bolder"><span>맛집 이름</span></h2>
					<h5>
						<span>음식 카테고리</span>
					</h5>
					<div class="fs-5 mb-5">
						<div class="fs-5 mb-5">
							<strong class="fs-5 mb-5">별점: <span style="color: deepskyblue;">★</span> <span aria-label="점수: 5.0"  style="color: deepskyblue;">5.0</span></strong>
						</div>

					</div>

					<!-- 상세 정보 -->
					<div class="fs-5 mb-5">
						<table class="lead">
							<tbody>
								<tr class="">
									<th class="text-start">주소</th>
									<td  class="text-end"><span class="">서울 종로구 종로12길 15 코아빌딩1</span><br /> <span class="">관철동 13-13</span></td>
								</tr>

								<tr class="">
									<th class="text-start">전화번호</th>
									<td  class="text-end"><span>02-733-1119</span></td>
								</tr>

								<tr class="">
									<th class="text-start">OPEN & CLOSE</th>
									<td  class="text-end"><span>11:30</span> ~ <span>07:30</span></td>
								</tr>

							</tbody>
						</table>
					</div>

					<!-- 현위치에서 거리 계산 -->
					<div class="fs-5 mb-5">
						<strong><span class="fs-5 mb-5">내 위치에서 : </span> <span style="color: deepskyblue;">3<small>km</small></span> </strong>
					</div>

					<!-- 위시리스트 카운트 및 추가버튼  -->
					<div class="wishlist_count">
						<strong class="wishlist-text fs-5 mb-5">위시리스트 담긴 수 : <span class="wishlist-number" style="color: deeppink;">?</span> </strong> 
						<button class="wishlist-button btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-heart-fill me-1"></i> 위시리스트에 추가
						</button>
					</div>

				</div>
			</div>
				<div class="pt-1"></div>
				<div class="container">
				
					<!-- 메뉴 표기 -->
					<ul class="list-unstyled">
						<li class="d-flex justify-content-between align-items-center">
						<strong><span class="text-start">메뉴</span></strong> 
						<span class="text-muted">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</span> 
						<strong><span class="text-end">?.000<small>원</small></span></strong></li>
					</ul>
					
					<ul class="list-unstyled">
						<li class="d-flex justify-content-between align-items-center">
						<strong><span class="text-start">메뉴</span></strong> 
						<span class="text-muted">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</span> 
						<strong><span class="text-end">?.000<small>원</small></span></strong></li>
					</ul>
					
					<ul class="list-unstyled">
						<li class="d-flex justify-content-between align-items-center">
						<strong><span class="text-start">메뉴</span></strong> 
						<span class="text-muted">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</span> 
						<strong><span class="text-end">?.000<small>원</small></span></strong></li>
					</ul>
				</div>
		</div>
	</section>
	
	<!-- 리뷰 세션 -->
	<section class="pt-0 bg-light" id="reviews_section">	
		<!-- 리뷰 박스 -->
		<div class="pt-5">
		
			<!-- 리뷰 보여주기 반복할 구간 @@@@@ -->
			<!-- 리뷰 박스 상단 -->
			<form class="reviews-header" name="reviews-header" id="reviews-header" method="post">
				<figure class="figure">
					<!-- 프로필 사진 -->
					<div class="reviews-top">
						<img src="/restaurants/img/Ryan2.png" class="profile-picture" alt="...">
					</div>
				</figure>

				<div class="reviews-top-right">
					<img src="/restaurants/img/korean_food.png" class="review-image" alt="..."> 
					<img src="/restaurants/img/japanese.png" class="review-image" alt="..."> 
					<img src="/restaurants/img/chinese.png" class="review-image" alt="...">
				</div>
			</form>
			<!-- 리뷰 박스 하단 -->
			<form class="reviews-bottom" name="reviews-bottom" id="reviews-bottom" method="post">
				<textarea class="col-auto form-control" type="text" id="reviewContents" placeholder="리뷰 내용 보여주기" readonly></textarea>
			</form>
			<!-- 리뷰 보여주기 반복할 구간 @@@@@ -->
			
			<!-- 리뷰 보여주기 반복할 구간 @@@@@ -->
			<!-- 리뷰 박스 상단 -->
			<form class="reviews-header" name="reviews-header" id="reviews-header" method="post">
				<figure class="figure">
					<!-- 프로필 사진 -->
					<div class="reviews-top">
						<img src="/restaurants/img/Muji.png" class="profile-picture" alt="...">
					</div>
				</figure>

				<div class="reviews-top-right">
					<img src="/restaurants/img/japanese.png" class="review-image" alt="..."> 
					<img src="/restaurants/img/chinese.png" class="review-image" alt="...">
					<img src="/restaurants/img/korean_food.png" class="review-image" alt="..."> 
				</div>
			</form>
			<!-- 리뷰 박스 하단 -->
			<form class="reviews-bottom" name="reviews-bottom" id="reviews-bottom" method="post">
				<textarea class="col-auto form-control" type="text" id="reviewContents" placeholder="리뷰 내용 보여주기" readonly></textarea>
			</form>
			<!-- 리뷰 보여주기 반복할 구간 @@@@@ -->
			
			<!-- 리뷰 보여주기 반복할 구간 @@@@@ -->
			<!-- 리뷰 박스 상단 -->
			<form class="reviews-header" name="reviews-header" id="reviews-header" method="post">
				<figure class="figure">
					<!-- 프로필 사진 -->
					<div class="reviews-top">
						<img src="/restaurants/img/Ryan.jpg" class="profile-picture" alt="...">
					</div>
				</figure>

				<div class="reviews-top-right">
					<img src="/restaurants/img/chinese.png" class="review-image" alt="...">
					<img src="/restaurants/img/japanese.png" class="review-image" alt="..."> 
					<img src="/restaurants/img/korean_food.png" class="review-image" alt="..."> 
				</div>
			</form>
			<!-- 리뷰 박스 하단 -->
			<form class="reviews-bottom" name="reviews-bottom" id="reviews-bottom" method="post">
				<textarea class="col-auto form-control" type="text" id="reviewContents" placeholder="리뷰 내용 보여주기" readonly></textarea>
			</form>
			<!-- 리뷰 보여주기 반복할 구간 @@@@@ -->
			
		</div>
		<!-- 리뷰 작성 폼-->
		<form class="mt-3" name="myform" id="myform" method="post">		
		
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span>
				<input type="radio" name="reviewStar" value="5" id="rate1">
				<label for="rate1">★</label>
				<input type="radio" name="reviewStar" value="4" id="rate2">
				<label for="rate2">★</label>
				<input type="radio" name="reviewStar" value="3" id="rate3">
				<label for="rate3">★</label>
				<input type="radio" name="reviewStar" value="2" id="rate4">
				<label for="rate4">★</label>
				<input type="radio" name="reviewStar" value="1" id="rate5">
				<label for="rate5">★</label>
			</fieldset>
			<div>
				<textarea class="col-auto form-control" type="text" id="review-writeContents" placeholder="리뷰 작성"></textarea>
			</div>
			<div class="row mt-3">
				<div class="col">
					<div class="card">
						<div class="card-header">
							<i class="fa fa-file"></i> 파일첨부
						</div>
						<div class="card-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
					<div class="clearfix">
						<button class="" type="button" id="uproad_button">파일 첨부</button>
						<button class="" type="button" id="review_button">리뷰 작성</button>
					</div>
				</div>
			</div>
		</form>
		<div class="mb-5"></div>
	</section>
	</div>
<%@ include file="../include/footer_restaruant.jsp"%>
