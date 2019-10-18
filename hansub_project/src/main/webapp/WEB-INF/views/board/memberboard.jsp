<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<link rel = "stylesheet" href = "/css/bootstrap.css">

<style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: center;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
    
 .out {
 width: 100%;
 text-align: center;
 }
 
.in {
 display: inline-block;
 }
  </style>



<script>
//게시판 목록 페이지로 이동하게 하는 함수
function list(page){
	console.log("페이지를 이동합니다.");
	location.href="list.do?curPage="+page;
};

//글쓰기 폼으로 이동하게 하는 함수
$(function(){	
		$("#btnWrite").click(function(){
			location.href="write.do";
		});
});

</script>



<%@ include file="../include/login.jsp"%><br>
	


<div style= "width:80%; float:right;">
<div id = "list">
<span style="color: green; font-weight: bold;"><d>회원 게시판</d></span>
<table class="table table-striped table table-hover" align = "top">
<center>
<thead>
	<tr>
	
		<th width = "10%">게시글 번호</th>
		<th width = "20%">제목</th>
		<th width = "20%">작성자</th>
		<th width = "20%">내용</th>
		<th width = "10%">날짜</th>
		<th width = "10%">조회수</th>
		<th width = "10%">추천수</th>

	</tr>
	</thead>
	<tbody>
	
	<!-- forEach var = "개별데이터" items = "집합데이터" -->
	<c:forEach var = "row" items = "${map.list}"> <!-- 컨트롤러에서 map안에 list를 넣었기 때문에 이렇게 받는다. -->
	<tr>
		<td>${row.member_bno}</td>	<!-- 글번호 -->
		<!-- 클릭하면 컨트롤러의 view.do로 이동하고, 게시물번호, 페이지 번호, 검색옵션, 키워드를 같이 넘긴다 -->
		<td>
		<a href="view.do?member_bno=${row.member_bno}      
&curPage=${map.pager.curPage}
&search_option=${map.search_option} 
&keyword=${map.keyword}">${row.title}</a>
<c:if test="${row.rcnt > 0}"> 
   <span style="color:red;">( ${row.rcnt} )</span> 
</c:if>  
</td>

		<td>${row.user_id}</td>	<!-- 작성자의 이름 -->
		<td>${row.content}</td>	<!-- 글의내용 -->
		<td>${row.reg_date}</td>	<!-- 날짜의 출력형식을 변경함 -->
		<td>${row.viewcnt}</td>	<!-- 조회수 -->
		<td>${row.recommend}</td>	<!-- 추천수 -->


	
	</tr>
	</c:forEach>
	</tbody>
	
	<!-- 페이지 네비게이션 출력 -->
	<tr>
		<td colspan = "7" align = "center">
			<c:if test="${map.pager.curBlock > 1}">
  <a href="#" onclick="list('1')">[처음]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 (뒤쪽에 있기때문에) 처음으로 갈 수 있도록 링크를 추가 -->
        
            <c:if test="${map.pager.curBlock > 1}">
                <a href="#" onclick="list('${map.pager.prevPage}')">
                [이전]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 이전 블록으로 이동할 수 있도록 링크 추가 -->
            
            <c:forEach var="num"
                begin="${map.pager.blockBegin}"
                end="${map.pager.blockEnd}">
                <c:choose>
                    <c:when test="${num == map.pager.curPage}">
                    
                    <!-- 현재 페이지인 경우 하이퍼링크 제거 -->
                    <!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리를 한다. -->
                        <span style="color:red;">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="list('${num}')" >${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            
            <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
                <a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 -->
            
            
            <c:if test="${map.pager.curPage <= map.pager.totPage}">
                <a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작거나 같으면 끝으로 갈 수 있도록 링크를 추가함-->
			</td>
	</tr>
	
	</center>
</table>
</div>

<center>


<form name="form1" method="post" action="list.do">
<div class = "search row" style = "margin:auto;">
	<div class = "col-xs-2 col-sm-2" style = "margin:auto;">
    <select name="search_option" class = "form-control" align = "center">
        <option value="user_id"
<c:if test="${map.search_option == 'user_id'}">selected</c:if>
        >작성자</option>
        <option value="title" 
<c:if test="${map.search_option == 'title'}">selected</c:if>
        >제목</option>
        <option value="content" 
<c:if test="${map.search_option == 'content'}">selected</c:if>
        >내용</option>
        <option value="all" 
<c:if test="${map.search_option == 'all'}">selected</c:if>
        >작성자+내용+제목</option>
    </select>
 </div>   


<div class = "col-xs-2 col-sm-2" style = "margin:auto;">
	<div class = "input-group" style = "margin:auto;">
    <input type = "text" name="keyword" value="${map.keyword}" class = "form-control" style="width:300px;" align = "center">  </div>  </div>
    <input type = "submit" value="조회" class = "btn btn-default" align = "center"> 
    <button type = "button" id = "btnWrite" align = "center" class = "btn btn-default">글쓰기</button>
    
</div>
</div>
</center> 
   
</form>

 </div>


</center>
</body>
</html>