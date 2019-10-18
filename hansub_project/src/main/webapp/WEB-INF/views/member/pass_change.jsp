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

<div class="card align-middle" style="width:50rem; border-radius:20px;">
		
<div class="card-body">

<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요.</span> <br> <br>	
		
					<form action="pass_change.do${e_mail}" method="post">
					
					<center>
					
						
							<span style="color: black; font-weight: bold;">변경할 비밀번호 입력</span><br><br>
							
							<input type="password" name="member_pass" placeholder="비밀번호를 입력하세요." class="form-control">
														

						<br> <br>
						<button type="submit" name="submit" class="form-control btn btn-primary">비밀번호 변경</button>

					</center>
					</form>
					</div>
					</div>
			</table>
		
</center>

</body>
</html>