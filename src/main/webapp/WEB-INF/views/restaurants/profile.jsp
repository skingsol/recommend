<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		<!-- 지도 가져다 보여줄 영역 -->
		<div class="col-md-6">
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>
   
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
						
					</div>
				</div>
			</div>

			<!-- 현위치에서 거리 계산 -->
			<div class="fs-5 mb-5">
				<strong><span class="fs-5 mb-5">내 위치에서 : </span> <span
					style="color: deepskyblue;"></span> </strong>
			</div>

			<!-- 위시리스트 카운트 및 추가버튼  -->
			<div class="wishlist_count">
				<strong class="wishlist-text fs-5 mb-5">위시리스트 담긴 수 : <span
					class="wishlist-number" id='wish-count' style="color: deeppink;"></span>
				</strong>
				<button class="wishlist-button btn btn-outline-dark flex-shrink-0"
					id="btn-wish-add" type="button">
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
						<td class="text-center"><span class="result_address">${result.address}</span><br>
							<span class="result_road_address">${result.roadAddress}</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>



	<!-- 리뷰 보여주기 부분 start -->
	<div class="reviews_part">
		<h5>리뷰</h5>

		<!-- 리뷰수정 모달 Start -->
		<div class="modal" tabindex="-1" id="reviewModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">리뷰 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="reviewId" id="reviewId" />
						<div class="form-group">
							<textarea name="reviewContent" id="reviewContent" rows="4"
								class="form-control"></textarea>
						</div>
						<div class="form-group">
							<input type="text" name="userid" id="userid" class="form-control"
								value="${userid}" readonly />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">수정</button>
					</div>
				</div>
			</div>
		</div>
		<!--리뷰수정 모달 end -->


		<div class="write_review">
			<form action="" id="insertForm">
				<div class="section-title">
					<%-- <input type="text" class="userId" id="userId" value="${userId}" readonly /> --%>
				</div>
				<div class="test2">
					<h5>리뷰 작성하기</h5>
					<span class="userId" id="userId">${pageContext.request.userPrincipal.name}</span>
					<div class="rating">
						<i class="fa fa-star-o" data-value="1"></i> <i
							class="fa fa-star-o" data-value="2"></i> <i class="fa fa-star-o"
							data-value="3"></i> <i class="fa fa-star-o" data-value="4"></i> <i
							class="fa fa-star-o" data-value="5"></i>
					</div>
					<div class="content_block">
						<textarea placeholder="내용 입력" id="reviewContent"></textarea>
					</div>
					<div class="button_box">
						<button type="submit" class="riew_button">
							<i class="fa fa-location-arrow"></i> 작성
						</button>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</div>



	<div class="mb-5"></div>
</div>

<%@ include file="../include/footer_restaruant.jsp"%>
