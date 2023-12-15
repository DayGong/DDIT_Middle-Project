<%@page import="kr.or.ddit.vo.AdminVO"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 예쁜 Alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
 iframe {
   width: 100%;
   height : 100%;
   border : none;
 }
 #check{
   color : red;
 }
</style>
</head>

<script type="text/javascript">
	//눈표시 클릭 시 패스워드 보이기 다시클릭하면 가려지기
    $(function()
    {
        $('.eyes').on('click', function()
        {
            // 비밀번호 입력란의 타입을 'text' 또는 'password'로 변경
            var passwordInput = $('.input.password #password');
            var currentType = passwordInput.attr('type');
            
            if (currentType === 'password') 
            {
                passwordInput.attr('type', 'text');
                $(this).find('.fa-eye-slash').attr('class', 'fa fa-eye fa-lg');
            } else 
            {
                passwordInput.attr('type', 'password');
                $(this).find('.fa-eye').attr('class', 'fa fa-eye-slash fa-lg');
            }
        });
    });
</script>


<body>
<!-- 로그인을 어떤탭에서 했는지 저장한것 -->
<%
    String Tab = (String) session.getAttribute("tab");
	//세션이 존재하고 로그인한 사용자가 아닌 경우 세션을 무효화
%>

<!-- 상단 메뉴바 -->
<jsp:include page="/view/main/top.jsp"/>

<!-- 회원, 관리자 탭 활성화 -->
<div class="container">
    <br>
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item <%=(Tab == null || "member".equals(Tab)) ? "active" : ""%>">
            <a class="nav-link <%=(Tab == null || "member".equals(Tab)) ? "active" : ""%>" data-toggle="tab" href="#member">회원</a>
        </li>
        <li class="nav-item <%="admin".equals(Tab) ? "active" : ""%>">
            <a class="nav-link <%="admin".equals(Tab) ? "active" : ""%>" data-toggle="tab" href="#admin">관리자</a>
        </li>
    </ul>
	
	<!-- 회원과 관리자 각각 서블릿에 저장된 데이터, 로그인오류정보 체크 -->
	<%
	
    // 세션에 저장한 데이터 가져오기
    MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
	AdminVO adVo = (AdminVO)session.getAttribute("loginAdmin");
    //로그인 실패 때는 null값이 나온다 -> null일때 아래 body의 내용이 나오게하기
     String check = (String)session.getAttribute("check");
    
	%>

	<!-- 회원 로그인 탭 -->
	<div class="tab-content">
      <div id="member" class="container tab-pane <%=(Tab == null || "member".equals(Tab)) ? "active" : ""%>"><br>
		<!-- 로그인 안했거나 로그인  id 비밀번호가 틀렸을때    -->
		<%
		    if(memVo == null)
		    {
		%>
			<form action="<%=request.getContextPath()%>/member/loginMember.do" method="post">
		        	아이디 <input type="text" name="memId" placeholder="아이디"><br><br>
		        
			        <div class="input password">
			            비밀번호 <input type="password" id="password" class="form-input" name="pass" placeholder="비밀번호">
			            <div class="eyes">
			                <i class="fa fa-eye-slash fa-lg"></i>
			            </div>
			        </div>
			      	 <!-- 로그인 오류 메시지 -->
			        <% if (check != null && check.equals("false")) { %>
			            <span id="check" style="color: red;">로그인 오류 또는 비회원입니다</span><br><br>
			        <% session.invalidate();} %>
			
			        <input type="submit" value="로그인"><br><br>
		         	
		         	<!-- 카카오 로그인 -->
		         	<a id="kakao-login-btn"></a>
					<div id="result"></div>
					
					<!--아이디,비밀번호 찾기 / 회원가입  --> 
				 	<a href="<%=request.getContextPath()%>/view/login_out/getId.jsp">아이디 까먹었슈? </a><br><br>
				 	<a href="<%=request.getContextPath()%>/view/login_out/getPassword.jsp" class="login_forgot">비밀번호 까먹었슈? </a><br><br>
					<a href="<%=request.getContextPath()%>/view/signup/memberSignup.jsp">회원가입</a>
			</form> 
			
			<!-- 카카오 로그인 스크립트 -->
			<script type="text/javascript">
			  function unlinkApp() 
			  {
			    Kakao.API.request
			    ({
			      url: '/v1/user/unlink',
			      success: function(res) 
			      {
					  alert('success: ' + JSON.stringify(res))
			      },
			      fail: function(err) 
			      {
			          alert('fail: ' + JSON.stringify(err))
			      },
			    })
			  }
			</script>
		
<script type="text/javascript">
    Kakao.init('e849d9640ad67395b31b38844f71b8eb'); // JavaScript 키 입력
    console.log(Kakao.isInitialized());

    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function (authObj) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (result) {
                    $('#result').append(result);
                    id = result.id;
                    connected_at = result.connected_at;
                    kakao_account = result.kakao_account;
                    $('#result').append(kakao_account);
                    resultdiv = "<h2>로그인 성공 !!";
                    resultdiv += '<h4>id: ' + id + '<h4>';
                    resultdiv += '<h4>connected_at: ' + connected_at + '<h4>';
                    name = "";
                    birthday = "";
                    email = "";
                    birthyear = "";
                    phone_number = "";
                    address = "";

                    if (typeof kakao_account != 'undefined') { // 받을 데이터 추가 및 삭제
                        email = kakao_account.email;
                        name = kakao_account.name;
                        birthyear = kakao_account.birthyear;
                        birthday = kakao_account.birthday;
                        phone_number = kakao_account.phone_number;
                        nickname = kakao_account.profile_nickname;
                        address = kakao_account.shipping_address;

                        // 폼 동적으로 생성
                        var form = $('<form action="<%=request.getContextPath()%>/member/loginKakao.do" method="post"></form>');
                        form.append('<input type="hidden" name="id" value="' + id + '">');
                        form.append('<input type="hidden" name="mail" value="' + email + '">');
                        form.append('<input type="hidden" name="name" value="' + name + '">');
                        form.append('<input type="hidden" name="tel" value="' + phone_number + '">');
                        $('body').append(form);

                        // 폼 제출
                        form.submit();
                    }
                },
                fail: function (error) {
                    alert('login success, but failed to request user information: ' + JSON.stringify(error));
                },
            });
        },
        fail: function (err) {
            alert('failed to login: ' + JSON.stringify(err));
        },
    });
</script> 
			
		<!-- 로그인 성공시 -->
		<%
			}else
			{
		%>
			<script>
			window.location.href = '<%=request.getContextPath()%>/index.jsp';
			</script>
		<%
			}  
		%>
			
    </div>
    <!-- 회원 로그인 탭  끝-->

	<!-- 관리자 로그인 탭 -->
    <div id="admin" class="container tab-pane <%="admin".equals(Tab) ? "active" : ""%>"><br>
    	<!-- 로그인 안했거나 로그인  id 비밀번호가 틀렸을때    -->
		<%
		    if(adVo == null)
		    {
		%>
		<form action="<%=request.getContextPath()%>/admin/adminLogin.do" method="post">
        	아이디 <input type="text" name="adminId" placeholder="아이디"><br><br>
        
	        <div class="input password">
	            비밀번호 <input type="password" id="password" class="form-input" name="adminPass" placeholder="비밀번호">
	            <div class="eyes">
	                <i class="fa fa-eye-slash fa-lg"></i>
	            </div>
	        </div>
	      	 <!-- 로그인 오류 메시지 -->
	        <% if (check != null && check.equals("false")) 
	        	{ %>
	            <span id="check" style="color: red;">로그인 오류 또는 비관리자입니다</span><br><br>
	        <% session.invalidate();} %>
	
	        <input type="submit" value="로그인"><br><br>
		</form>   
		<!-- 로그인 성공시 -->
			<%
				}else
				{
			%>
			<script>
				window.location.href = '<%=request.getContextPath()%>/index.jsp';
			</script>
			<%
				}  
			%>
			        
    </div>
    <!-- 관리자 로그인 탭 끝 -->
  </div>
</div>
  

 

</body>
</html>