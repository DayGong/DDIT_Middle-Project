<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<%	// 세션에 저장한 데이터 가져오기
	MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
	//로그인 실패때는 null값이 나온다 -> null일때 아래 body의 내용이나오게하기
%>

<body>
<%
	if(memVo == null){
%>
	<form action="<%=request.getContextPath()%>/member/loginMember.do" method="post">
			아이디 <input type="text" name="memId" placeholder="아이디"><br><br>
			비밀번호 <input type="text" name="pass" placeholder="비밀번호"><br><br>
         	<input type="submit" value="로그인"><br><br>
		 	<a href="<%=request.getContextPath()%>/forgetPass" class="login_forgot">비밀번호 까먹었슈? </a><br><br>
			<a href="<%=request.getContextPath()%>/view/signup/memberSignup.jsp">회원가입</a>
	</form>
<%
	}else{
%>
	<h3><%=memVo.getMem_name()%>님 어서오슈~</h3><br>

	<a href="<%=request.getContextPath()%>/member/logoutMember.do">로그아웃</a>
<%
	} 
%>

</body>
</html>