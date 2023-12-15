package kr.or.ddit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;

@WebServlet("/notice/update.do")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("notice_no"));
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVO = service.getNotice(no);
		
		request.setAttribute("noticeVO", noticeVO);
		
		request.getRequestDispatcher("/view/notice/noticeUpdateForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.parseInt(request.getParameter("notice_no"));
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		int hit = Integer.parseInt(request.getParameter("notice_content"));
		String date = request.getParameter("notice_date");
		String file = request.getParameter("notice_file");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		NoticeVO noticeVO = new NoticeVO(no, title, content, hit, date, file);
		
		int cnt = service.updateNotice(noticeVO);
		
		String msg = "";
		if(cnt>0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath()+"/notice/list.do");
	}

}
