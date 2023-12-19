 <%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="kr.or.ddit.vo.NoticeVO"%> 
 <%@ page language="java" contentType="text/html; charset=UTF-8" 
     pageEncoding="UTF-8"%>
      <% 
BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
 %> 
 <!DOCTYPE html> 
 <html>
 <head> 
 <meta charset="UTF-8"> 
 <title>Insert title here</title> 
 </head> 
 <body>
    <div>
     <h1>게시판 작성</h1> 
     <form id="boardInsertForm" action="<%=request.getContextPath() %>/board/insert.do" method="post"> 
         <label for="title">제목:</label>
         <input type="text" id="title" name="brd_title"><br>
    
         <label for="content">내용:</label>
         <textarea id="content" name="brd_content" rows="4" cols="50"></textarea><br>
    
         <input type="submit" value="작성완료" onclick="complete()"> 
         <input type="button" value="뒤로가기" onclick="history.back(-1);"> 
     </form> 
    </div>
<script> 
function complete() {
	alert("글 작성이 완료되었습니다.");
}
     </script>
 </body> 
 </html> 