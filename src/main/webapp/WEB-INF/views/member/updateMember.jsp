<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    		
    		<!-- content -->
    		<div class="col-sm-12 col-md-9">
    			<div class="well">
                <h1>회원정보 수정</h1>
                아이디를 제외하고 바뀐 정보를 새로 입력할 수 있습니다.
            </div>
    			<div>
				<form action="doUpdateMember" method="post">
					<input type="hidden" name="num" id="num" value="${loginMember.getNum()}">
					<input type="hidden" name="id" id="id" value="${loginMember.getId()}">
					
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" name="id" id="id" readonly placeholder="${loginMember.getId()}">
				    </div>
				    <div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" name="pw" id="pw" placeholder="영문자, 숫자, 특수문자를 각각 한 글자 이상 포함하여야 합니다.">
						<input type="password" class="form-control" name="pwc" id="pwc" placeholder="비밀번호를 다시 한 번 입력하시기 바랍니다.">
				    </div>
				    <div class="form-group">
						<label for="name">이름</label>
						<input type="text" class="form-control" name="name" id="name" placeholder="${loginMember.getName()}">
				    </div>
				    <div class="form-group">
						<label for="nick">닉네임</label>
						<input type="text" class="form-control" name="nick" id="nick" placeholder="${loginMember.getNick()}">
				    </div>
				    <div class="form-group">
				    		<label for="gender">성별</label><br>
						<label class="radio-inline"><input type="radio" name="gender" id="male" value="male" <c:if test="${loginMember.getGender().equals('male')}">checked</c:if>>남성</label>
						<label class="radio-inline"><input type="radio" name="gender" id="female" value="female" <c:if test="${loginMember.getGender().equals('female')}">checked</c:if>>여성</label>
				    </div>
				    <div class="form-group">
						<label for="birth">생년월일</label>
						<input type="text" class="form-control" name="birth" id="birth" placeholder="${loginMember.getBirth() }">
				    </div>

					<!-- <div class="form-group">
						<label for="interest">관심분야</label><br>
						<input type="checkbox" name="interest" id="it" class="interest" value="it" <c:if test="">checked</c:if>> 아이티
						<input type="checkbox" name="interest" id="japanese" class="interest" value="japanese" <c:if test=""></c:if>> 일본어
						<input type="checkbox" name="interest" id="job" class="interest" value="job" <c:if test="">checked</c:if>> 취업정보
						<input type="checkbox" name="interest" id="locallife" class="interest" value="locallife" <c:if test=""></c:if>> 현지생활
				    </div> -->
						<button type="submit" class="btn btn-warning" id="updateMember">정보수정</button>
						<button type="reset" class="btn btn-warning">다시쓰기</button><br><br><br>
				</form>
			</div>
		</div>
    </div>
</div>   
</body>
</html>