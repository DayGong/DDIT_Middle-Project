<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<script src="<%=request.getContextPath() %>/js/mainUsedCulture.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainUsedCulture.css"/>

<script type="text/javascript">
$(function()
{
	ListImg();
})
</script>
 
</head>
<body>

<div id="blue-container">
	<div>
		<div id="locationCultureText" style="width: 300px;">
			<p> 대전의 축제<br>봐볼래유? </p>
		</div>
		<div>
			<div id="locationCultureDiv" style="width: 100px; height:100px;">
				<img alt="화살표" src="<%= request.getContextPath() %>/images/icon/right.png">
			</div>
		</div>
	</div>
	<div id="slider">
		<div class="image-box">
			<div id="culture_img">
				<!-- 이미지 삽입 -->
			</div>
		</div>
	</div>
</div>


</body>
</html>