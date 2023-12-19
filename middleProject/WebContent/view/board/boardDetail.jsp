<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
	String check = (String) session.getAttribute("check");
	String mem_id = (String) session.getAttribute("mem_id");
	String path = request.getContextPath();
	String ss = (check != null && check.equals("true")) ? "check" : "";
	String boardMemId = boardVO.getMem_id();
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
	<script type="text/javascript" src="<%= path %>/js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
	var ss = '<%=ss %>';
	
	$(document).ready(function(){
		if(ss === 'check'){
			$('.boardMineA').css('display', 'block');
		}
	});
	</script>

</head>

<body>
 	<div class="card-body">
		<div class="table-responsive"> 
		<table class="table" id="dataTable" width="100%"	cellspacing="0">
			<tr class="table-light">
			<td colspan="2"><%=boardVO.getBrd_title()%></td>
			</tr>
			<tr>
			<td colspan="2"><%=boardVO.getMem_id()%></td>
			</tr>
			<tr>
			<td><%=boardVO.getBrd_date()%></td>  <td>조회 <%=boardVO.getBrd_hits()%></td>
			</tr>
			<tr height = "300px">
			<td colspan="2"><%=boardVO.getBrd_content()%></td>
			</tr>
		</table>
			
			<%
            if (ss.equals("check") && mem_id != null && mem_id.equals(boardMemId)) {
            %>
			<a align="right" href="<%=request.getContextPath() %>/board/update.do?brd_no=<%=boardVO.getBrd_no() %>"
				style="display:none;" class="boardMineA">[게시글 수정]</a>
			<a align="right" href="./delete.do?brd_no=<%=boardVO.getBrd_no() %>"
				style="display:none;" class="boardMineA">[게시글 삭제]</a>
			<% 
			} 
			%>
			<a align="right" href="<%=request.getContextPath() %>/board/list.do">[목록으로]</a>
	</div>
</div>
</body>
</html>