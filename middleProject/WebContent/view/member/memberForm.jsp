<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memberForm.css">
</head>
<body>

<div class="header">
  <h1>My Page</h1>
  <p>임시화면 입니다 ~ </p>
</div>

<div class="topnav">
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="#" style="float:right">Link</a>
</div>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h2>로그인 정보</h2>
      <div class="fakeimg" style="height:100px;">Image</div>
      <p>로그인한 사람 정보 들어가면 아쥬 좋을거같아요</p>


      <a href="<%=request.getContextPath()%>/view/update/memberUpdateMain.jsp">회원수정</a>
      <a href="<%=request.getContextPath()%>/member/logoutMember.do">로그아웃</a>
      <a href="<%=request.getContextPath()%>/view/withdraw/memberWithdraw.jsp">탈퇴</a>
      
    </div>
    <div class="card">
      <h3>카테고리</h3>
      <div class="fakeimg"><p>내정보</p></div>
      <div class="fakeimg"><p>예약조회</p></div>
      <div class="fakeimg"><p>내 캘린더</p></div>
    </div>
    <div class="card">
      <h3>빈공간?</h3>

    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>여기에 머 들어가요? </h2>
      <h5>달력일까요?</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p></p>
      <p>열심히 해볼게요 화이팅!</p>
    </div>
     <div class="card">
      <h2>여기에 머 들어가요? </h2>
      <h5>일정 세부일까요?</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p></p>
      <p>열심히 해볼게요 화이팅!</p>
    </div>
  </div>
</div>

<div class="footer">
  <h2>우리는 대덕 워리어즈 ~~~(2023.09월 406호 2조)</h2>
</div>
</body>
</html>


