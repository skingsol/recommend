<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header_restaruant.jsp"%>

<div class="login_body">
<h1 style="text-align: center;">회원탈퇴</h1>
	<form method="post" action='<c:url value="/member/leave"/>'>
		
		<div class="login_title">
				 <label	for="floatingInput">UserId</label>
			<input type="text" class="form-control" id="userid" name="userid" style="font-size: 20px"
				 readonly value="${pageContext.request.userPrincipal.name}" /> 
		</div>
		
		<div class="login_title">
				<label for="floatingPassword">Password</label>
			<input type="password" class="form-control" id="floatingPassword" style="font-size: 20px"
				placeholder="password" name="password"> 
		</div>
		<div class="D_button_div">
		<button class="D_button" type="submit">회원탈퇴</button>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp"%>