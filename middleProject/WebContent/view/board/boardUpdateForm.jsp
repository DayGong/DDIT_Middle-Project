<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 //원글내용 가져오기- 서블릿에서 저장한 데이타 꺼내기 
	BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
 
 
 //원글내용 꺼내기 
 	String updatedTitle = boardVO.getBrd_title();
 	 String updatedContent = boardVO.getBrd_content(); // 수정 전 내용
     Date currentDate = new Date(); // 현재 날짜 및 시간
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜 포맷 지정
     
     String updatedDate = dateFormat.format(currentDate);
 	/* 
     NoticeVO updatedNoticeVO = new NoticeVO();
     updatedNoticeVO.setNoticeNo(noticeVO.getNoticeNo()); // 이전 공지사항 번호를 설정하여 기존 데이터를 수정할 수 있도록 합니다.
     updatedNoticeVO.setNoticeTitle(updatedTitle);
     updatedNoticeVO.setNoticeContent(updatedContent);
     updatedNoticeVO.setNoticeDate(updatedDate); */
     
  // 새로운 NoticeVO 객체를 요청 속성으로 설정하여 수정 가능한 값보내줌.
    /*  request.setAttribute("updatedNoticeVO", updatedNoticeVO); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 <form action="<%=request.getContextPath() %>/board/update.do" method="post"> <!-- 수정된 데이터를 처리할 서블릿 경로 지정 -->
        <div class="card-body">
            <div class="table-responsive"> 
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
				<!--    <th>작성자</th> -->
                        <th>내용</th>
                        <th>작성날짜</th>
                        <th>조회수</th>
                        <th>첨부</th>
                    </tr>
                    <tr>
                    
                        <td><input type="text" name="brd_no" value="<%=boardVO.getBrd_no()%>" style="border:none" readonly/></td>
                        <td><input type="text" name="brd_title" value="<%=boardVO.getBrd_title()%>"></td>
                        <td><textarea name="brd_content"><%=boardVO.getBrd_content()%></textarea></td>
                        <td><%=boardVO.getBrd_date()%></td>
                        <td><%=boardVO.getBrd_hits()%></td>
                        <td>-</td>
                    </tr>
                    <tr align="right">
                        <td colspan="6">
                            <button type="submit">수정 완료</button>
                            <a href="<%=request.getContextPath() %>/board/list.do">[목록으로]</a>
                            <a href="./delete.do?brd_no=<%=boardVO.getBrd_no() %>">[게시글 삭제]</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>