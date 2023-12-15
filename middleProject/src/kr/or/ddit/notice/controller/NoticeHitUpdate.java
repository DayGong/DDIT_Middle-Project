package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

@WebServlet("/notice/hit.do")
public class NoticeHitUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	int num = Integer.parseInt(request.getParameter("notice_no"));
    	
    	INoticeService service = NoticeServiceImpl.getInstance();
    	
    	int hit = service.updateHits(num);
    	
    	request.setAttribute("result", hit);
    	
    	request.getRequestDispatcher("view/notice/result.jsp").forward(request, response);
    	
	}

}
