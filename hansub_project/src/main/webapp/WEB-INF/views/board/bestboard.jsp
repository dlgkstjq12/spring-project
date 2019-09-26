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

<script>
//게시판 목록 페이지로 이동하게 하는 함수
function list(page){
	console.log("페이지를 이동합니다.");
	location.href="list.do?curPage="+page;
};

</script>



<%@ include file="../include/login.jsp"%><br>
	


<center>
<h2>베스트 게시물 게시판</h2>
<table border = "1" width = "800px" align = "top">
<center>
	<tr>
		
		<th>추천수 순위</th>
		<th>회원 게시글 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>날짜</th>
		<th>조회수</th>
		<th>추천수</th>

		
	<!-- forEach var = "개별데이터" items = "집합데이터" -->
	<c:forEach var = "row" items = "${map.list}"> <!-- 컨트롤러에서 map안에 list를 넣었기 때문에 이렇게 받는다. -->
	<tr>
		<td>${row.rk}</td>	<!-- 게시글 순위 -->
		<td>${row.member_bno}</td>	<!-- 글번호 -->
		<!-- 클릭하면 컨트롤러의 view.do로 이동하고, 게시물번호, 페이지 번호, 검색옵션, 키워드를 같이 넘긴다 -->
		<td>
		<a href="best_board_view.do?member_bno=${row.member_bno}">${row.title}</a>
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
	

</table>


<form name="form1" method="post" action="list.do">
    <select name="search_option">
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
    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="조회">
   
</form>

 


</center>
<br><br><%@ include file="../include/Botton.jsp"%>
</body>
</html>