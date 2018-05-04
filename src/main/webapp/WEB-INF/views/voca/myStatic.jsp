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
<title>Insert title here</title>
<script>
$(document).ready(function() {
	//var ranNum = Math.floor(Math.random() * vocaList.length) + 1;
	//alert(ranNum);
	/* 
	var vocaList = '${vocaList}';
	$.each(vocaList, function(i, n) {
		alert('i: ' + i + ' n: ' + n);
	})
	 */
	$('#korBtn').on('click', showKorean);
	$('#engBtn').on('click', showEnglish);
})
  
function showKorean() {
	$.ajax({
		url: 'getVocaList',
		method: 'get',
		data: 'json',
		success: function(vocaList) {
			//success로 들어오는지 테스트.
			/* alert('vocaList 불러오기 성공'); */
			
			var ranNum = Math.floor(Math.random() * vocaList.length); //랜덤숫자 생성
			var ranVoca = vocaList[ranNum];
			var ranVocaInputText = vocaList[ranNum].inputText; 		//랜덤 숫자에 맞는 시퀀스의 단어를 반환.
			alert(ranVocaInputText); 			//해당 단어 잘 나오나 테스트.
			
			//외웠는지 테스트. 못외웠으면 세션에 저장.
			var con = confirm('외우셨나요?');
			if (con == false) { //못외운 경우라면
				alert('조금 이따 다시 복습합시다!');
				//alert(ranVoca.inputText);
				$.ajax({
					url: 'checkToReview',
					method: 'post',
					data: {vonum: ranVoca.num},
					dataType: 'text',
					success: function() {
						alert('복습단어 저장 성공!');
					},
					error: function() {
						alert('복습단어 저장 실패!');
					}
				})
				
				/* if (window.sessionStorage) {

	                sessionStorage.setItem("vocaToReview", ranVoca);
	                var vocaToReview = sessionStorage.getItem('vocaToReview');
	                alert('세션에 저장한 단어 뜨나?: ' + vocaToReview);
	            } */
			}
		},
		error: function() {
			/* alert('vocaList 불러오기 실패'); */
		}
	})
}

function showEnglish() {
	$.ajax({
		url: 'getVocaList',
		method: 'get',
		data: 'json',
		success: function(vocaList) {
			alert('vocaList 불러오기 성공');
			var randomVoca = vocaList[Math.floor(Math.random() * vocaList.length)].outputText; //랜덤 숫자에 맞는 시퀀스의 단어를 꺼내준다.
			alert(randomVoca); //잘 나오나 테스트.
			var con = confirm('외우셨나요?');
			if (con == false) { //못외운 경우라면
				alert('못외웠답니다.');
			}
		},
		error: function() {
			alert('vocaList 불러오기 실패');
		}
	})
}

</script>
</head>
<body>
<!-- navbar -->
<jsp:include page="../include/includeNavbar.jsp" flush="false"/>

<div class="container">
    <div class="row">
    		<!-- sideMenu -->
    		<jsp:include page="../include/includeSidemenu.jsp" flush="false"/>
    		
    		<!-- content -->
    		<div class="col-sm-12 col-md-9">
    			<div class="well" id="insertBoard" style="cursor: pointer;" onclick="location.href='insertBoard'">
				<h1>랜덤 단어퀴즈</h1>
                학습한 단어 또는 문장을 무작위로 볼 수 있습니다. 잊지 않도록 복습하세요.
			</div>
			
			<div class="col-sm-6" style="padding: 0px;">
				<img src="../resources/image/east.jpg" style="border-radius: 5px;">
		    </div>
		    <div class="col-sm-6" style="padding: 0px;">
		    		<img src="../resources/image/west.jpg" style="border-radius: 5px; float: right;">
			</div>
			
			<div class="col-sm-6" style="padding: 0px;"><br>
		    		<button type="button" id="korBtn" class="btn btn-warning btn-lg btn-block" style="margin: 0px;">한국어로 나타내기</button>
		    </div>
		    <div class="col-sm-6" style="padding: 0px;"><br>
 				<button type="button" id="engBtn" class="btn btn-warning btn-lg btn-block" style="margin: 0px;">영어로 나타내기</button>
			</div>
		    
			${sessionScope.vocaToReview}
			<div id="vocaList"></div>    
		</div>
	</div>
</div>
</body>
</html>