<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
<title>비밀번호 확인</title>
<script>
$(document).ready(function() {
	//폼 유효성검사
	$('#doCheckPw').on('click', doCheckPw);
	
	function doCheckPw() {
		//아이디 미입력시 폼 유효성검사
		var pw = document.getElementById("pw");
		if (!pw.value) {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		//아이디 중복확인
		else {
			$.ajax({
				url: 'doCheckPw',
				method: 'post',
				data: {pw: pw.value},
				dataType: 'text',
				success: function(data) {
					//비번 일치할시
					if (con == 'same') {
		    				window.close();
					}
					//비번 불일치시
					else {
						alert('비밀번호를 확인해 주시기 바랍니다.');
						return false;
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
				    	<h3 class="panel-title" style="text-align: center; font-weight: bold">비밀번호 재확인</h3>
				 </div>
			  	<div class="panel-body">
			    		<form id="checkPwForm" accept-charset="UTF-8" role="form">
				    	  	<div class="form-group">
				    		    <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호" required autofocus>
				    		</div>
				    		
				    		<button type="button" id="doCheckPw" class="btn btn-lg btn-warning btn-block">확인</button>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>