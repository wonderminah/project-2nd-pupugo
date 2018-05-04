<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery / bootstrap (js & css) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
<!-- title -->
<title>includeSidemenu.jsp</title>
<!-- <script>
$(document).ready(function() {
	$('#goToTranslate').on('click', goToTranslate)
	
	function goToTranslate() {
		location.href="/mini/voca/translate";
	}
})
</script> -->
<script>
function goToAddNewCategory() {
	var popupX= (window.screen.width/2) - (400/2);
	var popupY= (window.screen.height/2) - (300/2);
	
	var url = "/mini/voca/goToAddNewCategory";
	var option = 'width=500, height=300, resizable=no, scrollbars=no, status=no, left=' + popupX + ', top=' + popupY + ', screenX=' + popupX + ', screenY= ' + popupY;

	window.open(url,"",option);
}
</script>
</head>
<body>
<!-- side menu -->
<div class="col-sm-3 col-md-3">
    <div class="panel-group" id="accordion">
    		<div class="panel" style="background: #f0ac4c">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a id="goToranslate" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-search">
                    </span> <a href="/mini/voca/translate">지금 푸푸고를 이용해보세요!</a></a>
                </h4>
            </div>
            <!-- <div id="collapseTwo" class="panel-collapse collapse"> -->
        </div>
    		<!-- 마이페이지 -->
    		<c:if test="${sessionScope.loginMember != null}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-user">
                    </span> 마이페이지</a>
                </h4>
            </div>
            <!-- <div id="collapseOne" class="panel-collapse collapse in"> -->
            <div class="panel">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-book text-warning"></span><a href="/mini/voca/note" id="vocaNote"> 내단어장</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-book text-warning"></span><a href="/mini/voca/myChart" id="vocaNote"> 학습통계</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-signal text-warning"></span><a href="/mini/voca/myStatic" id="myStatic"> 랜덤퀴즈</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-pencil text-warning"></span><a href="/mini/member/updateMember" id="updateMember"> 정보수정</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-signal text-warning"></span><a href="/mini/member/deleteMember" id="deleteMember"> 회원탈퇴</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!-- 카테고리별 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-th-list">
                    </span> 카테고리별</a>
                </h4>
            </div>
            <!-- <div id="collapseThree" class="panel-collapse collapse"> -->
            <div class="panel">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-plus text-warning"></span><a style="cursor: pointer;" onclick="javascript:goToAddNewCategory();"> 새 카테고리</a>
                            </td>
                        </tr>
                        <c:if test="${myCategory != null}">
                        <c:forEach var="i" items="${myCategory}">
	                    	<tr>
                            <td>
                                <span class="glyphicon glyphicon-book text-warning"></span><a style="cursor: pointer;" href="/mini/voca/viewCategory?name=${i.name}"> ${i.name}</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
        </c:if>
        <!-- 지식마스터 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th-list">
                    </span> 지식마스터</a>
                </h4>
            </div>
            <!-- <div id="collapseTwo" class="panel-collapse collapse"> -->
            <!-- <div class="panel">
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-blackboard text-warning"></span><a href="/mini/qna/selectQuestionList?category=it"> 아이티</a>
                                <span class="badge">2</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-book text-warning"></span><a href="/mini/qna/selectQuestionList?category=japanese"> 일본어</a>
                                <span class="badge">3</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-briefcase text-warning"></span><a href="/mini/qna/selectQuestionList?category=job"> 취업정보</a>
                                <span class="badge">4</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="glyphicon glyphicon-map-marker text-warning"></span><a href="/mini/qna/selectQuestionList?category=locallife"> 현지생활</a>
                                <span class="badge">5</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div> -->
        </div>
    </div>
</div>
</body>
</html>