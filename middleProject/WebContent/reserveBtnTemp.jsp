<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String path = request.getContextPath();
%>
<title>Insert title here</title>
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>

<!-- 예약 기능 script -->
<script src="<%= path %>/js/reserveHotel.js"></script>
<script src="<%= path %>/js/reserveRestaurant.js"></script>
<link rel="stylesheet" href="<%= path %>/css/reserve.css">

<!-- 관리자 예약 일괄 체크 아웃 script -->
<script src="<%= path %>/js/reserveManager.js"></script>

<!-- 예약 모달창 script -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 카카오페이API script -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- 예쁜 Alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

<button type="button" class="hotelModalBtn" id='1' onclick="moveToHotelDetail(this.id)">호텔 예약 버튼1</button>
<button type="button" class="hotelModalBtn" id='2' onclick="moveToHotelDetail(this.id)">호텔 예약 버튼2</button>

<button type="button" class="restaurantModalBtn" id='3' onclick="moveToRestaurantDetail(this.id)">식당 예약 버튼1</button>
<button type="button" class="restaurantModalBtn" id='4' onclick="moveToRestaurantDetail(this.id)">식당 예약 버튼2</button>

<!-- 숙소의 상세 정보를 출력하는 모달창 시작 -->
<div class="modal" id="hotelDetailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		
			<!-- 모달 헤더 -->
			<div class="modal-header" id="hotelModalHeader">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- 모달 몸통(내용 출력) -->
			<div class="modal-body" id="hotelModalBody">
				<div id="left-modal-body"></div> 	<!-- 상세 정보 폼 -->
				<div id="right-modal-body"></div> 	<!-- 예약 입력 폼 -->
			</div>

			<!-- 모달 하단(후기 출력) -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> <!-- 숙소의 상세 정보를 출력하는 모달창 끝 -->

<!-- 식당의 상세 정보를 출력하는 모달창 시작 -->
<div class="modal" id="restaurantDetailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		
			<!-- 모달 헤더 -->
			<div class="modal-header" id="restaurantModalHeader">
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- 모달 몸통(내용 출력) -->
			<div class="modal-body" id="restaurantModalBody">
				<div id="rest-left-modal-body"></div> 	<!-- 상세 정보 폼 -->
				<div id="rest-right-modal-body"></div> 	<!-- 예약 입력 폼 -->
			</div>

			<!-- 모달 하단(후기 출력) -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> <!-- 식당의 상세 정보를 출력하는 모달창 끝 -->

<!-- 관리자 일괄 체크 아웃 -->
<input type="button" id="doAllCheckout" value="일괄 체크 아웃" onclick="managerAllCheckout()">

<!-- 회원 페이지 입장 버튼 -->
<input type="button" id="loadMemberPage" value="회원 페이지 입장">

<!-- 숙소 예약 목록 띄울 div (숙소 예약 창에 띄움)-->
<div id="memberHotelReserveList"></div>

<!-- 숙소 예약 취소 및 완료 목록을 띄울 div -->
<div id="memberHotelCancelList"></div>

<!-- 식당 예약 목록 띄울 div (식당 예약 창에 띄움)-->
<div id="memberRestaurantReserveList"></div>

<!-- 식당 예약 취소 목록 띄울 div (식당 예약 창에 띄움)-->
<div id="memberRestaurantCancelReserveList"></div>

</body>
</html>