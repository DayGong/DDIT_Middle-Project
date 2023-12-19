<%@page import="kr.or.ddit.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
NoticeVO noticeVO = (NoticeVO) request.getAttribute("noticeVO");
String admin = (String) session.getAttribute("admin");
String path = request.getContextPath();
boolean isAdmin = (admin != null && admin.equals("true"));
   	
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
	 <script type="text/javascript" src="<%= path %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	 <% if (isAdmin) { %>
	 $('.noticeAdminA').addClass('btn btn-primary').css('display', 'inline-block');
   <% } %>
});
</script>
</head>

<body>
 	<div class="card-body">
		<div class="table-responsive"> 
         <button class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/notice/list.do'">목록으로</button>
        
		<table class="table" id="dataTable" width="100%"	cellspacing="0">
			<tr class="table-light">
				<td colspan="2"><%=noticeVO.getNoticeTitle()%></td>
			</tr>	
			<tr>
				<td><%=noticeVO.getNoticeDate()%></td><td>조회 <%=noticeVO.getNoticeHits()%></td> 
			</tr>
			<tr height = "300px">
				<td colspan="2"><%=noticeVO.getNoticeContent()%></td>
			</tr>
			   <% if (isAdmin) { %>
           <tr align="right">
           <td colspan="2">
                        <button class="noticeAdminA" onclick="location.href='<%=request.getContextPath() %>/notice/update.do?noticeNo=<%=noticeVO.getNoticeNo() %>'">게시글 수정</button>
                        <button class="noticeAdminA" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='./delete.do?noticeNo=<%=noticeVO.getNoticeNo() %>'">게시글 삭제</button>
                   </td>
                    <% } %>
                       
                 
			</tr>	
			
		</table>
	</div>
</div>
</body>
</html>