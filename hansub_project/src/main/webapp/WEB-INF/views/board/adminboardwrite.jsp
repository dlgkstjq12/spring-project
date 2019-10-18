<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%><br><br>
<script src = "${path}/ckeditor/ckeditor.js"></script>

<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">


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
  
  
<!-- ckeditor 사용을 위해 js파일을 연결함 -->
<body>
<!-- 글쓰기 폼 작성 -->
<h2>공지사항 작성</h2>
<form method = "post" action = "admin_board_insert.do">
<div class="input-group input-group-sm" role="group" style = "text-align:left">
<table class="table table-striped table-bordered">
<thead>
<tr>
<td><input name = "title" id = "title" size = "80" placeholder = "제목을 입력하세요" class="form-control" aria-describedby="basic-addon1"></td>
</tr>

<br><br>
<tr>
<div style = "width:800px;"> 
<td><textarea class="form-control" id = "content" name = "content" rows = "6" cols = "80" placeholder = "내용을 입력하세요">
</textarea></td>
</div>
</tr>

</thead>
</table>
</div>
</div>
<center>
<div class="btn-group btn-group-sm" role="group" aria-label="...">
<div style = "text-align:center;" >
<button type = "submit" name = "submit" class = "btn btn-default">확인</button></div></div>
</center>


<script>
//id가 description인 태그에 ckeditor을 적용시킴
//이미지 업로드 안됨
CKEDITOR.replace("content");
</script>


</form>
</body>
</html>