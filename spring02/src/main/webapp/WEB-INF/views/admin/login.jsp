<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 관리자 로그인 페이지 -->
<%@ include file="../include/header.jsp"%>


<script>
//button을 클릭하면 아이디와 비밀번호를 처리해서 Controller에 있는 login_check로 맵핑시킨다.
//아이디와 비밀번호를 받아 처리하는 자바스크립트 구문
$(function(){
	$("#btnLogin").click(function(){       //밑에 있는 button태그로 쓴 id값이  이쪽으로 맵핑되서 넘어오고, click()메소드 안에 함수가 실행 
		var userid=$("#userid").val();     //밑에있는 input문으로 가져온 userid의 값을 val()메소드를 사용해 가져오고, 그 값을 userid 변수에 넣는다.
		var passwd=$("#passwd").val();     //밑에 있는 input문으로 가져온 passwd의 값을 val()메소드를 사용해 가져오고, 그 값을 passwd 변수에 넣는다.
		if(userid == ""){			       //userid에 아무것도 입력이 되지 않으면
			alert("아이디를 입력하세요.");       //경고창 출력
			$("#userid").focus();          //focus()메소드는 커서를 옮겨놓는 효과, 그러니까 아이디 입력창에 자동으로 커서가 옮겨져 있는다. 깜빡이게끔
			return;
		}
		
		if(passwd==""){					//마찬가지로 passwd가 아무것도 입력이 되지 않으면
			alert("비밀번호를 입력하세요.");   //경고창 출력
			$("#passwd").focus();        //focus()메소드는 커서를 옮겨놓는 효과, 그러니까 아이디 입력창에 자동으로 커서가 옮겨져 있는다. 깜빡이게끔
			return;
		}
		
		document.form1.action = "${path}/admin/login_check.do";  //밑에 form1 폼을 Controller의 login_check에 맵핑하도록 한다.
		document.form1.submit(); //자료를 선송
	});
});

</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>관리자 로그인</h2>
	<form name="form1" method="post">

		<table border="1" method="post">

			<tr>
				<td>아이디</td>
				<td><input id="userid" name="userid"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="passwd" name="passwd"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button> <c:if
						test="${param.message == 'nologin' }">
						<div style="color: red;">먼저 로그인하세요.</div>
					</c:if> 
					<!-- if문 test의 값이 참이면 실행. (로그인이 아예안되어 있으면 실행)--> 
					<!-- 로그인이 안되었다는 값이 넘어오면 빨간색으로 경고창 출력-->


					<c:if test="${message == 'error' }">
						<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if> 
					<!-- if문 test의 값이 참이면 실행. (아이디나 비밀번호중 하나가 일치하지 않으면)--> 
					<!-- 아이디나 비밀번호가 일치하지 않으면 빨간색으로 경고 메시지 출력-->

					<c:if test="${message == 'logout' }">
						<div style="color: red;">로그아웃되었습니다.</div>
					</c:if>
					<!-- if문 test의 값이 참이면 실행. 로그아웃 메시지가 출력되면....--> 
					<!-- 로그아웃이 되면 로그아웃되었습니다. 메시지를 출력함-->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>