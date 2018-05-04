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
<title>새 카테고리</title>
<script>
$(document).ready(function() {
	$('#addNewCategory').on('click', addNewCategory);
	
})
function addNewCategory() {
	
	var name = $('#name').val();
	alert(name); //테스트
	
	$.ajax({
		url: 'addNewCategory',
		method: 'post',
		data: {name: name},
		dataType: 'text',
		success: function() {
			alert('저장에 성공하였습니다.');
			
			var id = $('#id').val();
			alert(id);
			
			///////////////안되는 상황.
			$.ajax({
				url: 'categoryReload',
				method: 'get',
				data: {id: id},
				dataType: 'text',
				success: function() {
					/* alert('카테고리 새로고침'); */
				},
				error: function() {
					/* alert('카테고리 새로고침 실패'); */
				}
			})
			window.opener.location.reload();
			window.close();
		},
		error: function() {
			alert('저장 도중 에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
		}
	})
	
	document.opener.location.reload();
	window.close();
}
</script>
</head>
<body>
<!-- content -->
<br>
<div class="container">
  <div class="well" id="insertBoard" style="cursor: pointer;" onclick="location.href='insertBoard'">
   <h2>새 카테고리 만들기</h2>
   주제별로 카테고리를 분류하여 단어 또는 문장을 저장하세요.
  </div>
  
  <form class="form-inline">
    <div class="form-group">
      <label for="name">이름</label>
      <input type="hidden" id="id" value="${sessionScope.loginMember.getId()}">
      <input type="text" class="form-control" id="name" placeholder="카테고리 이름을 입력하세요." name="name">
    </div>
    <button type="button" id="addNewCategory" class="btn btn-warning">만들기</button>
  </form>
</div>
</body>
</html>