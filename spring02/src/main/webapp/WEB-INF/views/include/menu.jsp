<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="${path}">Home</a> | 
<a href="${path}/memo/list.do">한줄메모장</a> |
<a href="${path}/upload/uploadForm">업로드 테스트</a> |
<a href="${path}/shop/product/list.do">상품목록</a> |

<c:if test="${sessionScope.admin_userid == 'admin' }">
<!-- c:if는 test속성 내의 EL의 결과가 참이면 실행됩니다. else 구문은 없습니다. -->
<!-- 위의 코드는  관리자의 아이디가 admin이면 실행이 된다. -->
	<a href="${path}/shop/product/write.do">상품등록</a> |  
</c:if>  

<a href="${path}/shop/cart/list.do">장바구니</a> | 
<div style="text-align: right;">


<c:choose>
	<%--초이스태그는 조건에 따른 여러곳으로 분기가 가능하다. --%>
	<c:when test="${sessionScope.userid == null }">
	
	<!-- when은 test안의 값이 참일때 실행 -->
	<!-- userid 가 null일때 실행한다. 즉 아무것도 안들어있을때 -->
		<a href="${path}/member/login.do">로그인</a> | 
		<a href="${path}/admin/login.do">관리자 로그인</a>
	</c:when>
	
	<c:otherwise>
	<!-- otherwise는 초이스태그 안에 들어가면 default문 같은 역할을 하게 된다. -->
	<!-- 그러니까 위의 초이스태그 안에 구문이 실행이되면 기본으로 나오게 되는 코드가 아래에 있다고 생각하면 된다. -->
	<!-- 로그인 중입니다. 표시와 로그아웃표시는 로그인 중에만 출력이 되야하기 때문에 oterwiser구문을 사용한다. -->
		${sessionScope.name}님이 로그인중입니다.
		<a href="${path}/member/logout.do">로그아웃</a>
	</c:otherwise>
	
	
</c:choose>



</div>
<hr>