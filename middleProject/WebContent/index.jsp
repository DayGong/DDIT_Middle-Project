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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="<%= path %>/css/banner.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<script src="<%=path %>/js/header.js"></script>
<link rel= "stylesheet"  href="<%=path %>/css/common.css"> <!-- 공통으로 사용할 js입니다 -->
<!-- jquery와 common.css, header.js추가   -->

<!-- 다음 script를 주석과 함께 추가해주시면 됩니당(추가할 때 이거 지워주세요) -->


</head>
<body>

<!--  헤더 시작   -->
<header>
	<div id ="leftHeader">
		<div class="blank"></div>

<!--  로고 자리입니다   -->
	<div id="logo">
		<img src= "<%=path %>/images/header/대전관광.png" alt="대전관광">
	</div>
		<div class="blank"></div>
	</div>

<div id="rightHeader">
  
  
 <!--  메뉴들의 자리입니다   --> 
<div id="menu">
	<ul>
		<li class="menu"><a href="#">MENU1</a>
			<ul>
				<li  ><a href="#">SUB_MENU</a></li>
				<li ><a href="#">SUB_MENU2</a></li>
				<li ><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li class="menu"><a  href="#">MENU2</a>
			<ul>
				<li ><a href="#">SUB_MENU</a></li>
				<li ><a href="#">SUB_MENU2</a></li>
				<li ><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li class="menu"><a href="#">MENU3</a>
			<ul>
				<li ><a href="#">SUB_MENU</a></li>
				<li ><a href="#">SUB_MENU2</a></li>
				<li ><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li class="menu"><a  href="#">MENU4</a>
			<ul>
				<li ><a href="#">SUB_MENU</a></li>
				<li ><a href="#">SUB_MENU2</a></li>
				<li ><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li class="menu"><a href="#">MENU5</a>
			<ul>
				<li ><a href="#">SUB_MENU</a></li>
				<li ><a href="#">SUB_MENU2</a></li>
				<li ><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
	</ul>
</div>

   <!--  링크들을 넣은 자리입니다   -->
	<div id="links">
		<a href="" target="_blank" >
			<img src="<%=path %>/images/header/daejeon.jpg" alt="daejeon.jpg">
		</a>
		<a href="" target="_blank" >
			<img src="<%=path %>/images/header/인스타그램_아이콘.png" alt="인스타그램_아이콘.png">
		</a>
		<a href="" target="_blank" >
			<img src="<%=path %>/images/header/11.png" alt="11.png">
		</a>
		<a href="" target="_blank" >
			<img src="<%=path %>/images/header/블로그1.png" alt="블로그1.png">
		</a>
	</div>
  
  <!--   로그인 폼입니다    -->
	<div id="loginForm">
		<form class="login-form" action="#">
 			 <input type="text" placeholder="아이디">
             <input type="password" placeholder="비밀번호">
             <input type="button" value="로그인">
             <input type="button" value="회원가입">
       </form>
  	</div>
</div>
</header>
<hr>
<!--  헤더의 끝입니다   -->




<!-- 메인 이미지 슬라이드 css 시작 -->
<div class="carousel-container">
	<div class="fix-text"><!-- 이미지 위에 올라가는 고정 텍스트  -->
		<h3>DAEJEON<br>TRIP ROAD</h3>
		<p>우리 지금, 대전가유~!<br> 돌도 굴러가유~~!</p>
	</div>

	<!-- 배너를 캐러셀Carousel -반응형슬라이드로 만들어줌- 설정. -->
	<div id="banner" class="carousel slide" data-bs-ride="carousel">

		<!-- 배너 중앙 아래 / 슬라이드가 지나갈때마다 같이 지나가는 버튼 생성-->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#banner" data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="2"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="3"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="4"></button>
		</div>
		
		<!-- 캐러셀(슬라이드) 이미지삽입 -->
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
  
		<!-- 캐러셀 왼쪽 오른쪽 슬라이드기능 버튼 생성 -->
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