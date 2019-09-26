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

		<center>
		<br>
		<br>
		<br>


<c:if test = "${map.list != null}">


<center>

<span style="color: green; font-weight: bold;">나의 프로필</span> <br> <br>

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