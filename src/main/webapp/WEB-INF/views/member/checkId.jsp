<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
<title>아이디 중복확인</title>
<script>
$(document).ready(function() {
	//폼 유효성검사
	$('#doCheckId').on('click', doCheckId);
	
	function doCheckId() {
		//아이디 미입력시 폼 유효성검사
		var id = document.getElementById("id");
		if (!id.value) {
			alert("사용하실 아이디를 입력해 주세요.");
			return false;
		}
		//아이디 중복확인
		else {
			$.ajax({
				url: 'doCheckId',
				method: 'post',
				data: {id: id.value},
				dataType: 'text',
				success: function(data) {
					if (data == 'null') {
						var con = confirm('사용 가능한 아이디입니다. 사용하시겠습니까?');
						if (con == true) {
							opener.document.getElementById("id").value = id.value;
			    				window.close();
						}
						else {
							return false;
						}
					}
					else {
						alert('이미 존재하는 아이디입니다.');
					}
				},
				error: function() {
					alert('에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
				}
			})
		}
	}
})
</script>
</head>
<body>
<br>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
	   		<div class="panel panel-default">
			  	<div class="panel-heading">
				    	<h3 class="panel-title" style="text-align: center; font-weight: bold">아이디 중복확인</h3>
				 </div>
			  	<div class="panel-body">
			    		<form id="checkIdForm" accept-charset="UTF-8" role="form">
				    	  	<div class="form-group">
				    		    <input type="text" name="id" id="id" class="form-control" placeholder="아이디" required autofocus>
				    		</div>
				    		
				    		<button type="button" id="doCheckId" class="btn btn-lg btn-warning btn-block">중복확인</button>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>