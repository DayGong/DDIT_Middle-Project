package kr.or.ddit.reserve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reserve.service.IReserveService;
import kr.or.ddit.reserve.service.ReserveServiceImpl;
import kr.or.ddit.vo.CompanyVO;

@WebServlet("/reserve/returnToHotelReserveVo.do")
public class ReturnToHotelReserveVo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		int comp_no = Integer.parseInt(request.getParameter("comp_no"));
		
		CompanyVO companyVo = service.getHotelInfo(comp_no);
		
		request.setAttribute("companyVo", companyVo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
