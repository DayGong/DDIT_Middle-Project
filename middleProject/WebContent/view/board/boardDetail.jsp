<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

</head>

<body>
 	<div class="card-body">
		<div class="table-responsive"> 
		<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>	
			<tr>
				<td><%=boardVO.getBrd_no()%></td>
				<td><%=boardVO.getBrd_title()%></td>
				<td><%=boardVO.getBrd_content()%></td>
				<td><%=boardVO.getBrd_date()%></td>
				<td><%=boardVO.getBrd_hits()%></td>
			</tr>
			<tr align="right">
				<td colspan="5">
				<a href="<%=request.getContextPath() %>/board/list.do">[목록으로]</a>
				<a href="<%=request.getContextPath() %>/board/update.do?boardNo=<%=boardVO.getBrd_no() %>">[게시글 수정]</a>
				<a href="./delete.do?boardNo=<%=boardVO.getBrd_no() %>">[게시글 삭제]</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>