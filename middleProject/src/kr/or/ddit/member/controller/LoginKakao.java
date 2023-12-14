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


@WebServlet("/member/loginKakao.do")
public class LoginKakao extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String memId=request.getParameter("id");
		String memName=request.getParameter("name");
		String memPass="-";
		String memAddr="-";
		String memTel=request.getParameter("tel");
		String memMail=request.getParameter("mail");
		
		// 받아온 회원정보를 VO에 저장하기.
		MemberVO memVo = new MemberVO();

		memVo.setMem_id(memId);
		memVo.setMem_pass(memPass);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_mail(memMail);
		memVo.setMem_addr(memAddr);
		
		// 회원 정보를 DB에 insert한다.
		IMemberService service = MemberServiceImpl.getInstance();
		int result = service.insertMember(memVo);	// 결과값 받기
		
		// 결과값을 request에 저장하기
		request.setAttribute("result", result);
		request.getRequestDispatcher("/view/login_out/result.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
