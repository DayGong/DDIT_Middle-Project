<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel= "stylesheet"  href="<%=request.getContextPath()%>/css/withdraw.css">
<script>

$(() => { 
	// 탈퇴버튼(예) 클릭
    $('#withdrawbtn').on('click', function()
    	{ 
			var password = $('#checkPass').val();

			// AJAX로 서버에 회원 탈퇴 요청 보내기
        $.ajax
        ({
            url: "<%=request.getContextPath()%>/member/withdrawMember.do",
            type: 'post',
            dataType: 'json',
            data: { "check_pass": password },
            success: function(res) {
            	if(res.flag == "성공") {
	                // 성공 시 이동할 경로 지정
	                swal({
		                title: "탈퇴했습니다!",
		                text: "안녕히가세요.",
		                icon: "success"
		            }).then(() => {
	                	window.location.href = '<%=request.getContextPath()%>/index.jsp';
		            });
            	}
            },
            error: function(xhr) {
                alert("에러 상태 : " + xhr.status);                
            }
        });     
    });

    $('#cancel').on('click', function() {
        // 아니오 버튼 클릭 시 마이페이지로 이동
    	swal({
              title: "탈퇴를 취소했습니다.",
              text: "마이페이지로 돌아갑니다.",
              icon: "error"
          }).then(() => {
        window.location.href = '<%=request.getContextPath()%>/view/member/memberForm.jsp';
          });
    });
});
</script>
</head>
<body>
<% 
 	MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
%>
<input type ="hidden" name ="mem_id" value="<%=memVo.getMem_id()%>">
<div id="container" class="center-content">
    <h2><b>회원탈퇴</b></h2>
    <form id="withdrawform">
        <div>
            <img src="<%=request.getContextPath()%>/images/login/우는꿈돌이.png" class="round-image">
            <div><h3>경고 : 탈퇴를 하셔도 작성했던 게시글은 남아있습니다. (게시판, 후기 등등)<br>비밀번호를 다시 한 번 입력하세요.</h3></div>
           <div>비밀번호 확인
              <input type="password" id="checkPass" name="check_pass">
          </div>
          <div style="display:flex; margin:5px;">
	          <input type="button" id="withdrawbtn" class="btn" value="탈퇴">
	          <input type="button" id="cancel" class="btn" value="탈퇴취소">
          </div>
        </div>
    </form>
</div>
</body>
</html>