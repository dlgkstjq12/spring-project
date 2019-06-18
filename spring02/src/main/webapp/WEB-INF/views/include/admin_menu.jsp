<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용하기 위한 c태그 -->
<a href="${path}/shop/product/list.do">상품목록</a> | <!-- 상품목록에 들어가는 링크를 만듦 -->
<a href="${path}/shop/product/write.do">상품등록</a> | <!-- 상품등록에 들어가는 링크를 만듦 -->
<c:choose
>
	<c:when test="${sessionScope.admin_userid == null }">
		<a href="${path}/admin/login.do">관리자 로그인</a> <!-- 세션에 들어있는 관리자 id가 null값이면 로그인 페이지로 이동함 -->
	</c:when>
	<c:otherwise>
		${sessionScope.admin_name}님이 로그인중입니다.
		<a href="${path}/admin/logout.do">로그아웃</a> <!-- 로그인 중이면 로그아웃 페이지를 출력함) -->
	</c:otherwise>
</c:choose>  
<hr>