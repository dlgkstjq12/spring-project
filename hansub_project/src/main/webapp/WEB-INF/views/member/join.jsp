<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css코드를 추가함 -->
<link rel = "stylesheet" href = "/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">



</head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%><br>


<!-- 회원가입 페이지 -->


<body>

<center>

<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:40rem; border-radius:20px;">
		
<div class="card-body">

		
		<center>
		<span style="color: green; font-weight: bold;">회원가입</span> 
		<br> <br>

		<div style="text-align:center;">
		
					
						<!-- 받아온 아이디가 없을때 -->
						
						<c:if test = "${user_id == null}">
						<form action="join_id_check.do${e_mail}" method="post">
					<center>
					
					<span style="color: black; font-weight: bold;">아이디</span><br><br>
					
					<div style="width: 60%; height:50px; float: left;">
					<input type="text" name="user_id" placeholder="ID를 입력하세요." class="form-control">  
					</div>
					
					<div style="width: 35%; height:50px; float: right;">
					<button type="submit" name="submit" class="form-control btn btn-info">중복확인</button>
					</div>
							
						<br><br><br>
						
							<span style="color: black; font-weight: bold;">비밀번호</span><br><br>
							<input type="password" name="member_pass" placeholder="  비밀번호를 입력하세요." class="form-control">
						
						<br><br><br>
						
					
							<span style="color: black; font-weight: bold;">인증받은 이메일 : </span> <span style="color: red; font-weight: bold;">${e_mail}</span><br><br><br>
												
						
						<!-- 이메일은 인증받은 이메일을 사용해야 하므로 컨트롤러에서 이메일을 가져와서 사용함 -->
						<!-- 가져온후에 다시 컨트롤러로 넘긴후에 db에 저장하는 식으로 진행 -->
						
						
						<button type="submit" name="submit" class="form-control btn btn-success">회원가입</button>
					
					</center>
					</form>
					</center>
					</div>
			</div>
				
			</table>
			</center>
		
							</c:if>
							<!-- 아이디 중복확인을 한 후에 아이디를 받아왔을 경우에 출력되는 부분 -->
						<c:if test = "${user_id != null}">
						<form action="join_check.do${user_id},${e_mail}" method="post">
					<center>
						
							<span style="color: black; font-weight: bold;">아이디</span><br><br>
							
							<span style="color: black; font-weight: bold;">사용가능한 아이디 :</span> <span style="color: red; font-weight: bold;">${user_id}</span>
													
						
						<br><br><br>
						
							<span style="color: black; font-weight: bold;">비밀번호</span><br><br>
							<input type="password" name="member_pass" placeholder="  비밀번호를 입력하세요." class="form-control">
						
						<br><br><br>
						
							<span style="color: black; font-weight: bold;">인증받은 이메일 : </span> <span style="color: red; font-weight: bold;">${e_mail}</span><br><br><br>
										
						
						<!-- 이메일은 인증받은 이메일을 사용해야 하므로 컨트롤러에서 이메일을 가져와서 사용함 -->
						<!-- 가져온후에 다시 컨트롤러로 넘긴후에 db에 저장하는 식으로 진행 -->
						
						<br> <br>
						<button type="submit" name="submit" class="form-control btn btn-success">회원가입</button>
					</center>
					</form>	
				</center>
				</div>
				</div>
				
			</table>
			</center>
		
							</c:if>	

		</center>

</body>
</html>