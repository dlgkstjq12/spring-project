<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.thoughtworks.qdox.parser.ParseException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
		<br>
		<span style="color: green; font-weight: bold;">회원 정보 검색</span> <br> <br>
		</center>

<!-- 회원의 아이디를 입력하면 해당 회원에 정보가 하단에 출력되게 함 -->
<form action = "find_member.do" method = "post">
<center>
회원 아이디 : <input type="text" name="user_id" placeholder="아이디를 입력하세요.">
<button type = "submit" name = "submit" >확인</button><br><br><br>
</center>
</form>

<c:if test = "${map.list != null}">


<center>

<span style="color: green; font-weight: bold;">해당하는 회원 정보</span> <br> <br>

<table border="1" width="300" height="250">
	
		<div style="text-align:center;">
			<tr>		
				<td>
					
					<center>
						<div>	
	<c:forEach var = "member" items = "${map.list}"><!-- 컨트롤러에서 넘어온 map의 값 --> 
	
							아이디 : ${member.user_id} <br><br>
							
							이메일 : ${member.e_mail} <br><br>
							
							가입날짜 : ${map.re_join_date} <br><br>
							
						</div>						
						
						
					</center>
						
					</td>
				</tr>
				</div>
				</c:forEach>
			</table>
			</center>

</c:if>



<br><br><%@ include file="../include/Botton.jsp"%>
</body>
</html>