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
                <h1>[${text }]로 검색한 결과</h1>
                한국어 또는 영어를 검색하여 저장한 단어를 확인하세요.
            </div>
            
            <!-- 검색 폼 -->
            <form class="navbar-form navbar-right" action="searchVoca" method="get">
			  <div class="input-group">
			    <input type="text" class="form-control" name="text" id="text" style="width: auto;" placeholder="검색">
			    <div class="input-group-btn">
			      <button class="btn btn-warning" type="submit" id="search"><i class="glyphicon glyphicon-search"></i></button>
			    </div>
			  </div>
			</form>
            
		  <table class="table">
		    <!-- 게시판 헤드 -->
		    <thead>
		      <tr class="warning">
		        <th style="width: 50px; text-align: center;">번호</th>
		        <th style="width: 250px;">입력</th>
		        <th style="width: 250px;">출력</th>
		        <th colspan="2">날짜</th>
		        <th colspan="2" style="text-align: center;">수정</th>
		        <th colspan="2" style="text-align: center;">삭제</th>
		      </tr>
		    </thead>
		    <tbody>
		    <!-- 게시글 목록 -->
		    <c:forEach var="i" items="${searchVocaList}" varStatus="s"><%-- ${전체게시글수 - (현재페이지-1)*페이지당 보여지는 게시물수 - i.index} --%>
			  <tr>
		        <td style="width: 50px; text-align: center;">${boardCountSum - startPage*10 - s.index + 10} </td>
		        <td style="width: 250px;" id="inputText${i.num }"><div id="inputText${i.num}">${i.inputText }</div></td>
		        <td style="width: 250px;" id="outputText${i.num }"><div id="outputText${i.num}">${i.outputText }</div></td>
		        <td colspan="2">${i.date }</td>
		        <td colspan="2"><div Class="btnDiv"><button type="button" class="modify btn btn-warning btn-sm pull-right">수정</button></div></td>
		        <td colspan="2"><button type="button" class="delete btn btn-warning btn-sm pull-right" onclick="javascript:deleteVoca(${i.num})">삭제</button></td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table><hr>
		  
		  <!-- 페이징 -->
		    <div class="paging" style="text-align: center;">
			   <ul class="pagination" >
			   	<li><a onclick="goBoardList('${startPage-1 }')">이전</a></li>
			    <c:forEach begin="1" end="${boardCountSum }" step="10" varStatus="s"> <!-- varStatus에 관한 내용은 http://jetalog.net/20 참조. -->
					<c:if test="${startPage == s.count }">
						<li class="active"><a href="#" onclick="goBoardList('${s.count}')"><b>${s.count }</b></a></li>
					</c:if>
					
					<c:if test="${startPage != s.count }">
						<li><a href="#" onclick="goBoardList('${s.count}')">${s.count }</a></li>
					</c:if>
				</c:forEach>
				<li><a onclick="goBoardList('${startPage+1 }')">다음</a></li>
			  </ul>
		   </div>
		  
        </div>
    </div>
</div>        
</body>
</html>