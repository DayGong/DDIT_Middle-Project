package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/member/fogotId.do")
public class FogotId extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// mail주소 가져오기
		String memMail = request.getParameter("memMail");
		
		// Service 객체 생성
		IMemberService service = MemberServiceImpl.getInstance();
		
		// 서비스 메소드 호출
		String id = service.getID(memMail);
		
		// 결과값을 request에 저장
		request.setAttribute("id", id);
		
		// view페이지로 이동
		request.getRequestDispatcher("/view/login_out/getId.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
