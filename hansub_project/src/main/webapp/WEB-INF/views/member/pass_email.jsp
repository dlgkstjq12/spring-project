<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css코드를 추가함 -->
<link rel = "stylesheet" href = "/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


</head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%><br>
<body>


<center>

<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:40rem; border-radius:20px;">
		
<div class="card-body">

<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요.</span><br>

<span style="color: red; font-weight: bold;">(인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</span><br><br>
		<br> <br>
		
		
		<div style="text-align:center;">
				
				
				<center>
					<form action="pass_injeung.do${dice},${e_mail}" method="post">
					
					<center>
						
						
							<span style="color: black; font-weight: bold;">인증번호</span><br><br>
							<input type="number" name="pass_injeung" placeholder="인증번호를 입력하세요." class="form-control">
														

						<br> <br>
						<button type="submit" name="submit" class="form-control btn btn-primary">인증번호 전송</button>
					</center>
					</form>
					</center>
					</div>
					</div>
			</table>
</center>


</body>
</html>