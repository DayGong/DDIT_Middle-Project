<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
%>
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= path %>/js/viewHotelReserve.js"></script>

<!-- 예쁜 Alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<!-- 숙소 예약 목록 띄울 div-->
<div id="memberHotelReserveList"></div>

<!-- 숙소 예약 취소 및 완료 목록을 띄울 div -->
<div id="memberHotelCancelList"></div>
</body>
</html>