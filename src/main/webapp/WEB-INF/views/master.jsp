<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<!-- 메인페이지 헤드2 -게시판 안내- -->
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



<table class="table table-bordered table-hover" id="requestTable">
	<thead>
		<tr>
			<th scope="col" width="10%" style="text-align: center;">등록번호</th>
			<th scope="col" width="20%" style="text-align: center;">맛집 이름</th>
			<th scope="col" width="40%" style="text-align: center;">맛집 주소</th>
			<th scope="col" width="15%" style="text-align: center;">등록 유저</th>
			<th scope="col" width="15%" style="text-align: center;">요청일자</th>
		</tr>
	</thead>
	
	
	<tbody>
		<c:forEach var="list" items="${list}">
			<tr>
				<th scope="row" style="text-align: center;">${list.reqId}</th>
				<td class="post-title" style="text-align: center;"><a href="${list.reqId}" class="move" >${list.reqName}</a>
				<td class="post-content" style="text-align: center;">${list.reqAddress}</td>
				<td class="author" style="text-align: center;">${list.reqUser}</td>
				<td class="date" style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.reqDate}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<script src="/master/list.js"></script>
<%@ include file="include/footer.jsp"%>