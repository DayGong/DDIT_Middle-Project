<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	                alert("탈퇴했습니다 안녕히가세요.");
	                window.location.href = '<%=request.getContextPath()%>/index.jsp';
            	}
            },
            error: function(xhr) {
                alert("에러 상태 : " + xhr.status);                
            }
        });     
    });


    $('#cancel').on('click', function() {
        // 아니오 버튼 클릭 시 마이페이지로 이동
        window.location.href = '<%=request.getContextPath()%>/view/member/memberForm.jsp';
    });
});
</script>
</head>
<body>
<% 
 	MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
%>
<input type ="hidden" name ="mem_id" value="<%=memVo.getMem_id()%>">

    <h2>회원탈퇴화면</h2>
    <form id ="withdrawform">
    
        <div>* 회원탈퇴안내* </div>
        <div> 경고 : 탈퇴를 하셔도 작성했던 게시글은 남아있습니다. (게시판, 후기 등등)</div>
	    <div> 비밀번호를 다시 한 번 입력하세요. </div>
        <div>
		    <div> * 비밀번호 :
	        <input type="password" id="checkPass" name="check_pass">
        	</div>
        </div>
        
        <input type="button" id="withdrawbtn" value="탈퇴">
        <input type="button" id="cancel" value="탈퇴취소">
        <span id="spanwithdraw"></span>
    </form>
</body>

</html>