<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="../include/header.jsp"%>
<script>
	//상품을 갱신하는 함수
	//컨트롤러의 update.do로 맵핑된다.
	function product_update() {
		document.form1.action = "${path}/shop/product/update.do";
		document.form1.submit();
	}

	//상품을 삭제하는 함수
	//컨트롤러의 delete.do로 맵핑된다.
	function product_delete() {
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "${path}/shop/product/delete.do";
			document.form1.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/admin_menu.jsp"%>
	<h2>상품 정보 편집</h2>
	<form id="form1" name="form1" method="post"
		enctype="multipart/form-data">
		<!-- 파일 업로드를 하기위한 타입, 필수로 작성해야 한다.-->
		<table>
			<!-- 관리자로그인을 한 후에 들어갈 수 있는 상품정보 편집정보 -->
			<!-- 해당되는 자료들은 dto에서 가져와서 보여준다. -->
			<tr>
				<td>상품명</td>
				<td><input name="product_name" value="${dto.product_name}"></td>
			</tr>

			<tr>
				<td>가격</td>
				<td><input name="price" type="number" value="${dto.price }"></td>
			</tr>

			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="description"
						id="description">${dto.description }</textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>