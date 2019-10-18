<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../include/header.jsp"%>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">


<style>
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > thead > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
</style>


<script>

$(function(){

	//댓글 수정 버튼
	$("#btn_reply_Update").click(function(){
    if(confirm("수정 하시겠습니까?")){
    	
    //수정하는데 필요한 정보들, 댓글 번호, 글 내용, 작성자 아이디, 게시글 번호를 변수에 저장한다.
    	var rno = $("#rno").val();
    	var r_content = $("textarea#r_content").text();
    	var user_id = $("#user_id").val();
    	var member_bno = $("#bno").val();
    	
    //게시글 세부 페이지로 포워딩을 하기위해 페이지 관련 값들을 변수에 저장해서 컨트롤러로 보낸다.
		var curPage = $("#curPage").val();
		var search_option = $("#search_option").val();
		var keyword = $("#keyword").val();
		
		//페이지 관련 값들과 댓글 수정에 필요한 값들을 url로 전송한다.
    	document.form1.action="admin_board_reply_update.do?rno="+rno+"&r_content="+encodeURI(r_content)+"&user_id="+user_id+"&bno="+bno+"&curPage="+curPage+"&search_option="+search_option+"&keyword="+keyword;
    	document.form1.submit();
    	
    	
    	alert("댓글이 수정되었습니다.")
    			}
		});

	
	//댓글 삭제 버튼
	$("#btn_reply_Delete").click(function(){
		
		if(confirm("삭제 하시겠습니까?")){
		
		//댓글 삭제를 하기위해 댓글 번호, 글 번호, 댓글 내용, 그리고 게시글 세부 페이지로 포워딩 하기 위해 페이지 관련 값들을 변수에 저장한다.
			var rno = $("#rno").val();
			var bno = $("#bno").val();
			var content = $("textarea#r_content").text();
			var curPage = $("#curPage").val();
			var search_option = $("#search_option").val();
			var keyword = $("#keyword").val();
			
			
			//url로 삭제에 필요한 변수들을 보낸다.
			document.form1.action="admin_board_reply_delete.do?rno="+rno+"&bno="+bno+"&curPage="+curPage+"&search_option="+search_option+"&keyword="+keyword;
		    
			document.form1.submit();
		    
			alert("댓글이 삭제되었습니다.")
	    	
		}
	});
});

</script>



<body>
<!-- 배열이 비어있지 않으면 참을 출력함. (다시말해서 배열에 값들이 있으면 댓글 리스트를 출력한다.) -->



<c:if test = "${not empty map.list}">
<h2>댓글 리스트</h2>
<div class="input-group input-group-sm" role="group" style = "text-align:left">
<table class="table table-striped table-bordered" border = "1" width = "800px" align = "left">

<c:forEach var = "row" items = "${map.list}">

<tr><td><br></td></tr>

<tr>
<td>닉네임 : ${row.user_id}</td>
</tr>

<tr>
<td>작성일자 : ${row.reg_date}   댓글번호 : ${row.rno }</td>
</tr>

<tr>
<td>댓글 내용 : ${row.r_content}</td>
</tr>

<!-- 폼태그 안에 위쪽에 있는 자바스크립트 구문에 필요한 값들을 노출시키지 않게 하기 위해 hidden타입으로 값들을 전달한다. -->
<form method = "POST" id = "form1">

<input type = "hidden" id = "rno" name = "rno" value = "${row.rno}">
<input type = "hidden" id = "user_id" name = "user_id" value = "${row.user_id}">
<input type = "hidden" id = "bno" name = "bno" value = "${row.bno}">
<input type = "hidden" id = "curPage" name = "curPage" value = "${curPage}">
<input type = "hidden" id = "search_option" name = "search_option" value = "${search_option}">
<input type = "hidden" id = "keyword" name = "keyword" value = "${keyword}">


<tr>
<td>
<div style = "width : 800px;">
<textarea class="form-control" placeholder="수정할 내용을 입력하세요" id = "r_content" name = "r_content" rows = "3" cols = "80"></textarea></div><br><br>
</td>
</tr>
</form>	
	





<!-- 본인일 경우에만 댓글 수정버튼과 댓글 삭제 버튼이 출력되도록 설정함 -->

<div style = "width:700px; text-align:right;">

<c:if test = "${sessionScope.user_id == row.user_id or sessionScope.navername == row.user_id or sessionScope.kakaonickname == row.user_id or sessionScope.facebookname == row.user_id}">

<tr>
<td>
<div class="btn-group btn-group-sm" role="group" aria-label="...">
<div style = "text-align:center;" >
<button type = "button" id = "btn_reply_Update" class="btn btn-default">댓글 수정</button>
<button type = "button" id = "btn_reply_Delete" class="btn btn-default">댓글 삭제</button>
</div>
</div>
</td>
</tr>

</c:if>

<!-- 관리자아이디로 로그인했을 경우에 삭제버튼을 출력 -->
<c:if test = "${sessionScope.admin_id != null}">

<tr>
<td>
<div class="btn-group btn-group-sm" role="group" aria-label="...">
<div style = "text-align:center;" >
<button type = "button" id = "btn_reply_Delete" class="btn btn-default">댓글 삭제</button>
</div>
</div>
</td>
</tr>

</c:if>


</div>


<br><br>
</td>
</tr>



</c:forEach>
</table>
</c:if>


</body>
</html>