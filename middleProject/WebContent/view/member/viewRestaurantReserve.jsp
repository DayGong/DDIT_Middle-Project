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
<script src="<%= path %>/js/viewRestaurantReserve.js"></script>

<!-- 예쁜 Alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
$(function() 
{
	
	// 식당 날짜가 지나면 예약이 지난 것으로 되는 것
	changeDateReserveState();
		
	// 식당 예약 테이블 폼
	memberRestaurantReserveForm();
		
	// 식당 예약 List를 테이블 <tbody>에 넣기
	addMemberRestaurantReserve('<%= mem_id %>');
		
	// 식당 예약 취소 테이블 폼
	memberRestaurantReserveCancelForm();
		
	// 식당 예약 취소 List를 테이블 <tbody>에 넣기
	addMemberRestaurantReserveCancel('<%= mem_id %>');
	
})
</script>

</head>
<body>
<!-- 식당 예약 목록 띄울 div (식당 예약 창에 띄움)-->
<div id="memberRestaurantReserveList"></div>

<hr>

<!-- 식당 예약 취소 목록 띄울 div (식당 예약 창에 띄움)-->
<div id="memberRestaurantCancelReserveList"></div>
</body>
</html>