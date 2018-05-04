<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<!-- jQuery / bootstrap (js & css) -->
<script src="../resources/jq/jquery-3.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">

<!-- jQuery -->
<script>
$(document).ready(function() {
	$('#checkId').on('click', checkId);  //중복확인 버튼을 클릭 시 아이디 중복검사
	$('#signUp').on('click', checkForm); //회원가입 버튼을 클릭 시 폼 유효성검사
})
</script>

<!-- javascript -->
<script>
	//아이디 중복체크
	function checkId() {
		var popupX= (window.screen.width/2) - (400/2);
		var popupY= (window.screen.height/2) - (300/2);
		
		var url = "checkId";
		var option = 'width=400, height=300, resizable=no, scrollbars=no, status=no, left=' + popupX + ', top=' + popupY + ', screenX=' + popupX + ', screenY= '+ popupY;
		window.open(url,"",option);
	}

	//회원가입 폼 유효성검사
	function checkForm() {
		
		//변수선언
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var pwc = document.getElementById("pwc");
		var name = document.getElementById("name");
		var nick = document.getElementById("nick");
		var gender = document.getElementById("gender");
		var birth = document.getElementById("birth");
		
		//유효성검사
		if (!id.value) 	{
			alert("아이디를 입력해 주세요.");
			return false;
		}
		if (id.value.length < 5 || id.value.length > 15) {
			alert("아이디는 최소 5자리 이상 최대 15자리입니다.")
			return false;
		}
		
		//(아이디에 특수문자 포함 시 경고해주기)
		
		if (!pw.value) {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		if (!pw.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
		    alert("비밀번호는 영문(대소문자 구분), 숫자, 특수문자(~!@#$%^&*()-_?)를 조합하여 입력해 주세요.");
		    return false;
		}
		if (!pwc.value) {
			alert("비밀번호 확인을 입력해 주세요.");
			return false;
		}
		if (pw.value != pwc.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if (!name.value) {
			alert("이름을 입력해 주세요.");
			return false;
		}
		if (!nick.value) {
			alert("닉네임을 입력해 주세요.");
			return false;
		}

		////////////////////////////////////////////////
		//성별 라디오버튼 미체크시 유효성검사
		//출처: http://gompangyi.tistory.com/59
		
		var frm = document.all;
		var radio_num = document.all.gender.length;
		var chk_i = 0;
		
		for (var i = 0; i < radio_num; i++) {
			if (frm.gender[i].checked == true)	{
				chk_i++;
				break;
			}
		}
		
		if (chk_i <= 0) {
			alert("성별을 선택해 주세요.");
			return false;
		}
		
		////////////////////////////////////////////////
		
		if (!birth.value)	{
			alert("생년월일을 입력해 주세요.");
			return false;
		}
		if (birth.value.length != 6) {
			alert("생년월일은 숫자 6자리로 입력해 주세요.");
			return false;
		}
		if (isNaN(birth.value)) {
			alert("생년월일은 숫자만 입력 가능합니다.");
			return false;
		}
		if (confirm("가입하시겠습니까?")) {
			return true;
		}
		else {
			return false;
		}
	}
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
                <h1>회원가입</h1>
                테스트 페이지. 여기에 컨텐츠를 입력합니다.
            </div>

<!-- 
<div class="jumbotron">
	<div class="container"><h3>회원가입</h3></div>
</div>	
 -->
			<form action="doInsertMember" method="post" onsubmit="return checkForm();">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" class="form-control" name="id" id="id" readonly placeholder="영문자, 숫자를 사용할 수 있으며 최소 5자리 이상 입력해야 합니다.">
					<button type="button" class="btn btn-sm btn-default btn-block" id="checkId">중복확인</button>
			    </div>
			    <div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" name="pw" id="pw" placeholder="영문자, 숫자, 특수문자를 각각 한 글자 이상 포함하여야 합니다.">
					<input type="password" class="form-control" name="pwc" id="pwc" placeholder="비밀번호를 다시 한 번 입력하시기 바랍니다.">
			    </div>
			    <div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" name="name" id="name" placeholder="실명을 입력해 주시기 바랍니다.">
			    </div>
			    <div class="form-group">
					<label for="nick">닉네임</label>
					<input type="text" class="form-control" name="nick" id="nick" placeholder="닉네임을 입력해 주시기 바랍니다.">
			    </div>
			    <div class="form-group">
			    		<label for="gender">성별</label><br>
					<label class="radio-inline"><input type="radio" name="gender" id="male" value="male">남성</label>
					<label class="radio-inline"><input type="radio" name="gender" id="female" value="female">여성</label>
			    </div>
			    <div class="form-group">
					<label for="birth">생년월일</label>
					<input type="text" class="form-control" name="birth" id="birth" placeholder="주민번호 앞자리 6자를 입력하여 주시기 바랍니다. (예: 911205)">
			    </div>
				<!-- <div class="form-group">
					<label for="interest">관심분야</label><br>
					<input type="checkbox" name="interest" id="it" class="interest" value="it"> 아이티
					<input type="checkbox" name="interest" id="japanese" class="interest" value="japanese"> 일본어
					<input type="checkbox" name="interest" id="job" class="interest" value="job"> 취업정보
					<input type="checkbox" name="interest" id="locallife" class="interest" value="locallife"> 현지생활
			    </div> -->
					<button type="submit" class="btn btn-warning" id="signUp">회원가입</button>
					<button type="reset" class="btn btn-warning">다시쓰기</button><br><br><br>
			</form>
		</div>
	</div>
</div>
</body>
</html>