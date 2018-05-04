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
<title>내단어장</title>
<style>
.modal-dialog {
    width: 1000px;
    margin: 30px auto;
}
.pagination>.active>a, 
.pagination>.active>a:focus, 
.pagination>.active>a:hover, 
.pagination>.active>span, 
.pagination>.active>span:focus, 
.pagination>.active>span:hover {
	background-color: orange;
	border-color: orange;
}
td {height: 10px;}
</style>
<script>
$(document).ready(function() {
	/* alert('jQuery 실행 확인'); */
	
	//확대 버튼 클릭 시
	$('.zoom').on('click', zoomText);
	
	//수정 버튼 클릭 시
	$('.modify').on('click', modifyText);
});

function zoomText() {
	var tr = $(this).parent().parent();
	var td = tr.children();
	var inputText = td.eq(1).text();
	var outputText = td.eq(2).text();
	
	
}

function modifyText() {
	/* alert('현재 수정버튼의 상태는 modify 클래스입니다.'); */
	
	//수정 버튼을 this 선택자로 선택한다.
	var modifyBtn = $(this);
	
	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	var tr = $(this).parent().parent();
	var td = tr.children();
	
	//해당 열의 값들이 잘 들어오는지 테스트 알럿/////////////////////////
	var hiddenIndex = td.eq(4).html();
	var index = td.eq(0).attr('id');			//실제 디비에 저장된 시퀀스 번호
	var num = td.eq(0).text();				//글번호
	var inputText = td.eq(1).text();			//입력단어
	var outputText = td.eq(2).text();		//출력단어
	var date = td.eq(3).text(); 				//날짜
	var modifyBtn1 = td.eq(4).next().html();	//수정버튼 (.html(); 해야 보임.)
	var deleteBtn = td.eq(5).text(); 		//삭제버튼
	var inputTextDiv = td.eq(1).html();
	var outputTextDiv = td.eq(2).html();
	
	/* alert('hiddenIndex' + hiddenIndex + '\n'
		+ 'index: ' + index + '\n'
		+ 'num: ' + num + '\n'
		+ 'inputText: ' + inputText + '\n'
		+ 'outputText: ' + outputText + '\n'
		+ 'date: ' + date + '\n'
		+ 'modifyBtn1: ' + modifyBtn1 + '\n'
		+ 'deleteBtn: ' + deleteBtn + '\n'
		+ 'inputTextDiv: ' + inputTextDiv + '\n'
		+ 'outputTextDiv: ' + outputTextDiv); */
	///////////////////////////////////////////////////////////
	
	//입력단어 및 출력단어 란을 각각 수정폼으로 바꾼다.
	td.eq(1).html('<textarea class="form-control" type="textarea" id="inputTextDiv' + index + '" rows="1" style="resize: none; height: 100px">' + inputText + '</textarea>');
	td.eq(2).html('<textarea class="form-control" type="textarea" id="outputTextDiv' + index + '" rows="1" style="resize: none; height: 100px">' + outputText + '</textarea>');
	
	//버튼에서 modify 클래스를 없애고 save 클래스를 부여한다.
	$('#modify' + index).addClass('save');				//해당 버튼에만 save 클래스를 부여한다.
	$('#modify' + index).off('click', modifyText);		//해당 버튼만 modifyText 이벤트를 종료시킨다.
	$('#modify' + index).removeClass('modify');			//해당 버튼만 modify 클래스를 삭제한다.
	$('.save').on('click', saveText);			//save 클래스에 저장 이벤트를 설정한다. (해당 버튼에만 설정됨)
}

function saveText() {
	/* alert('현재 수정버튼의 상태는 save 클래스입니다.'); */
	
	var saveBtn = $(this);
	
	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	var tr = $(this).parent().parent();
	var td = tr.children();
	
	//해당 열의 값들이 잘 들어오는지 테스트 알럿/////////////////////////
	var index = td.eq(0).attr('id');
	var num = td.eq(0).text();				//글번호
	var inputText = td.eq(1).html();			//입력단어
	var outputText = td.eq(2).html();		//출력단어
	var date = td.eq(3).text(); 				//날짜
	var modifyBtn1 = td.eq(4).text();		//수정버튼
	var deleteBtn = td.eq(5).text(); 		//삭제버튼
	var inputTextDiv = td.eq(1).html();
	var outputTextDiv = td.eq(2).html();
	
	/* alert('index: ' + index + '\n'
		+ 'num: ' + num + '\n'
		+ 'inputText: ' + inputText + '\n'
		+ 'outputText: ' + outputText + '\n'
		+ 'date: ' + date + '\n'
		+ 'modifyBtn1: ' + modifyBtn1 + '\n'
		+ 'deleteBtn: ' + deleteBtn + '\n'
		+ 'inputTextDiv: ' + inputTextDiv + '\n'
		+ 'outputTextDiv: ' + outputTextDiv); */
	
	//변경한 input 또는 output 받기
	var modifiedInput = $('#inputTextDiv' + index).val();
	var modifiedOutput = $('#outputTextDiv' + index).val();
	/* alert('modifiedInput: ' + modifiedInput + '\n'
		+ 'modifiedOutput: ' + modifiedOutput); */
	///////////////////////////////////////////////////////////
	
	//변경한 문자를 DB에 저장
	$.ajax({
		url: 'saveVoca',
		method: 'post',
		dataType: 'text',
		data: {num: index
			 , inputText: modifiedInput
			 , outputText: modifiedOutput},
		success: function(flag) {
			if (flag == 1) {
				alert('수정이 완료되었습니다.');
			}
			else {
				alert('수정에 실패하였습니다. 다시 시도해 주시기 바랍니다.');
			}
		},
		error: function() {
			alert('에러가 발생했습니다. 관리자에게 문의해 주시기 바랍니다.');
		}
	})
	
	//변경된 문자를 DB에서 꺼내와 화면에 뿌리기
	$.ajax({
		url: 'getModifiedVoca?num=' + index,
		method: 'get',
		dataType: 'json',
		success: function(voca) {
			td.eq(1).html(voca.inputText);
			td.eq(2).html(voca.outputText);
			//location.reload();
			
			//수정을 완료하였으면 버튼의 클래스와 이벤트를 다시 바꾼다.
			$('.save').addClass('modify');			//save 클래스에 modify 클래스를 추가하고 (save 클래스는 현재 버튼에만 설정되어 있음. 즉 현재 버튼에만 modify 클래스 추가. 다른 것들은 이미 modify 클래스가 남아있는 상태임.)
			$('.save').off('click', saveText);		//save 클래스의 이벤트를 종료하고
			$('.save').removeClass('save');			//save 클래스 자체도 제거한다.
			$('#modify' + index).on('click', modifyText);		//해당 버튼에서만 지워졌던 modifyText 이벤트를 다시 설정한다.
		},
		error: function(voca) {
			alert('저장된 단어를 불러오는 도중 에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
		}
	})
}

//단어삭제
function deleteVoca(num) {
	//정말 삭제할건지 한 번 더 확인
	var con = confirm("정말 삭제하시겠습니까?");
	
	//확인 클릭 시 삭제
    if (con == true) {
	    	$.ajax({
	    		url: 'deleteVoca',
	    		method: 'post',
	    		data: {num: num},
	    		dataType: 'text',
	    		success: function() {
	    			alert('삭제가 완료되었습니다.');
	    			window.location.reload();
	    		},
	    		error: function() {
	    			alert('에러가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다.');
	    		}
	    	})
    }
	//취소 클릭 시 취소
    else {
		return false;    	
    }
}

//크게보기
function zoom(inputText, outputText) {
	alert(inputText + outputText);
}

//페이지 이동
function goBoardList(page) {
	location.href = "note?page=" + page;
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
    		
    			<div class="well well-warning" style="cursor: pointer;" onclick="location.href='insertQuestion?category=${param.category}'">
              	<h1>내단어장</h1> 번역한 문장을 저장하여 두고두고 공부할 수 있습니다.
            </div>
            
            <!-- 등록단어 검색 폼 -->
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
		        <th>날짜</th>
		        <th style="width: 42px; text-align: center">확대</th>
		        <th style="width: 42px; text-align: center">수정</th>
		        <th style="width: 42px; text-align: center">삭제</th>
		      </tr>
		    </thead>
		    <tbody>
		    <!-- 게시글 목록 -->
		    <c:forEach var="i" items="${vocaList}" varStatus="s"><%-- ${전체게시글수 - (현재페이지-1)*페이지당 보여지는 게시물수 - i.index} --%>
			  <tr>
		        <td id="${i.num}" style="width: 50px; text-align: center;">${boardCountSum - startPage*10 - s.index + 10} </td>
		        <td>${i.inputText }</td>
		        <td>${i.outputText }</td>
		        <td>${i.date }</td>
		        <td><button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal${i.num}">확대</button></td>
		        <td><button type="button" id="modify${i.num}" class="modify btn btn-warning btn-sm pull-right">수정</button></td>
		        <td><button type="button" class="delete btn btn-warning btn-sm pull-right" onclick="javascript:deleteVoca(${i.num})">삭제</button></td>
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

<!-- Modal -->
<!-- Trigger the modal with a button -->
<c:forEach var="i" items="${vocaList}">
  <div class="modal fade" id="myModal${i.num}" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">크게보기</h4>
        </div>
        <div class="modal-body">
          <p>${i.inputText }</p>
          <p>${i.outputText}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</c:forEach>

</body>
</html>