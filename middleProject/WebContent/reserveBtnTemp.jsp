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
<script src="<%= path %>/js/reserve.js"></script>
<link rel="stylesheet" href="<%= path %>/css/reserve.css">

<!-- 모달창 script - 예약에서 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<button type="button" class="hotelModalBtn">버튼</button>

<!-- 호텔의 상세 정보를 출력하는 모달창 시작 -->
<div class="modal" id="hotelDetailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		
			<!-- 모달 헤더 -->
			<div class="modal-header" id="hotelModalHeader"></div>

			<!-- 모달 몸통(내용 출력) -->
			<div class="modal-body" id="hotelModalBody"></div>

			<!-- 모달 하단 Close버튼 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> <!-- 호텔의 상세 정보를 출력하는 모달창 끝 -->

</body>
</html>