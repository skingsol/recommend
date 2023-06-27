<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<footer id="footer">
	<div class="footer">
		<span class="logo ko"><em>All the information around me</em></span>
		<ul class="utill_m">
			<li><a href="https://corp.siksinhot.com/w2/company" target="_blank">회사 소개</a></li>
			<li><a href="/help/about">서비스 소개</a></li>
			<li><a href="/advertise"">광고 및 제휴</a></li>
			<li><a href="/hot/dining/main" target="_self">다이닝카드</a></li>
			<li style="font-weight: bold;"><a target="_blank" href="/static2/html/siksinhot/privacy.html">개인정보처리방침</a></li>
			<li><a target="_blank" href="/static2/html/siksinhot/service.html">이용약관</a></li>
			<li><a href="/help/list">도움말</a></li>
			<li><a href="/notice">공지사항</a></li>
			<li><a style="font-weight: bold; color: #ed6c00;" href="https://corp.siksinhot.com/w2/recruit" target="_blank">채용공고</a></li>
		</ul>

		<span>
			<strong>식신(주)</strong><em></em> 대표자 &nbsp; <strong>안병익</strong><em></em> 서울특별시 강남구 테헤란로8길 16, 9층 (지희빌딩) <br> 사업자등록번호 &nbsp; <strong>214-88-59748</strong><em></em> TEL&nbsp; <strong><a href="tel:1577-3957">1577-3957</a></strong><em></em> FAX&nbsp; <strong>02.533.1909</strong><em></em> EMAIL&nbsp;
			<a href="mailto:info@siksinhot.com">
				<strong>info@siksinhot.com</strong>
			</a>
			<br> Copyright (c) SIKSIN. All Rights Reserved.
		</span>
	</div>
</footer>

<script>
	const rawValue = '${result.title}';
	const textValue = rawValue.replace(/<[^>]*>/g, '');
</script>

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