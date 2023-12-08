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

<!-- DB의 내용을 읽어 숙소의 List 출력 -->
<!-- <div id="hotelDiv" onclick="moveToHotelDetail()">
	<p>div 클릭 테스트</p>
</div> -->

<button type="button" id="hotelModalBtn">버튼</button>

<!-- 호텔의 상세 정보를 출력하는 모달창 시작 -->
<div class="modal" id="hotelDetailModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- 모달 헤더 -->
      <div class="modal-header" id="hotelModalHeader">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="hotelModalBody">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>