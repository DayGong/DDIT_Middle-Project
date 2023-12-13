<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지가 찾아드릴게유</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/member/fogotPass.do" method="post">
	가입시 입력한 아이디를 입력해주세요<br><br>
	<input type="text" name="memId" placeholder="아이디" style="width:200px; height:20px;">
	<input type="submit" value="확인">
	</form>
	

</body>
</html>