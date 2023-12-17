<%@page import="kr.or.ddit.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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
					<th>작성날짜</th>
					<th>조회수</th>
					<th>첨부</th>
				</tr>
			<% 
				if (noticeList == null) {
			%>
			
				<tr>
					<td>공지사항이 존재하지 않습니다.</td>
				</tr>
				
			<%
				} else {
				for (NoticeVO noticeVO : noticeList) {
			%>
			
				<tr onclick="location.href='./detail.do?noticeNo=<%=noticeVO.getNoticeNo()%>'" style="cursor:pointer">
					<td><%=noticeVO.getNoticeNo()%></td>
					<td><%=noticeVO.getNoticeTitle()%></td>
					<td><%=noticeVO.getNoticeDate()%></td>
					<td><%=noticeVO.getNoticeHits()%></td>
					<td><%=noticeVO.getNoticeFile()%></td>
				</tr>

			<%
				}
			}
			%>

				<tr align="right">
					<td colspan="5"><a href="<%=request.getContextPath() %>/notice/insert.do">[게시글쓰기]</a></td>
				</tr>
			</table>

			
		</div>
	</div>
</body>
</html>