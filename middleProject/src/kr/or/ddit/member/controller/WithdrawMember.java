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

@WebServlet("/member/withdrawMember.do")
public class WithdrawMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	 
		String memId= request.getParameter("mem_id");
		
		MemberVO memVo = new MemberVO();
		
		memVo.setMem_id(memId);
		
		// 회원 정보를 DB에 insert한다.
		IMemberService service = MemberServiceImpl.getInstance();
		int result= service.deleteMember(memId); //결과값 받기
		
		//결과값을 request에 저장 하기 
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/view/withdraw/insert.jsp").forward(request, response);
	}

}
