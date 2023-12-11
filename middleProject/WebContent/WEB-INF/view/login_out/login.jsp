<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginMain</title>
</head>
<body>
<h1>Login</h1>
	<form id="LoginForm" method="post" action="<%=request.getContextPath()%>/member/loginMember.do">
	
			아이디 <input type="text" id="id" placeholder="아이디"><br><br>
			비밀번호<input type="text" id="pass" placeholder="비밀번호"><br><br>
		 	<a href="<%=request.getContextPath()%>/forgetPass" class="login_forgot">비밀번호를 잊으셨나요? </a><br><br>
         	<input type="submit" value="로그인"><br><br>
			<a href="<%=request.getContextPath()%>/member/memberSignup.jsp">회원가입</a>
	</form>
</body> 
</html>