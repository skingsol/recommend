<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메인페이지 & 서치 페이지 디자인 영역  -->
<!-- 항상 상위 유지할 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<!-- main category select box -->
<link rel="stylesheet" href="/main/css/main/main.css" />

<!-- main category section -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">

<!-- TopBar section by Bootstrap sb_admin -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="/main/css/main/sb-admin-2.min.css" rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="/main/vendor/jquery/jquery.min.js"></script>
<script src="/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- custom design css -->
<link rel="stylesheet" type="text/css" href="/main/css/main/custom.css">
<link rel="stylesheet" type="text/css"
	href="/main/css/main/font-awesome.min.css">

<!-- search page css -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/search/css/owl.carousel.min.css">
<link rel="stylesheet" href="/search/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/search/fonts/style.css">
<link rel="stylesheet" href="/search/fonts/flaticon.css">
<link rel="stylesheet" href="/search/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="/search/css/aos.css">
<link rel="stylesheet" href="/search/css/style.css">
<link rel="stylesheet" href="/search/css/search.css">

<!-- 메인페이지 대문 슬라이드 및 푸터영역 stylesheet -->
<link rel="stylesheet" href="/main/css/include.css">

<!-- 메인페이지 & 서치 페이지 디자인 영역 종료 -->




</head>
<body>

	<nav class="navbar navbar-expand navbar-light bg-white topbar "
		id="header_center">
		<div class="desc_header">
			<div class="desc_header_wrap">
				<div class="main_logo">
					<a href="/"> <img class="main_logo_img"
						src="/main/img/korean_food.png" alt="로고" />
					</a>
				</div>
				
				
				<form action='<c:url value="/api/search/query=${query}"/>' class="searchForm todo-form" id="searchForm">
					<div class="search_bar">
						<div class="search_input_bar">
							<input type="search" class="search_input"
								placeholder="지역, 음식 또는 식당명 입력" value="" />
							<button class="search_icon" type="submit" aria-label="검색하기 버튼"></button>
						</div>
				<div class="todo-inner">
					<div class="allDelete off">
						<h5 class="tit">최근 검색어</h5>
						<span class="x-btn">모두 지우기 ❌</span>
					</div>
					<p class="txt"></p>
					<ul id="todo-list"></ul>
				</div>
					</div>
				</form>



				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">아이디 님</span>
							<img class="img-profile rounded-circle"
							src="main/img/undraw_profile.svg">
					</a> <!-- Dropdown - User Information -->

						<div class="dropdown-menu dropdown-menu-right  animated--grow-in"
							aria-labelledby="userDropdown" style="text-align: center;">
							
							<!-- 사용자 인증 여부에 따라 로그인/로그아웃 페이지 설정 -->
							<sec:authorize access="isAnonymous()">
								<a class="dropdown-item" href='<c:url value="/member/login"  />'>로그인
								</a>
							</sec:authorize>

							<a class="dropdown-item" href='<c:url value="/member/signup"  />'>
								회원가입 </a>


							<!-- 사용자 로그인 시: 드롭다운 메뉴 변경 -->
							<sec:authorize access="isAuthenticated()">
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 위시리스트
								</a>
								<a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 내 프로필
									수정
								</a>
							</sec:authorize>

						</div></li>
				</ul>
			</div>
		</div>
	</nav>











	<!-- 고정 헤드 -->