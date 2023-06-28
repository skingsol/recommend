<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Custom styles for this template-->

	<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding:35px 50px;">
                    <h4><span class="glyphicon glyphicon-lock"></span> 비밀번호 찾기</h4>
                </div>
                <div class="modal-body" style="padding:40px 50px;">
                    <div style="color: #ac2925">
                        <center>입력된 정보로 임시 비밀번호가 전송됩니다.</center>
                    </div>
                    <hr>
                    <form role="form">
                        <div class="form-group">
                            <label for="userEmail"><span class="glyphicon glyphicon-user"></span>email</label>
                            <input type="text" class="form-control" id="userEmail" placeholder="가입시 등록한 이메일을 입력하세요.">
                        </div>
                        <div class="form-group">
                            <label for="userName"><span class="glyphicon glyphicon-eye-open"></span> name</label>
                            <input type="text" class="form-control" id="userName" placeholder="가입시 등록한 이름을 입력하세요.">
                        </div>
                        <button type="button" class="btn btn-success btn-block" id="checkEmail">OK</button>
                    </form>
                    <hr>
                    <div class="text-center small mt-2" id="checkMsg" style="color: red"></div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span
                            class="glyphicon glyphicon-remove"></span> Cancel
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>