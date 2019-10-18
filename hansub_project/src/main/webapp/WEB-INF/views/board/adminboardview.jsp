<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>

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
	
	//목록 버튼
	$("#btnList").click(function(){
    	location.href="admin_board_list.do";
	});


	//수정 버튼
	$("#btnUpdate").click(function(){
    if(confirm("수정하시겠습니까?")){
    document.form1.action="admin_board_update.do";
    document.form1.submit();
    if(document.form1.submit()){
    	alert("공지사항이 수정되었습니다.")
    		}
    	}
	});


	//댓글쓰기 버튼 (버튼을 눌러서 id값이 넘어와서 실행되는 자바스크립트 구문)
	listReply();

		
	$("#btnReply").click(function(){
		if(confirm("댓글을 작성하시겠습니까?")){
	var r_content = $("#r_content").val();	//댓글의 내용
	var bno =  "${dto.bno}";
	var params = {"r_content" : r_content, "bno" : bno};
	
	
	$.ajax({
		type: "post", //데이터를 보낼 방식
		url: "admin_board_reply_insert.do", //데이터를 보낼 url
		data: params, //보낼 데이터
	
		
		complete: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
			alert("댓글이 등록되었습니다.");
			listReply2();
				}
			});
		}
	});
	
	

	
//댓글 목록을 출력하는 함수
function listReply(){
	$.ajax({
		type: "get",	//get방식으로 자료를 전달
		url: "admin_board_reply_list.do?bno=${dto.bno}&curPage=${curPage}&search_option=${search_option}&keyword=${keyword}",	//컨트롤러에 있는 list.do로 맵핑되고 게시글 번호도 같이 보낸다.
		success: function(result){	//자료를 보내는것이 성공했을때 출력되는 메시지
			
			//댓글목록을 실행한 결과를 가져온다.
		$("#listReply").html(result);
			}
		});
}




function listReply2(){
	$.ajax({
		type: "get",
		contentType: "application/json",
		url: "admin_board_reply_list_json.do?bno=${dto.bno}",
		success: function(result){
			console.log(result);
			var output="<table>";
			for(var i in result){
				var repl=result[i].replytext;
				repl = repl.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
				repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
				repl = repl.replace(/>/gi,"&gt;");
				repl = repl.replace(/\n/gi,"<br>"); //줄바꿈 처리
				
				output += "<tr><td>"+result[i].name;
				date = changeDate(result[i].regdate);
				output += "("+date+")";
				output += "<br>"+repl+"</td></tr>";
			}
			output+="</table>";
			$("#listReply").html(output);
		}
	});
}




//삭제 버튼
$("#btnDelete").click(function(){
    if(confirm("삭제하시겠습니까?")){
        document.form1.action="admin_board_delete.do";
        document.form1.submit();
    if(document.form1.submit()){
    	alert("공지사항이 삭제되었습니다.");
    		}
    	}
	});
	
	
	
});


</script>

<h2>공지사항 보기</h2>
<!-- 게시물을 작성하기 위해 컨트롤러의 insert.do로 맵핑 -->
<form id="form1" name="form1" method="post" action="${path}/board/admin_board_insert.do">
<div class="input-group input-group-sm" role="group" style = "text-align:left">
<table class="table table-striped table-bordered">
<tread>

<tr>
<td><input type = "hidden" id = "bno" name = "bno" value = "${dto.bno }" class="form-control" aria-describedby="basic-addon1">글번호 : ${dto.bno }</td>
</tr>

<tr>
<td><input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력하세요" class="form-control" aria-describedby="basic-addon1"></td>
</tr>


<!-- placeholder은 제목을 입력할 수 있도록 도움말을 출력함 -->
    <tr>
    <td>조회수 : ${dto.viewcnt}</td>
    </tr>
    
<tr>
<div style="width:800px;">
<td><textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea></td>
</div>
</tr>
</tread>
</table>

</div>
</form>


 
<!-- 마찬가지로 내용을 입력하도록 도움말을 출력함 -->
<script>
// ckeditor 적용
//id가 content인 태그 (글의 내용을 입력하는 태그)를 ck에디터를 적용한다는 의미
CKEDITOR.replace("content",{
    height: "300px"
});

</script>

<div style = "width:700px; text-align:center;">
<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장한다. -->
	<input type = "hidden" name = "bno" value = "${dto.bno }">
	
	
	
	
	<!-- 관리자에게는 삭제 버튼을 표시한다. -->
	<c:if test = "${sessionScope.admin_id != null}">
	<div class="btn-group btn-group-sm" role="group" aria-label="...">
	<div style = "text-align:center;" >
			<button type = "submit" id = "btnUpdate" class="btn btn-default" >수정</button>
			<button type = "button" id = "btnDelete" class="btn btn-default" >삭제</button>
			</div></div>
	</c:if>
	
	
	
	<!-- 글목록은 본인이 아니어도 확인 가능하게 한다. -->
	<div class="btn-group btn-group-sm" role="group" aria-label="...">
	<div style = "text-align:center;" >
	<button type = "button" id = "btnList" class="btn btn-default">목록</button>
	</div></div>
	
	<!-- 로그인이 되어있는 상태에서만 댓글 작성 버튼이 출력되도록 한다. -->
	
	<c:if test = "${sessionScope.user_id != null or sessionScope.navername != null 
	or sessionScope.kakaonickname != null or sessionScope.facebookname != null}">
	<br><br><br>
	<div class="btn-group btn-group-sm" role="group" aria-label="...">
	<div style = "text-align:center;" >
	<textarea rows = "5" cols = "80" id = "r_content" name = "r_content" class="form-control" aria-describedby="basic-addon1" placeholder="댓글을 입력하세요."></textarea>
	</div></div>
	<br>
	
	
	<!-- 댓글쓰기 버튼을 클릭하면 위쪽에 있는 자바스크립트 구문이 실행되어서 컨트롤러로 맵핑됨 --><br><br>
	
	<div class="btn-group btn-group-sm" role="group" aria-label="...">
	<div style = "text-align:center;" >
	
	<button type = "button" id = "btnReply" class="btn btn-default">댓글쓰기</button>
	</div></div>
	</c:if>
	
	<!-- 댓글 목록 -->
	<!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다. -->
	<div id = "listReply"></div>
	
<body>
</body>
</html>