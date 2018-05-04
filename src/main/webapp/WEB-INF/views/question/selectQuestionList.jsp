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
<title>Q&A: 아이티</title>
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
    			<div class="well" style="cursor: pointer;" onclick="location.href='insertQuestion?category=${param.category}'">
    				<c:if test="${param.category.equals('it')}">
                		<h1>아이티</h1>
                		아이티에 대한 모든 궁금증을 이야기하는 곳입니다.
                	</c:if>
                	<c:if test="${param.category.equals('japanese')}">
                		<h1>일본어</h1>
                		일본어에 대한 모든 궁금증을 이야기하는 곳입니다.
                	</c:if>
                	<c:if test="${param.category.equals('job')}">
                		<h1>취업정보</h1>
                		취업정보에 대한 모든 궁금증을 이야기하는 곳입니다.
                	</c:if>
                	<c:if test="${param.category.equals('locallife')}">
                		<h1>현지생활</h1>
                		현지생활에 대한 모든 궁금증을 이야기하는 곳입니다.
                	</c:if>
            </div>
            
		  <table class="table">
		    <!-- 게시판 헤드 -->
		    <thead>
		      <tr class="warning">
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>내공</th>
		        <th>조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		    
		    <!-- 게시글 목록 -->
		    <c:forEach var="i" items="${boardList}">
		      <tr>
		        <td>${i.num}</td>
		        <td><a href="selectQuestion?num=${i.num}">${i.title}</a></td>
		        <td>${i.id}</td>
		        <td>${i.ability}</td>
		        <td>${i.hits}</td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
    		</div>
    </div>
</div>    
</body>
</html>