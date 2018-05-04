<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
<title>회원탈퇴</title>
</head>
<body>
<!-- navbar -->
<jsp:include page="../include/includeNavbar.jsp" flush="false"/>

<div class="container">
    <div class="row">
    		<!-- sideMenu -->
    		<jsp:include page="../include/includeSidemenu.jsp" flush="false"/>
    		
    		<div class="col-sm-12 col-md-9">
    			<div class="well" id="insertBoard" style="cursor: pointer;" onclick="location.href='insertBoard'">
                <h1>회원탈퇴</h1>
                정말 탈퇴하시려는 건가요? 이용자님의 목소리를 들려주시면 더욱 더 좋은 푸푸고가 되도록 할게요. 
            </div>
            
            <form action="deleteMember" method="post">
              <table class="table table-hover">
			    <thead class="table-warning">
			      <tr>
			        <th>선택사항</th>
			        <th>탈퇴하시려는 이유를 선택해 주세요.</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td><input type="checkbox"></td>
			        <td>타 사이트를 이용하고자 해서</td>
			      </tr>
			      <tr>
			        <td><input type="checkbox"></td>
			        <td>사이트의 기능 및 인터페이스 등이 불편해서</td>
			      </tr>
			      <tr>
			        <td><input type="checkbox"></td>
			        <td>디자인이 보기 불편해서</td>
			      </tr>
			      <tr>
			      	<td style="vertical-align: middle;">기타의견</td>
			      	<td colspan="2"><textarea class="form-control" type="textarea" id="inputText" placeholder="" rows="1" style="resize: none;"></textarea></td>
			    </tbody>
			  </table>
			  <hr>
			  <button type="submit" class="btn btn-warning pull-right">회원탈퇴</button>
			</form>
    		</div>
    	</div>
</div>
</body>
</html>