<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
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

<%
   // 세션에 저장한 데이터 가져오기
	MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
	AdminVO adVo = (AdminVO)session.getAttribute("loginAdmin");
%>

<!-- 메인 상단 메뉴바 js  -->
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= path %>/js/header.js"></script>

<!-- header css -->
<link rel= "stylesheet"  href="<%= path %>/css/header.css">

<!-- header scroll script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>
<body>
<!--  메인 상단 메뉴바(헤더) 시작   -->
<header class="nav-down">
	<div id ="leftHeader">
		<div class="blank"></div>

		<!--  로고 자리입니다   -->
		<div id="logo" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">
			<img src= "<%=path %>/images/header/로고3.png" alt="대전관광" style="width:200px;">
		</div>
		
		<div class="blank"></div>
	</div>

	<div id="rightHeader">
  
		<!--  메뉴들의 자리입니다   --> 
		<div id="menu">
			<ul>
				<li class="menu"><a class="menu_li" href="#">대전알리미</a>
					<ul>
						<li ><a class="menu_li" href="#">대전이야기</a></li>
						<li ><a class="menu_li" href="#">여행도우미</a></li>
					</ul>
				</li>
				<li class="menu"><a class="menu_li" href="<%=request.getContextPath()%>/tour/tourboard/tourMain.jsp">관광명소</a> 
					<ul>
						<li ><a class="menu_li" href="<%=request.getContextPath()%>/tour/tourboard/tourMain.jsp">주요 관광지</a></li>
						<li ><a class="menu_li" href="<%=request.getContextPath()%>/view/restaurant/resboard/resMain.jsp">식당</a></li>
						<li ><a class="menu_li" href="<%=request.getContextPath()%>/hotel/hotelboard/hotelMain.jsp">숙박업소</a></li>
					</ul>
				</li>
				<li class="menu"><a class="menu_li" href="<%=request.getContextPath()%>/cultureboard/cultureMain.jsp">문화의거리</a>
					<ul>
						<li ><a class="menu_li" href="#">공연</a></li>
						<li ><a class="menu_li" href="#">전시</a></li>
						<li ><a class="menu_li" href="#">축제</a></li>
					</ul>
				</li>
				<li class="menu"><a class="menu_li" href="<%=request.getContextPath()%>/view/notice/mainboard.jsp">게시판</a>
					<ul>
						<li ><a class="menu_li" href="#">공지게시판</a></li>
						<li ><a class="menu_li" href="#">후기게시판</a></li>
					</ul>
				</li>
				<!-- 관리자로 로그인시 관리자페이지로 이동합니다-->
				<%
					if(memVo==null && adVo!=null){
				%>
				<li class="menu"><a class="menu_li" href="<%=request.getContextPath()%>/view/admin/adminForm.jsp">관리자페이지</a>
				</li>
				<%
					}else{
				%>
				<li class="menu"><a class="menu_li" href="<%=request.getContextPath()%>/view/member/memberForm.jsp">마이페이지</a>
					<ul>
						<li ><a class="menu_li" href="#">내정보</a></li>
						<li ><a class="menu_li" href="#">예약조회</a></li>
						<li ><a class="menu_li" href="#">내 캘린더</a></li>
					</ul>
				</li>
				<%
					}
				%>
			</ul>
		</div> <!-- id가 munu인 div 끝 -->

 	  	<!--  링크들을 넣은 자리입니다   -->
		<div id="links">
			<a href="https://www.daejeon.go.kr/index.do" target="_blank" >
				<img src="<%=path %>/images/header/daejeon.jpg" alt="daejeon.jpg">
			</a>
			<a href="https://www.instagram.com/daejeontourism/" target="_blank" >
				<img src="<%=path %>/images/header/인스타그램_아이콘.png" alt="인스타그램_아이콘.png">
			</a>
			<a href="https://www.youtube.com/channel/UCzRPq736TUcnIIDdfapXXZw" target="_blank" >
				<img src="<%=path %>/images/header/11.png" alt="11.png">
			</a>
			<a href="https://blog.naver.com/daejeontour" target="_blank" >
				<img src="<%=path %>/images/header/블로그1.png" alt="블로그1.png">
			</a>
		</div> <!-- id가 link인 div 끝 -->
  
		<!--   로그인 폼입니다    -->
		<%
			if(memVo == null && adVo == null)
			{
		%>
		
		<div id="loginForm">
			<form class="login-form" action="#">
				<input type="button" value="로그인"  onclick="location.href='<%= request.getContextPath() %>/view/login_out/loginMain.jsp'">
				<input type="button" value="회원가입"  onclick="location.href='<%= request.getContextPath() %>/view/signup/memberSignup.jsp'">
			</form>
		</div>	<!-- id가 loginForm인 div 끝 -->
		<%
			}else
			{	
		%>
		<!-- 로그인 완료 폼 -->
		<div id ="loggedForm">
			<%
				if(adVo != null){
					
			%>
			<form class="logged-form" action="#">
				<h4><%= adVo.getAdmin_name()%>관리자님 반갑습니다!</h4>
				<input type="button" value="로그아웃"  onclick="location.href='<%=request.getContextPath()%>/member/logoutMember.do'"> 
				
			</form>
			<%
				}else if(memVo != null)
				{
			%>
			<form class="logged-form" action="#">
				<h4><%= memVo.getMem_name()%>님 반갑습니다!</h4>
				<input type="button" value="로그아웃"  onclick="location.href='<%=request.getContextPath()%>/member/logoutMember.do'"> 
			</form>
			<%
				}
			%>
		</div>
		<%
			}
		%>	
	</div>	<!-- id가 rightHeader인 div 끝 -->
	
</header>
<!--  메인 상단 메뉴바(헤더)의 끝  -->
</body>
</html>