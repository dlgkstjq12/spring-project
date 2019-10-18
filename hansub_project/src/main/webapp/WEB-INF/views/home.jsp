<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
<head>


  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link href="/css/bootstrap.css" rel="stylesheet">
<header class="masthead">
<link href="/css/agency.css" rel="stylesheet">

	<style>
      d {
        font-family: "Arial Black", sans-serif;
        font-size: 45px;
        font-weight: bold;
        color: #ffffff;
      }
      .s3 { text-shadow: 6px 2px 2px gray; }
      
      
       c {
        font-family: "Arial Black", sans-serif;
        font-size: 45px;
        font-weight: bold;
        color: gren;
      }
      
      .s4 { text-shadow: 10px 4px 4px red; }
      
       p {
        margin: 20px;
        padding: 20px 0px;
        text-align: center;
        text-transform: uppercase;
        font-family: "Arial Black", sans-serif;
        font-size: 60px;
        font-weight: bold;
      }
      .s2 {
    
        color: #ffffff;
        text-shadow: 4px 4px 0px #bdbdbd;
      }
      
      
    </style>
  
  
	</head>


<%@ include file="include/header.jsp"%>
<%@ include file="include/menu.jsp"%>

<body background = "https://i.pinimg.com/originals/c6/4a/1d/c64a1d3ec620f0550c9211e83bbb0512.jpg">
<br>
<br>
 <Script src="/js/jquery-3.3.1.min.js"></script>
 <Script src="/js/bootstrap.min.js"></script>
 
<p class="s2">welcome to hs_project!!</p>

<div style="width: 60%; height:150px; float: right;">
	<center>
	
 	<br><br><br><br><br>
    <d class="s3">We Create Value</d><br><br><br><br>
	<d class="s3">With You...</d><br><br><br><br>
	<d class="s3">Now is the time.</d><br><br><br><br>
	<c class="s4">Communicate and share with each other</c><br><br><br><br>
	
	</center>
</div>

<div style="width: 30%; height:150px; float: left;">

<%@ include file="include/login.jsp"%>

</div>

 	


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


<br>
<br>


</html>