<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header_restaruant.jsp"%>
  
  
    
    <!-- 맛집 상세 이미지 표시 -->
<div class="restaurant_profile">
	<div class="restaurant_poto_slider">
		<div class="slider-container owl-carousel">
			<c:forEach var="img" items="${result.imageLink}">
				<div class="item">
					<img src="${img}" alt="맛집이미지 1">
				</div>

			</c:forEach>

		</div>
	</div>


	<div class="row gx-4 gx-lg-5 align-items-center">
		<div class="col-md-6">

			<!-- 지도 가져다 보여줄 영역 -->
			<div id="map" style="width: 100%; height: 350px;"></div>

		</div>

		<!-- 상세정보 시작 부분 지도 오른편 -->
		<!-- 제목, 카테고리 평점 -->
		<div class="col-md-6">
			<div class="fs-5 mb-5">

				<div class="restaurant_title">
					<h2 class="display-5 fw-bolder" id="">
						<span>${result.title}</span>
					</h2>

					<div class="category&score">
						<h5>
							<span class="result_category">${result.category}</span>
						</h5>

						<div class="star_score">
							별점: <span> ★ </span> <span>5.0</span>
						</div>

					</div>
				</div>
			</div>




			<!-- 현위치에서 거리 계산 -->
			<div class="fs-5 mb-5">
				<strong><span class="fs-5 mb-5">내 위치에서 : </span> <span style="color: deepskyblue;"></span> </strong>
			</div>

			<!-- 위시리스트 카운트 및 추가버튼  -->
			<div class="wishlist_count">
				<strong class="wishlist-text fs-5 mb-5">위시리스트 담긴 수 : <span class="wishlist-number" style="color: deeppink;">?</span>
				</strong>
				<button class="wishlist-button btn btn-outline-dark flex-shrink-0" type="button">
					<i class="bi-heart-fill me-1"></i> 위시리스트에 추가
				</button>
			</div>

		</div>
	</div>
	<!-- 상세 정보 영역 -->
	<div class="detail">
		<!-- 주소정보 -->
		<div class="adress">
			<table>
				<tbody>
					<tr>
						<td class="text-center"><h5 style="font-weight: bold;">주소</h5></td>
					</tr>
					<tr>
						<td class="text-center"><span class="result_address">${result.address}</span><br> <span class="result_road_address">${result.roadAddress}</span></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div>
			<table class="number">
				<tbody>
					<tr class="">
						<th class="text-start">전화번호</th>
						<td class="text-end"><span>02-123-4567</span></td>
					</tr>

					<tr class="time">
						<th class="text-start">OPEN & CLOSE</th>
						<td class="text-end"><span>11:30</span> ~ <span>07:30</span></td>
					</tr>
				</tbody>
			</table>

		</div>
		<!-- 메뉴 표기 -->
		<div class="restaurant_menu">
			<!-- 반복될 메뉴 정보 영역 -->
			<ul class="result_menu">
				<li class="menu"><strong><span class="text-start">메뉴</span></strong> <span class="text-muted"> - - - - - - - - - - - - - - - - - - - -</span> <strong><span class="text-end">?.000<small>원</small></span></strong></li>
			</ul>

			<ul class="result_menu">
				<li class="menu"><strong><span class="text-start">메뉴</span></strong> <span class="text-muted"> - - - - - - - - - - - - - - - - - - - -</span> <strong><span class="text-end">?.000<small>원</small></span></strong></li>
			</ul>

			<ul class="result_menu">
				<li class="menu"><strong><span class="text-start">메뉴</span></strong> <span class="text-muted"> - - - - - - - - - - - - - - - - - - - -</span> <strong><span class="text-end">?.000<small>원</small></span></strong></li>
			</ul>

		</div>
	</div>


	<!-- 리뷰 보여주기 부분 start -->
	<div class="reviews_part">
		<div class="main">
			<ul class="comment">

				<%-- <c:forEach items="${store.reviewList }" var="reviewList"> --%>
				<li>
					<div class="client">

						<div class="review_header">
							<div>
								<div class="nickname">닉네임</div>
								<%-- <div class="nickname">${reviewList.nickname }</div> --%>
								<div>

									<%-- <c:forEach begin="0" end="4" var="i">
									<c:choose>
										<c:when test="${Math.round(reviewList.score) > i }"> --%>
									<i class="far fas fa-star">★★★★★</i>
									<%-- </c:when>
										<c:otherwise> --%>
									<i class="far fa-star"></i>
									<%-- </c:otherwise>
									</c:choose>
								</c:forEach> --%>
								</div>
							</div>
							<div class="create_date">
								<span>2023-06-28</span>
							</div>
							<%-- <span><fm:formatDate value="${reviewList.regiDate }" pattern="yyyy-MM-dd" /> </span> --%>
						</div>

						<div>
							<%-- <c:if test="${!empty reviewList.reviewImg }"> --%>
							<div class="review_img_box">
								<%-- <img src="${reviewList.reviewImg }" alt="이미지" class="review_img"> --%>
								<img src="/restaurants/img/japanese.png" alt="이미지" class="review_img">
							</div>
							<%-- </c:if> --%>
							<div class="review_contents">리뷰 내용 입니다.</div>
							<%-- <div>${reviewList.reviewContent }</div> --%>
						</div>
					</div>
				</li>
				<%-- </c:forEach> --%>
			</ul>
		</div>
		<!-- 리뷰 보여주기 부분 end -->


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
	</div>
</div>
<%@ include file="../include/footer_restaruant.jsp"%>
