<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memberInfo.css">
<%
   // 세션에 저장한 데이터 가져오기
   MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
%>
</head>
<body>
<div id ="container">
<h1>내 정보</h1>
	<div id="mapper" >
		<p> 이름    : <%=memVo.getMem_name()%></p>  
		<p> 아이디 : <%=memVo.getMem_id()%></p>
		<p> 주소    : <%=memVo.getMem_addr()%></p>
		<p> 이메일 : <%=memVo.getMem_mail()%></p>
	</div>
	<span><img src="<%=request.getContextPath()%>/images/login/스판그림.png"></span>
</div>
</body>
</html>