<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
 <link href="/board/css/sb-admin-2.ssb.css" rel="stylesheet"> 

<!-- Page Heading -->
<div class="gnb-wrap">
	<div class="inner">
		<nav id="gnb" class="gnb">
			<ul class="gnb_ul">
				<li class="notice"><a href='<c:url value="/board/notice"  />'>
						<span>공지사항</span>
				</a></li>
				<li class="qna"><a href="/board/list?page=1&amount=10&type=&keyword="> <span>게시판</span>
				</a></li>
			</ul>
		</nav>
		<!--// gnb --> 
	</div>
	<!--// inner -->
</div>
<div class="row ">
	<div class="col">
		<form action="" method="post" id="registerForm" novalidate>
		  <div class="form-group">
		    <label for="post_title">post_title</label>
		    <input type="text" class="form-control" id="post_title" placeholder="postTitle" name="postTitle" required>		  	
		  	<div class="invalid-feedback">
		  		제목을 확인해 주세요
		  	</div>
		  </div>		 	  
		  <div class="form-group">
		    <label for="post_content">post_content</label>
		    <textarea class="form-control" id="post_content" rows="10" name="postContent" placeholder="post_content" required></textarea>		  
		  	<div class="invalid-feedback">
		  		내용을 확인해 주세요
		  	</div>
		  </div>
		  <div class="form-group">
		    <label for="userid">userid</label>
		    <input type="text" class="form-control" id="userid" name="userid" placeholder="userid" readonly
       value="${pageContext.request.userPrincipal.name}" />	  	
		  	<div class="invalid-feedback">
		  		작성자를 확인해 주세요
		  	</div>
		  </div>
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 		  <button type="submit" class="btn btn-primary">등록</button>
		  <button type="reset" class="btn btn-secondary">취소</button>
		</form>
	</div>
</div>
<div class="row mt-3">
	<div class="col">
		<div class="card">
			<div class="card-header">
				<i class="fa fa-file"></i>
				파일첨부
			</div>
			<div class="card-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" id="uploadFile"  multiple/>
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>
  <script>	
	const path = '${pageContext.request.requestURI}';	
	
	// CSRF 토큰 값 생성
	const csrfToken = '${_csrf.token}';
</script>  
<script src="/board/js/register.js"></script>
<script src="/board/js/upload.js"></script>
<%@ include file="../include/footer.jsp" %>

 












