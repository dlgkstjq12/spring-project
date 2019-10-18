<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/include/menu.jsp -->
<%@ include file="header.jsp"%>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js%22"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel = "stylesheet" href = "/css/bootstrap.css">


</head>

<style>

.menubar li ul {
background: rgb(109,109,109);
background-color: #222;
display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}


.dropbtn{
  background-color: #222;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropbtn b{
  background-color: red;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 150px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content b {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 800px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}


</style>


<center>
	<body>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${path}/home">Hs-Project</a>
				</div>

				<div>
					<!-- 다른 기능들 링크가 걸려있는 메뉴 페이지 -->
					<ul class="nav navbar-nav">
				
					

				<div class="dropdown">
				<button class="dropbtn">게시판</button>
					<div class="dropdown-content">
						
						<a href="${path}/board/list.do">회원 게시물</a>
						
						<a href="${path}/board/best_list.do">베스트 게시물</a>
						
					</div>
				</div>
	
					<!-- 어떠한 아이디로든 로그인되지 않았을 경우에만 회원가입 링크를 출력시킨다. -->
					<c:if
						test="${sessionScope.user_id == null and sessionScope.navername == null and sessionScope.kakaonickname == null and sessionScope.facebookname == null and sessionScope.admin_id == null}">
						<div class="dropdown">
						<button class="dropbtn">회원</button>
						<div class="dropdown-content">
						<a href="${path}/member/email.do">회원가입</a>
					</div>
				</div>
					</c:if>



					<!-- 관리자가 로그인 하지 않았을 경우에만 로그인 링크를 출력시킴 -->
					<c:if
						test="${sessionScope.user_id == null and sessionScope.navername == null and sessionScope.kakaonickname == null and sessionScope.facebookname == null and sessionScope.admin_id == null}">
						
						<div class="dropdown">
						<button class="dropbtn">로그인</button>
						<div class="dropdown-content">
						<a href="${path}/admin/admin_login_view.do">관리자 로그인</a>
						</div>
						</div>
					</c:if>
					
					
						<div class="dropdown">
						<button class="dropbtn">기타 기능</button>
						<div class="dropdown-content">
						<a href="${path}/member/smsform.do">문자 보내기</a>
						<a href="${path}/member/e_mailform.do">이메일 보내기</a>
						</div>
						</div>


						<div class="dropdown">
						<button class="dropbtn">필독!!</button>
						<div class="dropdown-content">
					<a href="${path}/board/admin_board_list.do">회원 공지사항</a>
						</div>
						</div>


					<c:if test="${sessionScope.admin_id != null}">

						<div class="dropdown">
						<button class="dropbtn">관리자 메뉴</button>
							<div class="dropdown-content">
								<a href="${path}/admin/admin_member_forced_eviction_view.do">회원강제 탈퇴</a>
								<a href="${path}/admin/admin_member_info.do">회원 정보</a>
						</div>
					</div>
					
						
					
					
						
					
					
					</c:if>
					
					</ul>
					
					<div class="dropdown">
						<button class="dropbtn b">만든이</button>
							<div class="dropdown-content b">
							<br><br>
							<span style="color: green; font-weight: bold;">- 홈페이지 작성자 -</span>	<br><br>
							이한섭 <br><br>
							
							<span style="color: green; font-weight: bold;">- 이메일 주소 -</span><br><br>
							dlgkstjq623@naver.com <br><br>
							
							<span style="color: green; font-weight: bold;">- 휴대폰 번호 -</span><br><br>
							010-7285-1455 <br><br>
							
						</div>
					</div>
					
					
				</div>
			</div>
			
			
		</nav>

	</body>
	
</center>

</html>