<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<% 
	String path = request.getContextPath();	// 상위 경로를 변수로 선언
%>

<!-- 메인 상단 메뉴바 js  -->
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= path %>/js/header.js"></script>

</head>
<body>
<!--  메인 상단 메뉴바(헤더) 시작   -->
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
			<li class="menu"><a href="#">관광명소</a>
				<ul>
					<li ><a href="#">주요 관광지</a></li>
					<li ><a href="#">식당</a></li>
					<li ><a href="#">식박업소</a></li>
				</ul>
			</li>
			<li class="menu"><a  href="#">문화의거리</a>
				<ul>
					<li ><a href="#">공연</a></li>
					<li ><a href="#">전시</a></li>
					<li ><a href="#">축제</a></li>
				</ul>
			</li>
			<li class="menu"><a href="#">게시판</a>
				<ul>
					<li ><a href="#">공지게시판</a></li>
					<li ><a href="#">후기게시판</a></li>
				</ul>
			</li>
			<li class="menu"><a  href="#">마이페이지</a>
				<ul>
					<li ><a href="#">내정보</a></li>
					<li ><a href="#">예약조회</a></li>
					<li ><a href="#">내 캘린더</a></li>
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
<!--  메인 상단 메뉴바(헤더)의 끝  -->
</body>
</html>