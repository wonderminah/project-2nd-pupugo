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
<style>
.form-control{ box-shadow:none; border-color:#eee;}
.form-control:focus{ box-shadow:none; border-color:#eb973e;}
.form-control-feedback{ line-height:50px;}
.main-btn{ background:#00b09c; border-color:#00b09c; color:#fff;}
.main-btn:hover{ background:#00a491;color:#fff;}
.jumbotron{padding-left:10px;}

@media screen and (min-width: 768px)
.jumbotron 
{
    padding-right: 60px;
    padding-left: 10px;
}
</style>
<title>번역하기</title>
<script>

$(document).ready(function (){
	//전역변수
	var id = document.getElementById('id');
	var inputText = document.getElementById('inputText');
	
	//번역기능 실행
	$('#doTranslate').on('click', doTranslate);
	function doTranslate() {
		//폼으로부터 inputText 받아오기. 미입력시 알림창 리턴.
		if (!inputText.value) {
			alert('번역할 단어 또는 문장을 입력해 주세요.');
			return false;
		}
			//alert(inputText.value);
		
		//ajax를 통해 번역 API에 접근하고 json 객체 형태로 값 받아오기.
		$.ajax({
			url: 'doTranslate',
			type: 'get',
			dataType: 'json',
			data: {inputText: inputText.value},
			success: function(outputText) {
				var outputText = JSON.stringify(outputText.message.result.translatedText);
				var outputTextHtml = outputText.substr(1, outputText.length-2);
				$('#outputText').html(outputTextHtml);
			},
			error: function() {
				alert('에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
			}
		})
	}
	
	//입력글자 제한
	$('#characterLeft').text('1000 자 남았습니다.');
    $('#inputText').keydown(function () {
        var max = 1000;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('더 이상 입력할 수 없습니다.');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');            
        } 
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + ' 자 남았습니다.');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');            
        }
    });
    
    //번역결과 저장
    $('#addToNote').on('click', doAddToNote);
    function doAddToNote() {
    		//inputText 미입력시 알림창 리턴.
    		if (!inputText.value) {
    			alert('번역할 단어 또는 문장을 입력해 주세요.');
    			return false;
    		}
    			//alert(inputText.value);
    		
    		//번역 실행하지 않고 저장버튼 클릭 시 알림창 리턴.
    		var outputText = $('#outputText').html();
    		if (outputText == '단어 또는 문장의 번역 결과가 여기에 표시됩니다.') {
    			alert('번역을 실행해 주세요.');
    			return false;
    		}
    			//alert(outputText);
    		
    		//단어장에 추가기능 실행
    		$.ajax({
    			url: 'doAddToNote',
    			method: 'post',
    			dataType: 'text',
    			data: {id: id.value,
    				   inputText: inputText.value,
    				   outputText: outputText},
    			success: function() {
    				alert('저장이 완료되었습니다.');
    			},
    			error: function() {
    				alert('에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
    			}
    		})
    }
})
</script>
</head> 
<body>
<input type="hidden" id="id" value="${loginMember.getId() }">

<!-- navbar -->
<jsp:include page="../include/includeNavbar.jsp" flush="false"/>

<div class="container">
    <div class="row">
    		<!-- sideMenu -->
    		<jsp:include page="../include/includeSidemenu.jsp" flush="false"/>
    		
    		<!-- content -->
    		<div class="col-sm-12 col-md-9">
    			<div class="well" id="insertBoard" style="cursor: pointer;" onclick="location.href='insertBoard'">
                <h1>번역하기</h1>
                궁금한 내용을 인공지능 로봇에게 물어보세요.
            </div>
            
            <!-- 입력란 -->
			    <div class="form-area">  
			        <form role="form">
			        <br style="clear:both">
	                    <div class="form-group">
	                    <textarea class="form-control" type="textarea" id="inputText" placeholder="번역할 단어 또는 문장을 입력하세요." maxlength="1000" rows="5" style="resize: none;"></textarea>
	                        <span class="help-block"><p id="characterLeft" class="help-block">더이상 입력할 수 없습니다.</p></span>                    
	                    </div>
	            
			        		<button type="button" id="doTranslate" class="btn btn-warning">번역하기</button>
			        </form>
			    </div><br>
            
			<!-- 출력란 -->
		    <textarea class="form-control" type="textarea" id="outputText" placeholder="단어 또는 문장의 번역 결과가 여기에 표시됩니다." rows="5" style="resize: none;"></textarea><br>
		    
		    <button type="button" id="addToNote" class="btn btn-warning">결과저장</button>
    		</div>
    </div>
</div>    
 

</body>
</html>