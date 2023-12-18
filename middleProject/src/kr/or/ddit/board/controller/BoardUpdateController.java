package kr.or.ddit.board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.notice.service.IBoardService;
import kr.or.ddit.notice.service.BoardServiceImpl;
import kr.or.ddit.vo.NoticeVO;

@WebServlet("/board/update.do")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeNoParam = request.getParameter("noticeNo");
		int no = 0;
		if (noticeNoParam != null && !noticeNoParam.isEmpty()) {
		    try {
		        no = Integer.parseInt(noticeNoParam);
		    } catch (NumberFormatException e) {
		       e.printStackTrace();
		    }
		}
		
		
		IBoardService service = BoardServiceImpl.getInstance();
		 
		NoticeVO noticeVO = service.getNotice(no);
		
		request.setAttribute("noticeVO", noticeVO);
		
		request.getRequestDispatcher("/view/notice/noticeUpdateForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 request.setCharacterEncoding("UTF-8");
		
		String noticeNoParam = request.getParameter("notice_no");
		int no = 0;
		if (noticeNoParam != null && !noticeNoParam.isEmpty()) {
		    try {
		        no = Integer.parseInt(noticeNoParam);
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		    }
		}
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		
		
		IBoardService service = BoardServiceImpl.getInstance();
		NoticeVO noticeVO = new NoticeVO(no, title, content);
		
		int cnt = service.updateNotice(noticeVO);
		
		 
		
		response.sendRedirect(request.getContextPath()+"/notice/list.do");
	}

}
