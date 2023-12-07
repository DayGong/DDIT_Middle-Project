<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대전 관광 홈페이지</title>

<% 
	String path = request.getContextPath();	// 상위 경로를 변수로 선언
%>

<!-- 메인 이미지 슬라이드 css -->
<link rel="stylesheet" href="<%= path %>/css/banner.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 다음 script를 주석과 함께 추가해주시면 됩니당(추가할 때 이거 지워주세요) -->

</head>
<body>

<!-- 메인 이미지 슬라이드 css 시작 -->
<div class="carousel-container">
	<div class="fix-text"><!-- 이미지 위에 올라가는 고정 텍스트  -->
		<h3>DAEJEON<br>TRIP ROAD</h3>
		<p>우리 지금, 대전가유~!<br> 돌도 굴러가유~~!</p>
	</div>

	<!-- Carousel(주석 수정 부탁드립니당) -->
	<div id="banner" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots(주석 수정 부탁드립니당) -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#banner" data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="2"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="3"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="4"></button>
		</div>
		
		<!-- The slideshow/carousel(주석 수정 부탁드립니당) -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%= path %>/images/banner/특별상-윤환-대동하늘공원의-.jpg" 
					alt="대동하늘공원" class="d-block" style="width:100%">
    		</div>
    
			<div class="carousel-item">
				<img src="<%= path %>/images/banner/5-가작-김미영-한밭수목원의.jpg" 
					alt="한밭수목원" class="d-block" style="width:100%">
			</div>
    
			<div class="carousel-item">
				<img src="<%= path %>/images/banner/5-가작-이영춘-반영-1.jpg" 
					alt="한밭수목원" class="d-block" style="width:100%">
			</div>
    
			<div class="carousel-item">
				<img src="<%= path %>/images/banner/2-은상-성순용-역사탐방.jpg" 
					alt="역사탐방" class="d-block" style="width:100%">
			</div>
    
			<div class="carousel-item">
				<img src="<%= path %>/images/banner/3-특별상-노희완-장태산에서.jpg" 
					alt="장태산" class="d-block" style="width:100%">
			</div>
		</div>
  
		<!-- Left and right controls/icons(주석 수정 부탁드립니당) -->
		<button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
</div><!-- 메인 이미지 슬라이드 css 끝 -->

</body>
</html>