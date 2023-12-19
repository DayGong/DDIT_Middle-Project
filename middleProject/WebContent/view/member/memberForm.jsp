<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
<link rel= "stylesheet"  href="<%=request.getContextPath()%>/css/memberForm.css">
</head>
<body>
    <!-- 상단 메뉴바 -->
    <jsp:include page="/view/main/top.jsp"/>
   
   <div id="mypage"><h1 class="mypage">마이페이지</h1></div>
    <div class="container">
        <div id="left">
            <!-- 왼쪽에 오는 내정보 -->
            <div class="mem-info" style="width: 300px;">
                <div><h2>내정보</h2></div>
                <img src="<%=request.getContextPath()%>/images/login/꿈돌2.png" style="width: 170px; height: 170px;">
                <div class="user-details">
                    <!-- 회원 정보 내용 추가 -->
                </div>
            <div id="mem-info" style="display: flex; flex-direction: column;align-items: flex-start;">
                   <a href="<%=request.getContextPath()%>/member/updateMember.do">회원수정</a>
                   <a href="<%=request.getContextPath()%>/member/logoutMember.do">로그아웃</a>
                   <a href="<%=request.getContextPath()%>/view/withdraw/memberWithdraw.jsp">탈퇴</a>
            </div>            
            </div>
        </div>

        <div id="right">
            <!-- 상단에 오는 카테고리 -->
            <div class="category-container">
                <div class="category-item"><a href="#" onclick="changeIframe('<%=request.getContextPath()%>/test.jsp','식당예약')">식당예약 </a></div>
                <div class="category-item"><a href="#" onclick="changeIframe('<%=request.getContextPath()%>/test.jsp','숙소예약')">숙소예약</a></div>
            </div>

            <!-- 정보 표시되는 어쩌구 -->
            <div class="maincolumn">
                <h2 id="categoryTitle"> 원하시는 항목을 선택하세요</h2>
                <div class="card">
                    <!-- 내용 추가 -->
                </div>
            </div>
        </div>
    </div>

    <!-- 하단 메뉴바 삽입 -->
    <jsp:include page="/view/main/bottom.jsp"/>
</body>
</html>