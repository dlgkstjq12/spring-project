<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>

<!-- css코드를 추가함 -->
<link rel = "stylesheet" href = "/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


</head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%><br>
<body>

<!-- 비밀번호 찾기 페이지 -->
<!-- 에러메시지를 전달받는 함수 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
	$(function(){
		var responseMessage = "<c:out value="${message}" />";
		if (responseMessage != ""){
			alert(responseMessage)
		}
	})
</script>

<center>
<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:50rem; border-radius:20px;">
		
<div class="card-body">


<!-- id와 이메일을 입력하면 컨트롤러로 맵핑 -->
<form action = "find_pass.do" method = "post">
<center>
<br>
<br>
<br>
<span style="color: green; font-weight: bold;">비밀번호 찾기</span><br> <br>

<span style="color: black; font-weight: bold;">아이디</span><br><br>
<input type = "text" name="user_id" placeholder="ID를 입력하세요." class="form-control"><br><br>

<span style="color: black; font-weight: bold;">이메일</span><br><br>
<input type="text" name="e_mail" placeholder="이메일을 입력하세요." class="form-control"><br><br>
<button type = "submit" name = "submit" class="form-control btn btn-primary">확인</button>

<br>
<br>
<span style="color: red; font-weight: bold;">입력하신 이메일로 인증번호가 발송됩니다. 받으신 인증번호를 입력해주세요.</span>
</center>
</form>
</div>
</div>
</table>
</center>

</body>
</html>
