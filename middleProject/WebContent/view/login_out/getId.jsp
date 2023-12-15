<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%	// 서블릿에서 저장 데이터를 꺼내기
	String code = (String)request.getAttribute("code");
	String result = (String)request.getAttribute("id");
%>
<body>
<!-- 저장된 아이디 데이터가 없으면 -->
<%
if(result ==null)
{
%>
	<!-- 메일주소로 아이디 찾기 -->
	<form action="<%=request.getContextPath()%>/member/fogotId.do" method="post">
	가입시 입력한 메일주소를 입력해주세요<br><br>
	<input type="text" name="memMail" placeholder="메일주소" style="width:200px; height:20px;">
	<input type="submit" value="확인">
	</form>
	
<%
// 아이디 데이터가 있으면
}else
{
%>
	<!-- 아이디 알려주고 로그인하러가는 버튼 -->
	
	<h3>회원님의 아이디는 <%=request.getAttribute("id")%>입니다.</h3><br>

	<a href="<%=request.getContextPath()%>/view/login_out/loginMain.jsp">로그인하러가기</a>
<%
} 
%>
</body>
</html>