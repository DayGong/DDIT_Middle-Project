<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/passEye.css">
</head>
<script type="text/javascript">
$(function(){
    // 눈표시 클릭 시 패스워드 보이기 다시클릭하면 가려지기
    $('.eyes').on('click', function(){
        $('.input.password').toggleClass('active');

        if($('.input.password').hasClass('active')){
            $(this).find('.fa-eye').attr('class', 'fa fa-eye-slash fa-lg');
            $('.input.password #password').attr('type', 'text');
        } else {
            $(this).find('.fa-eye-slash').attr('class', 'fa fa-eye fa-lg');
            $('.input.password #password').attr('type', 'password');
        }
    });
});
</script>

<%
    // 세션에 저장한 데이터 가져오기
    MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
    //로그인 실패때는 null값이 나온다 -> null일때 아래 body의 내용이 나오게하기
%>

<body>
<!-- 로그인 폼  -->
<%
    if(memVo == null){
%>
	<form action="<%=request.getContextPath()%>/member/loginMember.do" method="post">
        	아이디 <input type="text" name="memId" placeholder="아이디"><br><br>
        
	        <div class="input password">
	            비밀번호 <input type="password" id="password" class="form-input" name="pass" placeholder="비밀번호">
	            <div class="eyes">
	                <i class="fa fa-eye fa-lg"></i>
	            </div>
	        </div>
	        <br><br>
         	<input type="submit" value="로그인"><br><br>
         	
         	<!-- 카카오 로그인 -->
         	<a id="kakao-login-btn"></a>
			<div id="result"></div>
			
			<!--아이디,비밀번호 찾기 / 회원가입  -->
		 	<a href="<%=request.getContextPath()%>/view/login_out/getId.jsp">아이디 까먹었슈? </a><br><br>
		 	<a href="<%=request.getContextPath()%>/forgetPass" class="login_forgot">비밀번호 까먹었슈? </a><br><br>
			<a href="<%=request.getContextPath()%>/view/signup/memberSignup.jsp">회원가입</a>
	</form> 
	
	<!-- 카카오 로그인 스크립트 -->
	<script type="text/javascript">
	  function unlinkApp() {
	    Kakao.API.request({
	      url: '/v1/user/unlink',
	      success: function(res) {
	        alert('success: ' + JSON.stringify(res))
	      },
	      fail: function(err) {
	        alert('fail: ' + JSON.stringify(err))
	      },
	    })
	  }
	</script>

	<script type="text/javascript">
	Kakao.init('e849d9640ad67395b31b38844f71b8eb'); //JavaScript 키입력
	console.log(Kakao.isInitialized());
	
	  Kakao.Auth.createLoginButton({
	    container: '#kakao-login-btn',
	    success: function(authObj) {
	      Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(result) {
	          $('#result').append(result);
	          id = result.id
	          connected_at = result.connected_at
	          kakao_account = result.kakao_account
	          $('#result').append(kakao_account);
	          resultdiv="<h2>로그인 성공 !!"
	          resultdiv += '<h4>id: '+id+'<h4>'
	          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
	          name = "";
	          birthday = "";
	          email ="";
	          birthyear = "";
	          phone_number = "";
	          address ="";
	/*           nickname = ""; */
	          if(typeof kakao_account != 'undefined'){ //받을 데이터 추가 및 삭제
	        	  email = kakao_account.email;
	        	  name = kakao_account.name;
	        	  birthyear = kakao_account.birthyear;
	        	  birthday = kakao_account.birthday;
	        	  phone_number = kakao_account.phone_number;
	        	  nickname = kakao_account.profile_nickname;
	        	  address = kakao_account.shipping_address;
	          }
	          
	          resultdiv += '<h4>이름(name): '+name+'<h4>'
	/*           resultdiv += '<h4>닉네임(nickname): '+nickname+'<h4>' */
	          resultdiv += '<h4>출생연도(birthyear): '+birthyear+'<h4>'
	          resultdiv += '<h4>생일(birthday): '+birthday+'<h4>'
	          resultdiv += '<h4>이메일(email): '+email+'<h4>'
	          resultdiv += '<h4>전화번호(phone_number): '+phone_number+'<h4>'
	          resultdiv += '<h4>주소(address): '+address+'<h4>'
	
	          $('#result').append(resultdiv);
	          
	       },
	        fail: function(error) {
	          alert(
	            'login success, but failed to request user information: ' +
	              JSON.stringify(error)
	          )
	        },
	      })
	    },
	    fail: function(err) {
	      alert('failed to login: ' + JSON.stringify(err))
	    },
	  })
	</script>
	
<!-- 로그인 성공시 -->
<%
	}else{
%>
	<h3><%=memVo.getMem_name()%>님 어서오슈~</h3><br>

	<a href="<%=request.getContextPath()%>/member/logoutMember.do">로그아웃</a>
	<a href="<%=request.getContextPath()%>/view/member/memberForm.jsp">마이페이지</a>
	
<%
	} 
%>

</body>
</html>