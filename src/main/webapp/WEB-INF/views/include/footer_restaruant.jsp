<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<footer id="footer"  >
	<div class="footer">
		<span class="logo ko"><img src="/main/img/BaB.png" style="height: 100px;"/><em>All the information around me</em></span>
		<ul class="utill_m">
			<li><a href="/">Bab(맛집 추천은 역시 Bab!)</a></li>
			<li style="font-weight: bold;"><a target="_blank" href="/member/step1">개인정보처리방침 및 이용약관</a></li>
			<li><a href="/board/list">공지사항</a></li>
		</ul>

		<span>
			<strong>밥(주)</strong><em></em> 대표자 &nbsp; <strong>김밥</strong><em></em> 서울시 종로구 종로12길 15 코아빌딩 1 901호 <br> 사업자등록번호 &nbsp; <strong>123-45-67890</strong><em></em> TEL&nbsp; <strong><a href="tel:1000-8000">1000-8000</a></strong><em></em> FAX&nbsp; <strong>02.1000.8001</strong><em></em> EMAIL&nbsp;
			<a href="masterbab@naver.com">
				<strong>info@bab.com</strong>
			</a>
			<br> Copyright (c) Bab. All Rights Reserved.
		</span>
	</div>
</footer>


<script>
	const rawValue = '${result.title}';
	const textValue = rawValue.replace(/<[^>]*>/g, '');
</script>
  

<!-- 리뷰용 변수담기 -->
<script>
const restaurantId = '${restaurantId}'
const title = '${detail.title}';
const userid = '${pageContext.request.userPrincipal.name}';
//CSRF 토큰 값 생성
const csrfToken = '${_csrf.token}';
</script>

<script src="/restaurants/js/wishlist.js"></script>
<script src="/restaurants/js/review.js"></script>
<!-- 좌표를 바탕으로 거리계산하기 -->
<script src="/restaurants/js/distance.js"></script>

<!-- kakaoMap api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7981cac6d0986eb33d99fce3ac0af96a&libraries=services"></script>
<script src="/restaurants/js/kakaoMap.js"></script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- Owl Carousel JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider-container').owlCarousel({
			loop : true,
			margin : 10,
			nav : true,
			navText : [ '<', '>' ], // Change the nav buttons content
			navClass : [ 'custom-nav custom-prev', 'custom-nav custom-next' ], // Add classes for the nav buttons
			autoplay : false,
			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 2
				},
				1000 : {
					items : 4
				}
			}
		});
	});
</script>
</body>
</html>