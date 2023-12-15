<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/signup.css">
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/jquery.serializejson.min.js"></script>
 
<script>
$(() =>{
	// id값 형식체크
	$('#id').on('keyup', function()
	{
		idvalue = $(this).val().trim();		// id입력시 빈공간 제거
		idreg= /^[a-zA-Z0-9]{5,14}$/;		// id정규식 : 영문 숫자 조합으로 6~15글자
		
		if(!(idreg.test(idvalue)))
		{
			// ID값이 정규식과 일치하지 않을 경우
			$('#spanid').html("다시 입력해주세요").css('color','red');
			$('#checkid').prop('disabled', true);		// checkid 비활성화
		}
		else
		{
			$('#spanid').html("");
			$('#checkid').prop('disabled', false);		// checkid 비활성화
		}
	});
	
	$('#checkid').on('click', ()=>{
		idvalue = $('#id').val().trim();
		
		// 입력 필드 비어있거나 공백인 경우 확인
		if(idvalue.length<1)
		{
			alert("ID를 입력하세요!");
			return false;
		}
		
		// 서버로 전송하기
		$.ajax({
		    url: '<%=request.getContextPath()%>/member/checkIdMember.do',
		    data: {"id": idvalue},
		    type: 'get',
		    dataType: 'json',
		    error: function(xhr) {
		        alert("에러상태 : " + xhr.status);
		    },
		    success: function(res) {
		        $('#spanid').html(res.sw).css('color', 'red');
		    }
		});
	});
});

</script>
</head>
<body>
    <div class="container">
        <form id="joinform">
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
            <div class="id-check" style="display: inline-block;">
            </div>
            <div class="form-group">
                <label for="pwd">* 비밀번호</label> 
                <input type="password" class="form-control" id="pass" name="mem_pass">
            </div>
            <div class="form-group">
                <label for="pwd">* 비밀번호확인</label> 
                <input type="password" class="form-control" id="checkpass" name="mem_pass">
            </div>
            <div class="form-group">
                <label for="name">* 이름</label>
                <input type="text" class="form-control" id="name" name="mem_name">
                <span id="spanname"></span>
            </div>
            <div class="form-group">
                <label for="hp">* 휴대폰번호</label> 
                <input type="text" class="form-control" id="hp" name="mem_hp">
            </div>
 
          <div class="form-group">
             <label for="mail">* 이메일</label>
             <div class="email-input-group">
                 <input type="text" class="form-control" id="mail" name="mem_mail">
                 <span id="at">@</span>
                 <select id="mailDomain">
                     <option value="1">== 선택하세요 ==</option>
                     <option value="naver.com">naver.com</option>
                     <option value="daum.net">daum.net</option>
                     <option value="gmail.com">gmail.com</option>
                     <option value="kakao.com">kakao.com</option>
                     <option value="nate.com">nate.com</option>
                     <option value="2">직접입력</option>
                 </select>
             </div>
         </div>      

         <div class="form-group" style="display: inline-block;">
                <label for="zip">* 우편번호</label>
                <input type="text" class="form-control" id="zip" name="mem_zip">
            </div>
            <div style="display: inline-block;">
                <input type="button" id="zipbtn" value="번호검색"  class="btn btn-primary" style="width: 90px;">
            </div>
            <div class="form-group">
                <label for="add1">* 주소</label> 
                <input type="text" class="form-control" id="add1" name="mem_add1">
            </div>
            <div class="form-group">
                <label for="add2">* 상세주소</label> 
                <input type="text" class="form-control" id="add2" name="mem_add2">
            </div>
            <br>
            <button type="button" id="joinbtn" class="btn btn-primary">가입하기</button>
            <span id="join"></span> 
        </form>
    </div>
</body>
</html>