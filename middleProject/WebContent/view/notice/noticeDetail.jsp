<%@page import="kr.or.ddit.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeVO noticeVO = (NoticeVO) request.getAttribute("noticeVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
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
				<th>첨부</th>
			</tr>	
			<tr>
				<td><%=noticeVO.getNoticeNo()%></td>
				<td><%=noticeVO.getNoticeTitle()%></td>
				<td><%=noticeVO.getNoticeContent()%></td>
				<td><%=noticeVO.getNoticeDate()%></td>
				<td><%=noticeVO.getNoticeHits()%></td>
				<td><%=noticeVO.getNoticeFile()%></td>
			</tr>
			<tr align="right">
				<td colspan="6">
				<a href="<%=request.getContextPath() %>/notice/list.do">[목록으로]</a>
				<a href="<%=request.getContextPath() %>/notice/update.do?noticeNo=<%=noticeVO.getNoticeNo() %>">[게시글 수정]</a>
				<a href="./delete.do?noticeNo=<%=noticeVO.getNoticeNo() %>">[게시글 삭제]</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>