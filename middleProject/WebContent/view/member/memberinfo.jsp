<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memberInfo.css">
<% 
   // 세션에 저장한 데이터 가져오기
   MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="card">
      <h2>로그인 정보</h2>
      <div class="fakeimg" style="height:200px;">
     	<p>* 이름 : <%=memVo.getMem_name()%></p>  
     	<p>* ID : <%=memVo.getMem_id()%></p>  
     	<p>* 주소 : <%=memVo.getMem_addr()%></p>  
      </div>
      <br>
      <a href="<%=request.getContextPath()%>/member/updateMember.do">회원수정</a>
      <a href="<%=request.getContextPath()%>/member/logoutMember.do">로그아웃</a> 
      <a href="<%=request.getContextPath()%>/view/withdraw/memberWithdraw.jsp">탈퇴</a>
</div>
      
</body>
</html>