<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header_restaruant.jsp"%>


<div class="body">
	<div class="block">
		<form action="" id="wishListTable">
			<h4>내 위시 리스트</h4>
			<div class="forTable">
				
				<!-- 담긴 위시리스트가 있을 때 -->
				<c:if test="${not empty wishList}">
					<c:forEach items="${wishList}" var="item">
						<div class="test3">
							<div class="restaurantTitle">${item.title}</div>
							<div class="address">${item.address}</div>
							<div class="wishlistCount">위시리스트 담긴 수 : ${item.wishlistCount}</div>
							<div class="countReviews">맛집 리뷰 수 : ${item.reviewCount}</div>
							<div class="wishlistDelete">
								<button class="delete_button" data-restaurantId="${item.restaurantId}" type="button">위시리스트 삭제</button>
							</div>
						</div>
					</c:forEach>
				</c:if>
  

				<!-- 담긴 위시리스트가 없을 떄 -->
				<c:if test="${empty wishList}">
					<div class="test3">
						<div class="restaurantTitle">
						<h2 class="emptyWishList">위시리스트가 비어있습니다</h2>
						</div>						
					</div>
				</c:if>


			</div>

		</form>	
	</div>
</div>  

<script>
const userid = '${pageContext.request.userPrincipal.name}';
</script>
<script src="/restaurants/js/deleteWishlist.js"></script>

<%@ include file="include/footer.jsp"%>