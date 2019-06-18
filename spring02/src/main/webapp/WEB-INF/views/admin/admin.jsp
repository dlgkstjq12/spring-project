<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<!-- 관리자로 로그인을 하게되면 관리자전용 메뉴가 떠야하기 때문에 admin_menu페이지로 변경한다. -->

<c:if test="${message == 'success' }"> <!-- controller에서 보낸 메시지의 값이 success면 c:if문이 실행이 된다.-->
<h2>
	${sessionScope.admin_name}
	(${sessionScope.admin_userid})님 환영합니다.
	<!--sessionScope는 세션에 담은 setAttribute()메소드 안에 있는 값을 jsp에서 JSTL로 간단히 사용하고 싶을때 사용하면 된다. -->
	<!--ex dlgkstjq12(이한섭)님 환영합니다. 와 같이 출력됨.  -->
	
</h2>
</c:if>
</body>
</html>