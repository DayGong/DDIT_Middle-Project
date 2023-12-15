<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<%
	String path = request.getContextPath();
%>

<!-- 관리자 예약 일괄 체크 아웃 script -->
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= path %>/js/admin.js"></script>

<!-- 예쁜 Alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.marginTop {
	margin-top: 150px;
}
</style>

</head>
<body>

<!-- 상단 메뉴바 -->
<jsp:include page="/view/main/top.jsp"/>

<div class="marginTop">

	<h3>관리자 페이지 입니다 ~*^00^/</h3>

	<p>
		관리자 정보가 나오면 되겠습니다<br>
	</p>
	
</div>

<hr>

<!-- 관리자 일괄 체크 아웃 -->
	<input type="button" id="doAllCheckout" value="일괄 체크 아웃" onclick="managerAllCheckout()">

</body>
</html>