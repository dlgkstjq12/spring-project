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

<style>
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > thead > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
</style>

  </style>

</head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%><br>
<body>

		<center>
		<br>
		<br>
	


<c:if test = "${map.list != null}">


<center>

<span style="color: green; font-weight: bold;">나의 프로필</span> <br>

<div class="input-group input-group-sm" role="group" style = "text-align:left">
<table class="table table-striped table-bordered" border = "1" width = "500px" align = "center">
	
		<div style="text-align:center;">
		
					
					<center>
							
	<c:forEach var = "member" items = "${map.list}"><!-- 컨트롤러에서 넘어온 map의 값 --> 

<tr>
	<td rowspan="3"><img src="https://t1.daumcdn.net/cfile/tistory/99C6A63A5D9EDFA321" width=100px, height=150px /></td>
	<td><span style="color: black; font-weight: bold;">아이디</span></td>
	 <td><span style="color: red; font-weight: bold;"> ${member.user_id}</span></td>
</tr>
<br><br>

<tr>
<td><span style="color: black; font-weight: bold;">이메일</span></td>
<td><span style="color: red; font-weight: bold;">${member.e_mail}</span></td>
</tr>

 <br><br>
							
<tr>
  <td><span style="color: black; font-weight: bold;">가입날짜</span></td>
  <td><span style="color: red; font-weight: bold;"> ${map.re_join_date}</span></td>
</tr>

<br><br>
							
						
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