<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page isELIgnored="true" %>   
<%
BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
String check = (String) session.getAttribute("check");
String mem_id = (String) session.getAttribute("mem_id");
String path = request.getContextPath();
String ss = (check != null && check.equals("true")) ? "check" : "";
String boardMemId = boardVO.getMem_id();
MemberVO vo= (MemberVO) session.getAttribute("loginMember");                                     
boolean isAdmin = (mem_id != null && mem_id.equals(boardMemId));

 String sess= null;
 //vo객체를 json데이터로 변경
 Gson gson= new Gson();
 if(vo!=null) sess=gson.toJson(vo);

%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
	<script type="text/javascript" src="<%= path %>/js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="<%= path %>/js/board.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	var ss = '<%=ss %>';
	uvo=<%=sess%>;
	 
	 mypath='<%=request.getContextPath()%>';
	 vaction=  $(this).attr('name');
	 vidx= $(this).attr('idx');//글 번호
	 queryString = window.location.search;

   
	 urlParams = new URLSearchParams(queryString);

	 brdNo = urlParams.get('brd_no');
	 console.log(brdNo); // brd_no의 값 출력
	 
	 reply ={}; //필요할때마다 동적으로 속성과 메소드를 추가할수있다 댓글 저장시 사용 
	 $(document).ready(function(){
	       <% if (ss.equals("check") && isAdmin) { %>
	         $('.boardMineA').addClass('btn btn-primary').css('display', 'inline-block');
	     <% } %>
	     
	     <%  if(ss.equals("check")){ %>
	    	 $('#insertRe').css("display","block");
	    	 <% } %>
		     
	     ReplyListServer();
	     
	 })	
	     $(document).on('click','.action',function(){
	    		    cate=$(this).attr('name');
	    			gthis=$(this);
	    			vnum=$(this).attr('idx');
	    			
	    			reply.brd_no=brdNo;
	    			reply.rpl_content= $('#retext').val().replace(/<br>/g, '\n').trim();
	    			
	    			reply.mem_id="<%=mem_id%>";
	
	    			if(cate=="replyInsert"){	    				
	    				writeReply();
	    			   $(this).prev().val("");
                         
	    			}
	    			if(cate=="r_delete"){	
	    			 deleteReply(vnum);
	    			 $(this).parents('.reply-body').remove();
	    			 ReplyListServer();
	    	         }
	    			if(cate=="r_update"){
	    				
	    			vp3= $(this).parents('.reply-body').find('.p3').html().trim();    	
	   			       
	   			      mcont = vp3.replaceAll(/<br>/g,"\n");                 
	    			   	
	   			     
	   			      $('#rpl_content').val(mcont);
	   			      $('#mem_id').val(`${uvo.mem_id}`);
	   			      $('#mem_id').prop('readonly', true);
	    			  $("#uModal").modal('show');
	    			  	
	    				
	    			}
	    			
	    			if(cate=="updatesend"){
	    		    modicont= $('#rpl_content').val();
	    		    modiout= modicont.replaceAll(/\n/g, "<br>");
	    		    vp3=$("p3",this);
	    		    reply.rpl_content= modicont;
	    		    
	  			    reply.rpl_no= vidx;
	  			    ReplyUpdateServer();
	    			}
	    			

	     
	   });

	 ReplyListServer=function(){
			
		  $.ajax({
			url : `${mypath}/reply/replyList.do`,
			async : false,
			type : 'get',		
			data : {"bonum" : brdNo}, 
			success :function(res){
				rcode="";
				$.each(res,function(i,v){
					
					content=v.rpl_content;
					content=content.replaceAll(/\n/g,"<br>");

				rcode+= `
		               <div class="reply-body">
			            <div class='p12' >
			              <p class="p1">
			              &nbsp;&nbsp;&nbsp;&nbsp;작성자 : <span class="rwr">${v.mem_id}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					                                  					              
			                    날짜 : <span class="rda">${v.rpl_date}</span>&nbsp;&nbsp;&nbsp;
			              
			              </p>
			              <div class="button-container" style="display: flex; justify-content: flex-end;">
			              <p class="p2">`;
                             
                       if( uvo !=null && uvo.mem_id == v.mem_id ){
			          rcode+=`<input type="button" idx="${v.rpl_no}" value="댓글수정" name="r_update" class="action">
			                <input type="button" idx="${v.rpl_no}" value="댓글삭제" name="r_delete" class="action">`;
			           } 

                   rcode +=`</p>
                           </div>
			                  </div>
			                   <p class="p3">${content}</p></div></div><hr>`;
		
	})  //반복 끝
	    
	//출력
	    $(this).parents('.card').find('.reply-body').remove();
        $('.replytab').html(rcode);
            
			},
			error : function(xhr){
			   alert(xhr.status);	
			},
			dataType: 'json'
		})
		
	} 

	 
	</script>

</head>

<body>
    <div class="card-body">
      <div class="table-responsive"> 
       <button class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/board/list.do'">목록으로</button>
      <table class="table" id="dataTable" width="100%"   cellspacing="0">
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
         
      <tr>
                    <% if (ss.equals("check") && isAdmin) { %>
                        <td colspan="2">
                            <button class="boardMineA" onclick="location.href='<%=request.getContextPath() %>/board/update.do?brd_no=<%=boardVO.getBrd_no() %>'">게시글 수정</button>
                            <button class="boardMineA" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='./delete.do?brd_no=<%=boardVO.getBrd_no() %>'">게시글 삭제</button>
                        </td>
                    <% } %>
                </tr>
         
      </table>
   </div>
</div>
     <div id="insertRe" style="display:none"> 
       <textarea id="retext" style="width :500px;"></textarea>
       &nbsp;&nbsp;<input type="button" class="action" name="replyInsert" value="댓글 작성" style="width:150px;"><br>
     </div>
	<div class="replytab"></div>
</div>

	<!-- 댓글수정 The Modal -->
<div class="modal" id="uModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="uform" id ="uform">
              <input type ="hidden" id="bnno" name="bnno" class="txt">
           <label>아이디 </label>
           <input type ="text" id="mem_id" name="mem_id" class="txt"><br><br><br>
           <label>내용&nbsp;&nbsp;</label>
           <textarea  id="rpl_content" name="rpl_content" class="txt"></textarea>><br><br> 
           <br> <br>
           <input type="button" value="확인" name="updatesend" class="action">
           
         </form>         
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>




</body>
</html>