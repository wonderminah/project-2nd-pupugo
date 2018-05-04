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
    			<div class="well">
                <h1>질문내용 수정</h1>
                테스트 페이지. 여기에 컨텐츠를 입력합니다.
            </div>

    			<form action="doUpdateQuestion" method="post">
    				<input type="hidden" name="num" id="num" value="${param.num}">
            		<input type="hidden" name="id" id="id" value="${sessionScope.loginMember.getId()}">
            		<input type="hidden" name="category" id="category" value="${category}">
	    			<input type="text" name="title" id="title">
	    			<input type="text" name="content" id="content">
	    			<input type="text" name="ability" id="ability">
	    			
	    			<input type="submit" value="작성">
    			</form>
    		</div>
    </div>
</div>    

</body>
</html>