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
		// view페이지로 이동
		request.getRequestDispatcher("/view/signup/memberSignup.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 회원정보 저장하기
		String memId= request.getParameter("mem_id");
		String memPass= request.getParameter("mem_pass");
		String memName= request.getParameter("mem_name");
		String memTel= request.getParameter("mem_tel");
		String memMail= request.getParameter("mem_mail")+"@"+request.getParameter("domain");
		String memAddr= request.getParameter("roadAddress")+request.getParameter("extraAddress")+request.getParameter("detailAddress");
	
		// 받아온 회원 정보를 VO에 저장하기.
		MemberVO memVo = new MemberVO();
		
		memVo.setMem_id(memId);
		memVo.setMem_pass(memPass);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_mail(memMail);
		memVo.setMem_addr(memAddr);
		
		// 회원 정보를 DB에 insert한다.
		IMemberService service = MemberServiceImpl.getInstance();
		service.insertMember(memVo);
		
		// 작업이 완료되면 로그인 화면으로 이동
		response.sendRedirect(request.getContextPath()+"/view/signup/signuptest.jsp");
	}

}
