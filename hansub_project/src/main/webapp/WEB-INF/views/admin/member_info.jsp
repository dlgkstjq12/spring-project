<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.thoughtworks.qdox.parser.ParseException"%>
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
<body>

<!-- 회원정보에 없는 아이디를 입력할 시에 출력되는 경고창 -->
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
		<br>
		<br>
		
<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:50rem; border-radius:20px;">
		
<div class="card-body">
		
		
		<span style="color: green; font-weight: bold;">회원 정보 검색</span> <br> <br>
		</center>

<!-- 회원의 아이디를 입력하면 해당 회원에 정보가 하단에 출력되게 함 -->
<form action = "find_member.do" method = "post">
<center>
<span style="color: black; font-weight: bold;">회원 아이디<br><br>

<input type="text" name="user_id" placeholder="아이디를 입력하세요." class="form-control"><br><br>
<button type = "submit" name = "submit" class="form-control btn btn-primary">확인</button><br><br><br>
</center>
</form>
</div>
</div>
</table>
</center>


<c:if test = "${map.list != null}">


<center>

<span style="color: green; font-weight: bold;">해당하는 회원 정보</span> <br> <br>

<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:50rem; border-radius:20px;">
		
<div class="card-body">
	
		<div style="text-align:center;">
			
					
<center>
							
	<c:forEach var = "member" items = "${map.list}"><!-- 컨트롤러에서 넘어온 map의 값 --> 
	
  <span style="color: black; font-weight: bold;">아이디 :</span>
  <span style="color: red; font-weight: bold;"> ${member.user_id}</span><br><br>
							
  <span style="color: black; font-weight: bold;">이메일 :</span>
  <span style="color: red; font-weight: bold;">${member.e_mail}</span><br><br>
							
	
  <span style="color: black; font-weight: bold;">가입날짜 :</span>
  <span style="color: red; font-weight: bold;"> ${map.re_join_date} <br><br>
							
												
						
						
					</center>
					</div>
					</div>
				
					
				</div>
				</c:forEach>
			</table>
			</center>

</c:if>




</body>
</html>