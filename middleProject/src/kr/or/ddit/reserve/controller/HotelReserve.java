package kr.or.ddit.reserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reserve.service.IReserveService;
import kr.or.ddit.reserve.service.ReserveServiceImpl;
import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;

@WebServlet("/reserve/hotelReserve.do")
public class HotelReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no"));
		
		HotelVO hotelVo = service.getHotelInfo(hotel_no);
		
		request.setAttribute("hotelVo", hotelVo);
		
		request.getRequestDispatcher("/view/reserve/hotelInfoReturn.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		HotelReserveVO hotelRsvVo = new HotelReserveVO();
		
		// hotelRsvVo = request.getParameterMap();
		// hotelRsvVo.set
		
		// request.setAttribute("", );
		
		// request.getRequestDispatcher("/view/reserve/hotelKakaopay.jsp").forward(request, response);
	}

}
