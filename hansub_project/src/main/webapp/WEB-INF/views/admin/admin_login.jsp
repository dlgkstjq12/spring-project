<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="576736845363-o0474pib5q69qlcv6lm7o42hs6lu5u59.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,
width=device-width" />

<title>Insert title here</title>

<!-- css코드를 추가함 -->
<link rel = "stylesheet" href = "/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">



</head>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>


<br>
<br>
<br>
<br>
<br>

<center>
<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:30rem; border-radius:20px;">
		
<div class="card-body">

<br>
<center>
<span style="color:green; font-weight : bold;">관리자 로그인</span>
</center>

<center>
<!-- 로그인창 -->
<form action ="admin_login.do" method = "post">
<center>
<br>
<input type = "text" name="admin_id" placeholder="  ID를 입력하세요 " class="form-control"><br><br>
<input type = "password" name="admin_pass" placeholder="  비밀번호를 입력하세요 " class="form-control"><br><br>
<button type = "submit" name = "submit" class="form-control btn btn-primary">로그인</button>

<br>
<br>

</center>

<center>


</form>
</center>
</div>
</div>

</table>
</center>

</body>


<!-- 로그인 실패나 성공시 메시지를 받아서 출력하는 자바스크립트 구문 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	$(function(){
		var responseMessage = "<c:out value="${message}" />";
		if (responseMessage != ""){
			alert(responseMessage)
		}
	})
</script>



</html>