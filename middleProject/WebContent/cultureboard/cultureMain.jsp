<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page isELIgnored="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/culture.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel= "stylesheet"  href="<%=request.getContextPath() %>/css/culture.css">  
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>


 <script>
   mypath='<%=request.getContextPath()%>';
   currentPage=1;
     $(function(){
	 ListPageServer(1);  // 문화 리스트 불러오는 메서드 호출
     })    	
 </script>
 <style>
</style>
</head>
<body>
<div class="big-buttons">
<button class="cateBtn" name="resList"> 전체보기 </button>
<button class="cateBtn" name="tourList" >공연</button>
<button class="cateBtn" name="resList"> 축제 </button>
<button class="cateBtn" name="hotelList">전시</button>
 </div>
 <hr>        
<div id ="result1"></div>  <!-- 문화 리스트 출력되는 자리 -->
<div id ="pagelist"></div> <!-- 페이지 버튼이 출력되는 자리 --> 
<div id ="result2"></div>  <!-- offcanvas 폼이 출력되는 자리 -->
  
</body>
</html>