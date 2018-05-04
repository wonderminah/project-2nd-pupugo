<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./resources/jq/jquery-3.2.1.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap-theme.min.css">

<script>
<!-- jQuery -->
$(document).ready(function(){
	//$('#login').on('click', goToLoginMember);
	$('#login').on('click', showLoginPopup);
	$('#logout').on('click', goToLogoutMember);
	$('#signUp').on('click', goToInsertMember);
})

function showLoginPopup() {
	/* var popupX= (window.screen.width/2) - (400/2);
	var popupY= (window.screen.height/2) - (300/2); */
	
	/* var url = "/mini/member/loginMember";
	var option = 'width=400, height=300, resizable=no, scrollbars=no, status=no, left=' + popupX + ', top=' + popupY + ', screenX=' + popupX + ', screenY= '+ popupY;
	window.open(url,"",option); */
	location.href="/mini/member/loginMember";
}
function goToLogoutMember() {
	document.location.href="/mini/member/logoutMember";
}
function goToInsertMember() {
	document.location.href="/mini/member/insertMember";
}

</script>

</head>
<!-- body -->
<body>
	<!-- navbar -->
	<br>
	<div class="container">
	 <nav class="navbar navbar-inverse">
	  <div class="navbar-header">
	    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	      <span class="sr-only">Toggle navigation</span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	    <a class="navbar-brand" href="/mini/"><img src="/mini/resources/image/logo2.png"></a>
	  </div>
	  <div id="navbar" class="navbar-collapse collapse">
	    <!-- 로그인폼 -->
	    <form class="navbar-form navbar-right">
	    	   <c:if test="${sessionScope.loginMember == null}"><button type="button" class="btn btn-warning" id="login">로그인</button></c:if>
	    	   <c:if test="${sessionScope.loginMember != null}"><button type="button" class="btn btn-warning" id="logout">로그아웃</button></c:if>
	       <c:if test="${sessionScope.loginMember == null}"><button type="button" class="btn btn-warning" id="signUp">회원가입</button></c:if>
	    </form>
	    
	    <!-- 검색폼 -->
	    <!-- <form class="navbar-form navbar-right">
		  <div class="input-group">
		    <input type="text" class="form-control" placeholder="검색">
		    <div class="input-group-btn">
		      <button class="btn btn-warning" type="submit" id="search"><i class="glyphicon glyphicon-search"></i></button>
		    </div>
		  </div>
		</form> -->
		
		<!-- 링크 추가하고 싶을 시 아래 코드 이용 -->
	    <ul class="nav navbar-nav navbar-right">
	      <c:if test="${sessionScope.loginMember != null}"><li><a><b>${sessionScope.loginMember.getId()}님 환영합니다!</b></a></li></c:if>
	    </ul> 
	  </div>
	 </nav>
	</div>
</body>
</html>