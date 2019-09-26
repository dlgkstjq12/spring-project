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
<script>
$(function(){
	
	//목록 버튼
	$("#btnList").click(function(){
    	location.href="best_list.do";
	});

	
//추천하기 버튼
$("#btnRecommend").click(function(){
    if(confirm("해당 글을 추천하시겠습니까?")){
        document.form1.action="recommend.do";
        document.form1.submit();
        
        alert("해당 글을 추천하였습니다.")
        
    	}
	});

	
	
});



</script>

<h2>베스트 게시물 보기</h2>
<!-- 게시물을 작성하기 위해 컨트롤러의 insert.do로 맵핑 -->
<form id="form1" name="form1" method="post" action="${path}/board/insert.do">
<input type = "hidden" id = "member_bno" name = "member_bno" value = "${dto.member_bno }">
    <div>제목 <input name="title" id="title" size="80"
                    value="${dto.title}"
                    placeholder="제목을 입력하세요"><br><br>
<!-- placeholder은 제목을 입력할 수 있도록 도움말을 출력함 -->
    </div>
    <div>조회수 : ${dto.viewcnt}    </div><br><br>
    <div style="width:800px;">
        <textarea id="content" name="content"
rows="3" cols="80" 
placeholder="내용을 입력하세요">${dto.content}</textarea></div><br><br>
</form>


 
<!-- 마찬가지로 내용을 입력하도록 도움말을 출력함 -->
<script>
// ckeditor 적용
//id가 content인 태그 (글의 내용을 입력하는 태그)를 ck에디터를 적용한다는 의미
CKEDITOR.replace("content",{
    height: "300px"
});

CKEDITOR.replace("r_content",{
    height: "300px"
});
</script>

<div style = "width:700px; text-align:center;">
<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장한다. -->
	<input type = "hidden" name = "member_bno" value = "${dto.member_bno }">
	

	<!-- 관리자에게는 삭제 버튼을 표시한다. -->
	<c:if test = "${sessionScope.admin_id != null}">
			<button type = "button" id = "btnDelete">삭제</button>
	</c:if>
	
	
	<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 -->
	<c:if test = "${sessionScope.user_id != null and sessionScope.user_id != dto.user_id
	or sessionScope.navername != null and sessionScope.navername != dto.user_id
	or sessionScope.kakaonickname != null and sessionScope.kakaonickname != dto.user_id
	or sessionScope.facebookname != null and sessionScope.facebookname != dto.user_id}">
			<button type = "button" id = "btnRecommend">추천하기</button>
	
	</c:if>
	
	<!-- 관리자에게도 추천 버튼 출력 -->
	<!-- 관리자에게는 삭제 버튼을 표시한다. -->
	<c:if test = "${sessionScope.admin_id != null}">
			<button type = "button" id = "btnRecommend">추천하기</button>
	</c:if>
	
	
	<!-- 글목록은 본인이 아니어도 확인 가능하게 한다. -->
	<button type = "button" id = "btnList">목록</button><br><br>
	
<body>
<br><br><%@ include file="../include/Botton.jsp"%>
</body>
</html>