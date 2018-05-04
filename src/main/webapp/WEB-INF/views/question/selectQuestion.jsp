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
    			<button type="button" onclick="location.href='updateQuestion?category=${question.getCategory()}&num=${question.getNum()}'">수정</button>
    			<button type="button" onclick="location.href='deleteQuestion?category=${question.getCategory()}&num=${question.getNum()}'">삭제</button>
    			<button type="button" onclick="location.href='../qna/insertAnswer?category=${question.getCategory()}&num=${question.getNum()}'">답변</button>
    			<br>
    			<!-- 질문글 -->
    			${question}
			
			
			<!-- 답변글 -->
			<table class="table">
			    <c:forEach var="i" items="${answerList }">
			      <tr class="warning">
			        <td>${i.title }</td>
			        <td>${i.id }</td>
			        <td>${i.date }</td>
			      </tr>
			      <tr>
			      	<td colspan="3">${i.content }</td>
			      </tr>
			    </c:forEach>
		    </table>    			
    		</div>
    </div>
</div>    
</body>
</html>