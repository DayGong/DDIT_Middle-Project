<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 페이지</title>
</head>
<script>
$(() => {
    $('#withdraw').on('click', function(){
        // AJAX로 서버에 회원 탈퇴 요청 보내기
        $.ajax({
            url: "<%=request.getContextPath()%>/member/withdrawMember.do",
            type: 'post',
            dataType: 'json',
            success: function(res) {
                // 성공 시 이동할 경로 지정
                $('#spanwithdraw').html(res.result).css('color', 'red');
                window.location.href = '<%=request.getContextPath()%>/index.jsp';
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
<body>
<%
	MemberVO memVo = (MemberVO)request.getAttribute("memberVo");
%>
    <h2>회원탈퇴화면</h2>
        <input type="hidden" name="mem_id" value="<%= memVo.getMem_id() %>">
    <form>
        <div>회원탈퇴안내</div>
        <div>탈퇴를 하셔도 작성했던 게시글은 남아있습니다. (게시판, 후기 등등)</div>
        <div>정말 탈퇴하시겠습니까?</div>
        
        <input type="button" id="withdraw" value="예">
        <input type="button" id="cancel" value="아니오">
        <span id="spanwithdraw"></span>
    </form>
</body>
</html>