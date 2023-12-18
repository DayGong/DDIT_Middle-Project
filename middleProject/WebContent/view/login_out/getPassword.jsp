<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지가 찾아드릴게유</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<%	// 서블릿에서 저장 데이터를 꺼내기
	String result = (String)request.getAttribute("memMail");
%>
<body>
<!-- 저장된 메일주소 데이터가 없으면 -->
<%
if(result == null)
{
%>
	<!-- 아이디로 메일주소를 받아서 비번찾기 -->
	<form action="<%=request.getContextPath()%>/member/fogotPass.do" method="post">
	가입시 입력한 아이디를 입력해주세요<br><br>
	<input type="text" name="memId" placeholder="아이디" style="width:200px; height:20px;">
	<input type="submit" value="확인">
	</form>
<%
// 저장된 메일주소 데이터가 있으면
}else
{
%>
	<script>
    swal({title: "임시번호 발급 성공!", text: "임시비밀번호가 메일로 발송되었습니다.", icon: "success"
    }).then(function() 
    {
    window.location.href = "<%=request.getContextPath()%>/view/login_out/loginMain.jsp"; 
    });
    </script>
<%
} 
%>
	

</body>
</html>