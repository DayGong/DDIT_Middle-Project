<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 페이지</title>
</head>
<body>
	<div class="form-group">
	    <label for="all">* 전체수정</label> 
	    <input type="button" class="form-update" id="all" value ="수정" onClick="location.href='<%=request.getContextPath()%>/view/update/memberUpdateAll.jsp'">
	</div>
	<div class="form-group">
	    <label for="name">* 이름</label> 
	    <input type="button" class="form-update" id="name" value ="수정">
	</div>

	<div class="form-group">
	    <label for="pass">* 비밀번호</label> 
	    <input type="button" class="form-update" id="pass" value ="수정">
	</div>

	<div class="form-group">
	    <label for="mail">* 이메일</label> 
	    <input type="button" class="form-update" id="mail" value ="수정">
	</div>

	<div class="form-group">
	    <label for="tel">* 휴대폰 번호</label> 
	    <input type="button" class="form-update" id="tel" value ="수정">
	</div>

	<div class="form-group">
	    <label for="addr">* 주소</label> 
	    <input type="button" class="form-update" id="addr" value ="수정">
	</div>



</body>
</html>