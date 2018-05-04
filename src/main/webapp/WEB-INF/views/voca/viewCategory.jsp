<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./resources/jq/jquery-3.2.1.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap-theme.min.css">
<title>${param.name}</title>
<style>
.box{
    width:100%;
    height:300px;
    background-color:#f2f2f2;
    
}
</style>
<script>
$('.carousel').carousel({
	interval: 3000
})
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
                <h1>${param.name}</h1>
                단어 또는 문장을 카테고리별로 나누어 학습하세요. 
            </div>
            
    			${vocaList }
    			
    			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
			  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
			  <div class="item active">
			    <div class="box"></div>
			    <div class="carousel-caption">
			    	<h3>First Text</h3>
			    </div>
			  </div>
			  <div class="item">
			    <div class="box"></div>
			    <div class="carousel-caption">
			    	<h3>Second Text</h3>
			    </div>
			  </div>
			  <div class="item">
			    <div class="box"></div>
			    <div class="carousel-caption">
			    	<h3>Third Text</h3>
			    </div>
			  </div>
			</div>
			
			<!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left"></span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right"></span>
			  </a>
			</div> <!-- Carousel -->
    		</div>
    </div>
</div>
</body>
</html>