<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String path = request.getContextPath();
%>
<title>Insert title here</title>
<script src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= path %>/js/slideText.js"></script>
<link rel="stylesheet" href="<%= path %>/css/slideText.css">
</head>
<body>

<div class="scroll_wrap">
    <div class="scroll_on type_left">
    	<img src="<%= path %>/images/icon/expo_color1.png">
    	<p>
    		이미지 괜찮은 거 하나 넣구요
    	</p>
    </div>
    <div class="scroll_on type_right">
    	<p>
    		오른쪽에서 나올만한 이야기 대충 넣습니다.<br>
    		대충 한.. 10줄 정도?<br>
    		그정도면 되지않을까요?<br>
    		아마도..?<br>
    		test<br>
    		잘 나오니?<br>
    		확인한다..<br>
    		테스트다..<br>
    		대덕워리어즈..<br>
    		화이팅..<br>
    		화이..<br>
    		화..<br>
    		화난다..<br>
    	</p>
    </div>
    <div class="scroll_on type_bottom">
    	<p>
    		그림 또 아래에서 하나 올라올 때 됐다..<br>
    		그죠??<br>
    		그럼 있어보이지..<br>
    		기능이 없으면 예쁘기라도 해야돼..<br>
    		뭐지.. 아래에서 올라오는 거 다음에 위에서 와야지 작동 됩니다..<br>
    		위에서 내려오고 아래에서 올라오는 거 안 됩니다..<br>
    		고급 자바 쌤.....<br>
    		너무 친절하심니다........<br>
    		우리들의 희망.. 우리들의 빛... <br>
    	</p>
	</div>
    <div class="scroll_on type_top">
    	<p>
    		여기쯤에서 그림 하나 위에서 내려오고<br>
    		뭐 그림 하나 말고 여러개 내려왔으면..<br>
    		그냥 있어보이게..<br>
    		알잖아요??<br>
    	</p>
	</div>
</div>

</body>
</html>