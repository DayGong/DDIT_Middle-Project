<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대전 관광 홈페이지</title>
</head>
<body>

<!-- 상단 메뉴바 -->
<jsp:include page="/view/main/top.jsp"/>

<!-- 메인 이미지 슬라이드 -->
<jsp:include page="/view/main/slideImg.jsp"/>

<!-- 축제 관련 내용 -->

<!-- 공연 관련 내용 -->


<jsp:include page="/view/main/scrollup.jsp"/>

<!-- 동영상 자동 재생(height 자동 조절 안 됨 - 수정해보다가 안 되면 발표 화면에 맞춰서 고정값 넣기) -->
<div id="videoArea">
	<iframe class="videoArea" src="https://www.youtube.com/embed/Vh6UyH1TAEY?si=-enLIog4Wzto0soU&amp;controls=0&mute=1&autoplay=1&playlist=Vh6UyH1TAEY&loop=1" 
			title="YouTube video player" frameborder="0" width="100%" height="650px"
			allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen ></iframe>
</div>

</body>
</html>