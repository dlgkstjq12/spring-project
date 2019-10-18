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
	

<center>

<table border="1" width="500px" class = "table-hover">

<div class="card align-middle" style="width:70rem; border-radius:20px;">
		
<div class="card-body">

<center>

<!-- 이메일 보내기 폼 -->
<form action ="e_mailForm.do" method = "post">

   
<center>

<span style="color: green; font-weight: bold;">이메일 보내기</span> <br><br>

<span style="color: black; font-weight: bold;">보내는 사람</span><br><br>
<div style="width: 47%; height:50px; float: left;">

<input type="text" name="sender_front" placeholder="이메일 아이디 입력" class="form-control">
</div>  
 
 
 <div style="width: 47%; height:50px; float: right;">     
      <select type = "text" name = "sender_back" class = "form-control" >
      		
      			<option value = "@naver.com">@naver.com</option>				
      			<option value = "@hanmail.net">@hanmail.net</option>
      			<option value = "@gmail.com">@gmail.com</option>
      
      </select>
       </div>
    
 <br><br><br>
 
 
 <span style="color: black; font-weight: bold;">받는 사람</span><br><br>
 <div style="width: 47%; height:50px; float: left;">
 
 <input type="text" name = "recipient_front" placeholder="이메일 아이디 입력" class="form-control">
 </div>
 
 <div style="width: 47%; height:50px; float: right;">
      <select name="recipient_back" type="text"class = "form-control" >
      
      			<option value = "@naver.com">@naver.com</option>				
      			<option value = "@hanmail.net">@hanmail.net</option>
      			<option value = "@gmail.com">@gmail.com</option>
      			<option value = "@chol.com">@chol.com</option>				
      			<option value = "@empal.com">@empal.com</option>
      			<option value = "@freechal.com">@freechal.com</option>
      			<option value = "@hanmir.com">@hanmir.com</option>				
      			<option value = "@hitel.net">@hitel.net</option>
      			<option value = "@nete.com">@nate.com</option>
      			
			
      </select>
      </div>
     <br><br><br>
      
      
      <span style="color: black; font-weight: bold;">제목</span><br>
      
    
      <input type="text" name="title" placeholder=" 이메일의 제목 입력" class="form-control" /><br><br>
     
      
      
     <span style="color: black; font-weight: bold;">내용</span><br>
     
   
     <textarea name="text" name = "text" placeholder=" 보낼 내용 입력 " class="form-control" ></textarea> <br><br>
    
    
    
      <center>
      <button type = "submit" name = "submit" class="form-control btn btn-primary">이메일 전송</button><br>
      </div></div>
      </center>
    </form>
   </div>
   </div>
    </table>
 </center>
  

</body>
</html>