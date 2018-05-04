<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- jQuery / bootstrap (js & css) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">

<!-- title> -->
<title>Insert title here</title>
<!-- style -->
<style>
.login-form 
{
	width:300px;
	margin:auto;
}
</style>
<!-- javascript -->
<script>
$(document).ready(function() {
	var url = location.search;
	//alert(url);
	var urlstr = url.substring(12, url.length);
	//alert(urlstr);
	
	$('#doLoginMember').on('click', doLoginMember);
	
	function doLoginMember() {
		$.ajax({
			url: 'doLoginMember',
			method: 'post',
			data: $('#loginForm').serialize(),
			dataType: 'text',
			success: function(data) {
				if (data == 'failure') {
					//window.opener.location.href="../"; //한 단계 상위로 이동
					//window.close();
					alert('아이디와 비밀번호를 확인해 주시기 바랍니다.');
				}
				else {
					if (url) {
						location.href = '/mini/' + urlstr;
					}
					else {
						location.href = data;					
					}
				} 
			},
			error: function() {
				alert("에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.");
			}
		})
	}
})


/* 
	if (${loginResult.equals("success")}) {
		window.opener.location.href="/mini/";
		window.close();
	}
	else {
		alert('아이디와 비밀번호를 확인해 주세요.');
	} */
</script>
</head>
<!-- body -->
<body>
<!-- navbar -->
<jsp:include page="../include/includeNavbar.jsp" flush="false"/>

<div class="container">
    <div class="row">
    		<!-- sideMenu -->
    		<jsp:include page="../include/includeSidemenu.jsp" flush="false"/>


<!-- <div class="container">
	<div class="row">
		<div class="col-md-12"> -->
		<div class="col-sm-12 col-md-9">
	   		<div class="panel panel-default">
			  	<div class="panel-heading">
				    	<h3 class="panel-title" style="text-align: center; font-weight: bold;">로그인</h3>
				 </div>
			  	<div class="panel-body">
			    		<form id="loginForm" accept-charset="UTF-8" role="form">
				    	  	<div class="form-group">
				    		    <input type="text" name="id" id="id" class="form-control" placeholder="아이디" required autofocus>
				    		</div>
				    		<div class="form-group">
				    			<input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호" required>
				    		</div>
				    		<button type="button" id="doLoginMember" class="btn btn-lg btn-warning btn-block">로그인</button>
			      	</form>
			    </div>
			</div>
		</div>
		</div>
	</div>
<!-- </div>
</div>
</div> -->
</body>
</html>