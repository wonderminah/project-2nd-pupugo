<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인공지능 번역봇 PUPUGO</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery / bootstrap (js & css) -->
<script src="./resources/jq/jquery-3.2.1.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap-theme.min.css">
<style>
.carousel-control.right {background-image: none; 
background-image: none;
background-image: none;linear-gradient: to right,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 0%;
-webkit-linear-gradient: (left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);}
</style>
</head>
<!-- body -->
<body>
<!-- navbar -->
<jsp:include page="./include/includeNavbar.jsp" flush="false"/>

<div class="container">
    <div class="row">
    		<!-- sideMenu -->
    		<jsp:include page="./include/includeSidemenu.jsp" flush="false"/>
		<!-- content -->
    		<div class="col-sm-12 col-md-9">
            <!-- carousel -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
			
				<div class="carousel-inner">
					<div class="item">
						<img src="./resources/image/papago1.jpg" alt="image1" style="width: 100%; font-weight: bold;">
						<div class="carousel-caption" style="text-align: left; color: black; text-shadow: none;">
	                        	<h1 class="carousel-caption-header"><!-- 다양한 학습 데이터 구축 --></h1>
	                        	<p class="carousel-caption-text hidden-md hidden-md">
	                            <!-- 자연스러운 번역을 가능하게 하는 대규모의 학습 데이터를 보유하고 있습니다. 언어의 규칙을 효과적으로 파악하는 핵심 번역 기술을 강화하기 위해 품질 높은 학습 모델을 사용합니다. -->
	                        	</p>
                    		</div>
					</div>
					<div class="item active">
						<img src="./resources/image/papago2.jpg" alt="image2" style="width: 100%;">
						<div class="carousel-caption" style="text-align: left; color: white; text-shadow: none;">
	                        	<h1 class="carousel-caption-header"><!-- Neural Machine Translation --></h1>
	                        	<p class="carousel-caption-text hidden-md hidden-md">
	                            <!-- NMT는 Neural Machine Translation(인공신경망 기반 기계번역)의 약어입니다. 파파고의 NMT 기술은 입력 문장을 문장벡터로 변환하는 신경망(encoder)과 문장벡터에서 번역하는 언어의 문장을 생성하는 신경망(decoder)를 대규모의 병렬 코퍼스부터 자동으로 학습합니다. -->
	                        	</p>
                    		</div>
					</div>
					<div class="item">
						<img src="./resources/image/papago3.jpg" alt="image3" style="width: 100%;">
						<div class="carousel-caption" style="text-align: left; text-shadow: none;">
	                        	<h1 class="carousel-caption-header"><!-- 풍부한 언어 처리 경험 --></h1>
	                        	<p class="carousel-caption-text hidden-md hidden-md">
	                            <!-- 다국어 언어 처리에 대한 네이버의 기술과 경험을 번역 엔진에 적용해 보다 정확한 번역 결과를 제공합니다. 네이버 서비스를 통해 축적해온 번역 품질에 대한 피드백들을 적극적으로 반영해 단순 통계에만 의존하는 기존 기술의 한계를 보완했습니다. -->
	                        	</p>
                    		</div>
					</div>
				</div>
				
				<a class="left carousel-control" style="width: 30px;"href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" style="width: 30px;" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
			</div>
            
		      <!-- Example row of columns -->
		      <div class="row">
		        <div class="col-sm-4">
		          <h2>인공신경망 번역</h2>
		          <p>NMT는 Neural Machine Translation(인공신경망 기반 기계번역)의 약어입니다. 파파고의 NMT 기술은 입력 문장을 문장벡터로 변환하는 신경망(encoder)과 문장벡터에서 번역하는 언어의 문장을 생성하는 신경망(decoder)를 대규모의 병렬 코퍼스부터 자동으로 학습합니다.</p>
		          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		        </div>
		        <div class="col-sm-4">
		          <h2>다양한 학습 데이터</h2>
		          <p>자연스러운 번역을 가능하게 하는 대규모의 학습 데이터를 보유하고 있습니다. 언어의 규칙을 효과적으로 파악하는 핵심 번역 기술을 강화하기 위해 품질 높은 학습 모델을 사용합니다.</p>
		          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		        </div>
		        <div class="col-sm-4">
		          <h2>풍부한 언어 처리 경험</h2>
		          <p>다국어 언어 처리에 대한 네이버의 기술과 경험을 번역 엔진에 적용해 보다 정확한 번역 결과를 제공합니다. 네이버 서비스를 통해 축적해온 번역 품질에 대한 피드백들을 적극적으로 반영해 단순 통계에만 의존하는 기존 기술의 한계를 보완했습니다.</p>
		          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		        </div>
		      </div>
    		</div>
    </div>
</div>    
</body>
</html>