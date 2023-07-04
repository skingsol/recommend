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
						<div class="for_wishlist" data-title="${item.title}">
							<div class="restaurantTitle" data-title="${item.title}">${item.title}</div>
							<div class="address" data-title="${item.title}">${item.address}</div>
							<div class="wishlistDelete">
								<button class="delete_button" data-restaurantId="${item.restaurantId}" type="button">위시리스트 삭제</button>
							</div>
						</div>
					</c:forEach>
				</c:if>  
    

				<!-- 담긴 위시리스트가 없을 떄 -->
				<c:if test="${empty wishList}">
					<div class="for_wishlist">
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
<script src="/restaurants/js/result3.js"></script>
<%@ include file="include/footer.jsp"%>