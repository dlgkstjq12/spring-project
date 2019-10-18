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
<%@ include file="../include/menu.jsp"%>

<body>

<%@ include file="../include/login.jsp"%><br><br>
	


<!-- 문자보내는 폼 -->
<form method="post" id="smsForm">

<center>

<table border="1" width="300px" class = "table-hover">

<div class="card align-middle" style="width:30rem; border-radius:20px;">
		
<div class="card-body">

<center>

<span style="color: green; font-weight: bold;">SMS 전송 (문자보내기)</span><br><br>
 
    
      <span style="color: black; font-weight: bold;">받는 사람</span><br><br>
      
      <input type="text" name="from" placeholder=" 전화번호 입력 ( '-' 포함 )" class="form-control"/> <br><br>
      
      <span style="color: black; font-weight: bold;">내용</span><br><br>
      
      <textarea name="text" placeholder=" 보낼 내용 입력 " class="form-control"></textarea> <br><br>
     
      <input type="button" onclick="sendSMS('sendSms')" value="전송하기" class="form-control btn btn-primary" /><br>
      </center>
    </form>
    </div>
    </div>
    </table>
  
</center>


  <script>
    function sendSMS(pageName){

    	console.log("문자를 전송합니다.");
    	$("#smsForm").attr("action", pageName + ".do"); //위에 있는 폼태그를 컨트롤러로 전송한다.
    	$("#smsForm").submit();
    }
  </script>


</body>
</html>