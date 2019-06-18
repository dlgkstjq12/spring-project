<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
//수정 버튼#은 id이고 btnUpedate태그 (Update 버튼)를 누르면 update.do 페이지로 넘어감
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/member/update.do";
		document.form1.submit();
	});
//삭제 버튼 #은 id이도 btnDelete태그 (Delete 버튼)를 누르면 경고창 (삭제하시겠습니까?) 출력하고,
//delete.do 페이지로 넘어간다.
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/member/delete.do";
			document.form1.submit();
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원 정보</h2>
<form name="form1" method="post">
<table border="1" width="400px">
	<tr>
		<td>아이디</td>
		<td><input name="userid" value="${dto.userid}" readonly></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="name" value="${dto.name}"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input name="email" value="${dto.email}"></td>
	</tr>
	<tr>
		<td>회원가입일자</td>
		<td><fmt:formatDate value="${dto.join_date}" 
			pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<!-- 수정버튼과 삭제버튼을 누를때 비밀번호가 틀리면 아래 메시지를 출력 -->
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete">
			<div style="color:red; ">${message}</div>
		</td>
	</tr>
</table>
</form>
</body>
</html>









