<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery / bootstrap (js & css) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
</head>
<body>
<!-- navbar -->
<jsp:include page="../include/includeNavbar.jsp" flush="false"/>

<div class="container">
    <div class="row">
    		<!-- sideMenu -->
    		<jsp:include page="../include/includeSidemenu.jsp" flush="false"/>
    		
    		${question}
    		
  		<form action="doInsertAnswer" method="post">
  			<input type="hidden" name="qunum" id="qunum" value="${question.getNum()}">
        		<input type="hidden" name="id" id="id" value="${sessionScope.loginMember.getId()}">
        		<input type="hidden" name="category" id="category" value="${param.category}">
 			<input type="text" name="title" id="title">
 			<input type="text" name="content" id="content">
 			
 			<input type="submit" value="작성">
		</form>
    		
    </div>
</div>    
</body>
</html>