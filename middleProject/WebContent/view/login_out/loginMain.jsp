<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel= "stylesheet"  href="<%=request.getContextPath()%>/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/passEye.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
    	$('#yes').on('click', function () {
            if (!$('#chk').prop('checked')) { // 올바른 ID를 사용하여 체크박스에 액세스
                alert("이용약관에 동의체크를 해주세요.");
            	return false;
            }else{
                window.open('<%= request.getContextPath() %>/view/signup/memberSignup.jsp');
            }
        });
    	
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

<!-- 상단 메뉴바 -->
<jsp:include page="/view/main/top.jsp"/>


	<!-- 회원과 관리자 각각 서블릿에 저장된 데이터, 로그인오류정보 체크 -->
	<%
	
    // 세션에 저장한 데이터 가져오기
    //로그인 실패 때는 null값이 나온다 -> null일때 아래 body의 내용이 나오게하기
    MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
    //로그인 성공, 실패 여부
    String check = (String)session.getAttribute("check");
    
	%>
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form action="#">
      <h1>이용약관 동의서</h1>
      <span>너 내 도도독 동료가되슈</span>
	
	<div>
		<textarea id="txt">개인정보보호법에 따라 한밭지킴이에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
		
1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.
- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.
- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.
서비스 이용 과정에서 위치정보가 수집될 수 있으며,
네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
2. 수집한 개인정보의 이용
네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. 신규 서비스 요소의 발굴 및 기존 서비스 개선 등에는 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 생성·제공·추천, 상품 쇼핑 등에서의 인공지능(AI) 기술 적용이 포함됩니다.
- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
- 스마트플레이스 분쟁 조정 및 고객문의 대응
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
- 네이버 엑스퍼트 재가입 신청 및 부정 이용 방지
네이버 엑스퍼트 서비스 및 네이버 엑스퍼트 센터 가입 등록정보,판매자 이름 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
- 전자서명 인증 업무
개인정보: 네이버 인증서 서비스 해지 시까지 보관
인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 5년 보관
전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 통신비밀보호법
로그인 기록: 3개월

참고로 네이버는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
		</textarea>
	</div>
	<div class="checkBox check">
	<div>
		<table>
        	<tr>
          		<td><span>개인정보 수집 및 이용약관 동의(필수)</span></td>
          		<td><input type="checkbox" id="chk"></td>
         	</tr>
		</table>
	</div>
</div>
      <button id="yes">회원가입</button>
    </form>
  </div>
  
  
  
  <!-- 회원 로그인 탭  -->
  <div class="form-container sign-in-container">
		<form action="<%=request.getContextPath()%>/member/loginMember.do" method="post">
		<h1>로그인</h1>
		<span>계정을 입력해주슈</span>
		<%
		    if(memVo == null)
		    {session.invalidate();
		%>
		<input type="text" id="memId" name="memId" placeholder="아이디"><br>
		<div class="input password">
		<input type="password" id="password" class="form-input" name="pass" placeholder="비밀번호">
		<div class="eyes">
		<i class="fa fa-eye-slash fa-lg"></i>
		</div>
        </div>
		<!-- 로그인 오류 메시지 --> 
        <% if (check != null && check.equals("false")) { %>
            <span id="check" style="color: red;">로그인 오류 또는 비회원입니다</span>
        <% } %>
      <button type="submit">로그인</button>
    	<!-- 카카오 로그인 -->
		<a id="kakao-login-btn"></a>
		<div id="result"></div>
      <a href="<%=request.getContextPath()%>/view/login_out/getId.jsp">아이디 까먹었슈? </a>
      <a href="<%=request.getContextPath()%>/view/login_out/getPassword.jsp" class="login_forgot">비밀번호 까먹었슈? </a>
					
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
                    alert('로그인에 성공했지만 사용자 정보를 요청하지 못했습니다: ' + JSON.stringify(error));
                },
            });
        },
        fail: function (err) {
            alert('로그인 실패: ' + JSON.stringify(err));
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
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>튀소 용사여 <br>웰컴백이유</h1>
        <p>유잼대전으로 떠나보자고 !!</p>
        <button class="ghost" id="signIn">로그인</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>타슈타고 여행가유~</h1>
        <p>튀김소보루탐험가가 되어보실래요?</p>
        <button class="ghost" id="signUp">회원가입</button>
      </div>
    </div>
  </div>
</div>
</body>
<script src="<%=request.getContextPath()%>/js/logins.js"></script>
</html>