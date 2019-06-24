<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
</head>
<body>
<%@ include file = "../include/admin_menu.jsp" %>

<h2>${message}</h2> <!-- JFreeChartController에서  리턴된 메시지가 출력된다-->
					<!-- pdf가 만들어 졌는지, 안만들어졌는지.. -->

</body>
</html>