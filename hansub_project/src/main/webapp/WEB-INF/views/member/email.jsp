<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

<!-- css코드를 추가함 -->
<link rel = "stylesheet" href = "/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


 
</head>
<%@ include file="../include/menu.jsp"%><br>
<body>

<center>

<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:40rem; border-radius:20px;">
		
<div class="card-body">


<center>
<span style="color: green; font-weight: bold;">이메일 인증 </span><br>	

<span style="color: red; font-weight: bold;">(이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</span><br><br>
		<br> <br>
		
		<div style="text-align:center;">
			
				<center>
		
		<!-- 넘겨받은 이메일이 없을시 출력되는 구문  -->
		<c:if test = "${e_mail == null}">
						<form action="email_check.do" method="post">
						<span style="color: black; font-weight: bold;">	이메일 </span><br><br>
							
							<input type="email" name="e_mail" placeholder="이메일주소를 입력하세요." class="form-control"><br><br> 
								
								<button type="submit" name="submit" class="form-control btn btn-primary">중복확인</button></form>
						</div>													
		</c:if>


		<!-- 넘겨받은 이메일이 있을시에 출력되는 구문, 이메일 중복확인을 한 후에 다른 이메일로 변경하지 못하도록 이메일 값을 그대로 받아옴  -->
		<c:if test = "${e_mail != null}">
		
					
					<form action="auth.do${e_mail}" method="post">
					
					<center>
						<span style="color: black; font-weight: bold;">이메일 : </span> <span style="color: red; font-weight: bold;">${e_mail}</span>
						<br> <br>
						<button type="submit" name="submit" class="form-control btn btn-primary">이메일 인증받기 (이메일 보내기)</button>
						
						</c:if>
				
					</center>
						</form>
						</center>
						</div>
						</div>
			</table>
	
</center>

</body>
</html>