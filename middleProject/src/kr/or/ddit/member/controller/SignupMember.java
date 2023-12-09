package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
 
 
@WebServlet("/member/signupMember.do")
public class SignupMember extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberVO memVo = new MemberVO();
		
		IMemberService service =MemberServiceImpl.getInstance();
		
		// 서비스 메소드 호출
		int res = service.insertMember(memVo);
		
		// 결과값을 request에 저장
		request.setAttribute("res", res);
		
		// view페이지로 이동
		request.getRequestDispatcher("/member/memberSighup.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
