<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
<%@ include file="include/menu.jsp" %>

<c:if test="${sessionScope.userid != null }">
<h2>
	${sessionScope.name} (${sessionScope.userid})
	님의 방문을 환영합니다. 
</h2>
</c:if>
<h1>Hello world!</h1>
<P>The time on the server is ${serverTime}.</P>
<!-- 개발 디렉토리와 배포 디렉토리는 다르기 때문에 따로 만들어야 한다. -->
<!-- 배포 디렉토리 확인 -->
<%=application.getRealPath("/") %>
<!-- application은 서버에서 통용되는 모든 사용자들이 공유하는 변수-->
</body>
</html>