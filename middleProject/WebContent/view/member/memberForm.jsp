<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memberForm.css">
<%
   // 세션에 저장한 데이터 가져오기
   MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
%>
<script>
<%
	if(memVo == null){
%>
	alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
	window.location.href = '<%=request.getContextPath()%>/view/login_out/loginMain.jsp';
<%
	}
%>
</script>
</head>
<body>


<!-- 상단 메뉴바 -->
<jsp:include page="/view/main/top.jsp"/>
<div class= "alltop" style="margin-top: 130px;">
	<div class="row">
	<div>
  		<h2>마이페이지</h2>
		<div class="category-container"> 
			<div class="category-item"><a href="#" onclick = "changeIframe('<%=request.getContextPath()%>/view/member/memberinfo.jsp','내정보')">내정보</a></div>
	      	<div class="category-item"><a href="#" onclick = "changeIframe('<%=request.getContextPath()%>/test.jsp','예약조회')">예약조회 </a></div>
	      	<div class="category-item"><a href="#" onclick = "changeIframe('<%=request.getContextPath()%>/test.jsp','내 캘린더')">내 캘린더</a></div>
    	</div>
   	</div>
  
  	<div class="maincolumn">
  		<h2 id ="categoryTitle"> 원하시는 항목을 선택하세요</h2>
    	<div class="card">
      	<iframe id ="myIframe" name ="itr"></iframe>
     	<p>열심히 해볼게요 화이팅!</p>
      	</div>
    </div>
   </div>
 </div> 

</body>
<script>
	function changeIframe(url, title) {
		document.getElementById('myIframe').src = url;
		document.getElementById('categoryTitle').innerText = title;
	}
</script>
</html>


