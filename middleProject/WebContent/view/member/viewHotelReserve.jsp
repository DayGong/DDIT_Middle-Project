<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();

	// 세션에 저장한 데이터 가져오기
	MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
	
	String mem_id = null;
	
	if ( memVo == null ) {
		mem_id = null;
	} else {
		mem_id = memVo.getMem_id();
	}

%>
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= path %>/js/viewHotelReserve.js"></script>

<!-- 예쁜 Alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
$(function() {
	
	// 숙소 예약 테이블 폼
	memberHotelReserveForm();
	
	// 숙소 예약 List를 테이블 <tbody>에 넣기
	addMemberHotelReserve('<%= mem_id %>');
	
	
	// 숙소 예약 취소 테이블 폼
	memberHotelReserveCancelForm();
		
	// 숙소 예약 취소 List를 테이블 <tbody>에 넣기
	addMemberHotelReserveCancel('<%= mem_id %>');

})
</script>

</head>
<body>
<!-- 숙소 예약 목록 띄울 div-->
<div id="memberHotelReserveList"></div>

<!-- 숙소 예약 취소 및 완료 목록을 띄울 div -->
<div id="memberHotelCancelList"></div>
</body>
</html>