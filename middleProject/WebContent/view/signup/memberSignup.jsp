<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/signup.css">
    
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/signup.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div class="container">
		<form id="joinform" method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/member/signupMember.do">
			<div class="header">
				<div>회원 가입을 위해</div>
                <div>정보를 입력해주세요.</div><br>
            </div>
            
            <div class="form-group">
                <label for="id">* 아이디</label>
                <table>
					<tr>
		            <td>
		                <input type="text" class="form-control" id="id" name="mem_id">
		            </td>
					<td>
		                <input type="button" id="checkid" value="중복검사" class="btn btn-primary">
					</td>
					</tr>
                </table>
		        <span id="spanid"></span>
            </div>
            
            <div class="form-group">
                <label for="pwd">* 비밀번호</label> 
                <input type="password" class="form-control" id="pass1" name="mem_pass">
            </div>
            
            <div class="form-group">
                <label for="pwd">* 비밀번호확인</label> 
                <input type="password" class="form-control" id="pass2">
            	<span id="spanpass"></span>
            </div>
            
            <div class="form-group">
                <label for="name">* 이름</label>
                <input type="text" class="form-control" id="name" name="mem_name">
                <span id="spanname"></span>
            </div>
            
            <div class="form-group">
                <label for="tel">* 휴대폰번호</label> 
                <input type="text" class="form-control" id="tel" name="mem_tel">
                <span id="spantel"></span>
            </div>
 
          <div class="form-group">
             <label for="mail">* 이메일</label>
             <div class="email-input-group">
                 <input type="text" class="form-control" id="mail" name="mem_mail">
                 <span id="at">@</span>
                 <input type="text" class="form-control" id="domain-text" >
                 <select class="box" id="domain-list" name="domain">
					<option value="type">직접입력</option>
					<option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="kakao.com">kakao.com</option>
                    <option value="nate.com">nate.com</option>
                 </select>
             </div>
         </div>      

        <div class="form-group" style="display: inline-block;">
         	<label for="zip">* 우편번호</label>
            <input type="text" id="postcode" class="d_form mini" placeholder="우편번호">
		</div>
            <div style="display: inline-block;">
			<input type="button" onclick="prod1()" value="우편번호 찾기" class="d_btn"><br><br>
		</div>
        
        <div class="form-group">
			<label for="add1">* 주소</label> 
			<input type="text" id="roadAddress" class="d_form std" placeholder="도로명주소" name="roadAddress"><br><br>
			<input type="text" id="extraAddress" class="d_form" placeholder="참고항목" name="extraAddress"><br><br>
		</div>
		
		<div class="form-group">
			<label for="add2">* 상세주소</label> 
            <input type="text" id="detailAddress" class="d_form" placeholder="상세주소" name="detailAddress"><br><br>
		</div>
            <br>
		<button type="button" id="joinbtn" class="btn btn-primary">가입하기</button>
        <span id="join"></span> 
		</form>
    </div>
    
</body>
</html>