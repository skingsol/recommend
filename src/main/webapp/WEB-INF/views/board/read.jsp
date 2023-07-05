<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%> 

<%@ include file="../include/header.jsp"%>
<link href="/board/css/sb-admin-2.ssb.css" rel="stylesheet">
<!-- Page Heading -->

<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">

				<li class="qna"><a
					href="/board/list?page=1&amount=10&type=&keyword="> <span>게시판</span>
				</a></li>
			</ul>
		</nav>
		<!--// gnb -->
	</div>
	<!--// inner -->

</div>
<div class="row card-header">상세페이지</div>


<div class="row">
	<div class="col">
		<form action="" method="post">
			<div class="form-group">
				<label for="post_title">post_title</label> <input type="text"
					class="form-control" id="postTitle" name="postTitle" readonly
					value="${dto.postTitle}">
			</div>
			<div class="form-group">
				<label for="post_content">post_content</label>
				<textarea class="form-control" id="postContent" rows="10"
					name="postContent" readonly>${dto.postContent}</textarea>
			</div>
			<div class="form-group">
				<label for="userid">userid</label> <input type="text"
					class="form-control" id="userid" name="userid" readonly
					value="${dto.userid}">
			</div>

			<%-- 로그인 상황에서 해당 게시물 작성자와 동일할 때만 보여주기 --%>


			<%-- <c:set var="username"
				value="${pageContext.request.userPrincipal.name}" /> --%>
			<security:authorize access="isAuthenticated()" >
				<security:authentication property="principal.username" var="username" />
				<c:if test="${username == dto.userid}">
					<button type="button" class="btn btn-info">수정</button>
				</c:if>

			</security:authorize>

			<button type="button" class="btn btn-secondary">목록</button>
		</form>
	</div>
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
	</div>
</div>

<!--  댓글 작성 폼 -->
<security:authorize access="isAuthenticated()">
	<form action="" class="mt-3" id="replyForm">
		<div class="form-row">
			<div class="col-11">
				<textarea name="replyContent" id="replyContent" rows="5"
					class="form-control"></textarea>
			</div>
			<div class="col my-2">
				<div class="form-row my-2">
					<input type="text" name="replyer" id="replyer" class="form-control"
						readonly
						value='<security:authentication property="principal.username"/>' />
				</div>
				<div class="form-row my-2">
					<button class="btn btn-success btn-block">댓글 작성</button>
				</div>
			</div>
		</div>
	</form>
</security:authorize>
<!-- 댓글 목록 -->
<div class="card mt-4">
	<div class="card-header">
		<i class="fa fa-comments fa-fw"></i> Reply
	</div>
	<div class="card-body">
		<ul class="chat list-group list-group-flush">
			<li class='list-group-item border-bottom' data-replyId='1'>
				<div class="d-flex justify-content-between">
					<strong class='primary-font'>user00</strong> <small
						class='text-muted text-right'>2023-05-24 00:00</small>
				</div>
				<p>Good JOB</p>
				<div class="btn-group btn-group-sm">
					<button class="btn btn-warning" type="button">수정</button>
					<button class="btn btnㄹ-danger" type="button">삭제</button>
				</div>
			</li>
		</ul>
	</div>
	<div class="card-footer">
		<!-- 댓글 페이지 나누기 -->
	</div>
</div>
<!-- 댓글 수정 폼 -->
<div class="modal" tabindex="-1" id="replyModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">댓글 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" name="replyId" id="replyId" />
				<div class="form-group">
					<textarea name="replyContent" id="replyContent" rows="4"
						class="form-control"></textarea>
				</div>
				<div class="form-group">
					<input type="text" name="replyer" id="replyer" class="form-control"
						readonly />
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">수정</button>
			</div>
		</div>
	</div>
</div>
<form action="" id="operForm">
	<input type="hidden" name="postId" value="${dto.postId}" /> <input
		type="hidden" name="page" value="${cri.page}" /> <input type="hidden"
		name="amount" value="${cri.amount}" /> <input type="hidden"
		name="type" value="${cri.type}" /> <input type="hidden"
		name="keyword" value="${cri.keyword}" />
</form> 


<script> 
	//게시물 글번호 가져오기
	const postId = ${dto.postId};
  
	// CSRF 토큰 값 생성
	const csrfToken = '${_csrf.token}';
</script>
<script src="/board/js/reply.js"></script>
<script src="/board/js/read.js"></script>  
<%@ include file="../include/footer.jsp"%>















