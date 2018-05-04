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
<style>
h2{ 
	margin-bottom: 10px;
}
.progress-outer{
    margin: 50px 0;
    box-shadow: 0 0  10px rgba(209, 219, 231,0.7);
}
.progress{
    position: relative;
    height: 20px;
    margin: 0;
    overflow: visible;
    background: #424242;
}
.progress .progress-bar{
    border-radius: 2px;
}
.progress-bar-striped {
    background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, 
    transparent 25%, transparent 50%, 
    rgba(255, 255, 255, 0.15) 50%, 
    rgba(255, 255, 255, 0.15) 75%, 
    transparent 75%, transparent);
    background-size: 1rem 1rem;
    background-color: #437abd;
}
.progress .progress-value{
    left: 90%;
    position: absolute;
    font-size: 14px;
    font-weight: bold;
    color: #e5e5e5;
    letter-spacing: 5px;
}
.progress-bar.active{
    animation: reverse progress-bar-stripes 1s linear infinite, animate-positive 2s;
}

@-webkit-keyframes animate-positive{
    0% { width: 0%; }
}
@keyframes animate-positive {
    0% { width: 0%; }
}
</style>
<script>
$(document).ready(function() {
	$.ajax({
		url: 'getMyChart',
		method: 'get',
		dataType: 'json',
		success: function(vocaList) {
			alert(vocaList);
			$.each(vocaList, function(i, n) {
				if (n.date == 
			})
		},
		error: function() {
			alert('목록을 불러오는 도중 에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
		}
	})
})


</script>
<title>Insert title here</title>
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
	                <h1>주별 학습통계</h1>
	                한 주간 배운 단어량을 확인하고 복습하세요.
	            </div>
	            
		           <div class="progress-outer">
			           <div class="progress">
			               <div class="progress-bar progress-bar-info progress-bar-warning active" style="width:80%;"></div>
			               <div class="progress-value">80%</div>
		               </div> 
		           </div>
	            
	            
	            ${vocaList.size()}
	        
	    		</div>
	    </div>
	</div>    
</body>
</html>