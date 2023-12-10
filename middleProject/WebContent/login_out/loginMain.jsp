<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
    if (session.getAttribute("memId") == null) {
%>
        <a href="<%=request.getContextPath()%>/login.jsp">로그인</a>
        <a href="<%=request.getContextPath()%>/member/memberSignup.jsp">회원가입</a>
<%
	}else{
		String memId = (String)session.getAttribute("memId");
		out.println(memId+"님 어서오슈~");
%>

		<a href="<%=request.getContextPath()%>/logOut.jsp">로그아웃</a>
<%
	}
%>

</body>
</html>