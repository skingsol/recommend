<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link href="/login/css/leavepage.css" rel="stylesheet">
	<h1>회원탈퇴</h1>	
	
	<main class="form-signin w-100 m-auto">
	  <form method="post" action='<c:url value="/member/leave"/>'>	   
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="userid" value="${authDTO.userid}">
	      <label for="floatingInput">UserId</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" placeholder="password" name="password">
	      <label for="floatingPassword">Password</label>
	    </div>
	    <button class="w-100 btn btn-lg btn-danger" type="submit">회원탈퇴</button>	   
	  </form>
	</main>
<%@ include file="../include/footer.jsp" %>