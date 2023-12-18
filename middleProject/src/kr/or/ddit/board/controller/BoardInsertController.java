package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

@WebServlet("/board/insert.do")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/view/board/boardInsertForm.jsp");
		rd.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//int no = Integer.parseInt(request.getParameter("notice_no"));
		String title = request.getParameter("board_title");
		String content = request.getParameter("board_content");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBrd_title(title);
		boardVO.setBrd_content(content);
		
		service.insertBoard(boardVO);
		
		response.sendRedirect(request.getContextPath()+"/board/list.do");
	}

}
