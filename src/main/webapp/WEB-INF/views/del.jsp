<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<!-- 메인페이지 헤드2 -게시판 안내- -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">
				<li class="notice"><a href='<c:url value="/board/notice"  />'>
						<span>공지사항</span>
				</a></li>
				<li class="qna"><a
					href="/board/list?page=1&amount=10&type=&keyword="> <span>게시판</span>
				</a></li>
			</ul>
		</nav>
		<!--// gnb -->
	</div>
	<!--// inner -->
</div>

<div class="row read_wrap">
	<div class="col">
		<form action="" method="post" id="readForm">
		<input type="hidden" name="reqId" id="reqId" value="${dto.reqId}" /> 
			<div class="form-group">
				<label for="req_name">맛집 이름</label> <input type="text"
					class="form-control" id="reqName" name="reqName" readonly
					value="${dto.reqName}">
			</div>
			<div class="form-group">
				<label for="req_address">맛집 주소</label>
				<textarea class="form-control" id="reqAddress" rows="3"
					name="reqAddress" readonly>${dto.reqAddress}</textarea>
			</div>
			<div class="form-group">
				<label for="req_content">맛집 정보</label>
				<textarea class="form-control" id="reqContent" rows="6"
					name="reqContent" readonly>${dto.reqContent}</textarea>
			</div>
			<div class="form-group">
				<label for="userid">작성자</label> <input type="text"
					class="form-control" id="reqUser" name="reqUser" readonly
					value="${dto.reqUser}">
			</div>
			<div class="btn_wrap">			
				<button type="button" class="btn" id="backToList"> 목록으로</button>
				<button type="button" class="btn" id="deleteBtn">삭제</button>
			</div>
		</form>
	</div>
</div>




<script>
	//게시물 글번호 가져오기
	const reqId = ${dto.reqId};
	// CSRF 토큰 값 생성
	//const csrfToken = '${_csrf.token}';
</script>

<script src="/master/read.js"></script>
<%@ include file="include/footer.jsp"%>















