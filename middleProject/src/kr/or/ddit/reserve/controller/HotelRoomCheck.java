package kr.or.ddit.reserve.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reserve.service.IReserveService;
import kr.or.ddit.reserve.service.ReserveServiceImpl;

/**
 * 입력한 날짜에 남은 객실이 있는지 확인하고 예약 완료 후 차감하는 서블릿
 */
@WebServlet("/reserve/hotelRoomCheck.do")
public class HotelRoomCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 객실 확인
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Map<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("startDate", request.getParameter("startDate"));
		dateMap.put("endDate", request.getParameter("endDate"));
		
		System.out.println(request.getParameter("startDate"));
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		//int roomCnt = service.getHotelRoom("hotelVo.getHotelRoom", dateMap);
	}
	
	// 예약 완료 후 차감
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no"));
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		int result = service.subtractHotelRoom(hotel_no);
		
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/view/reserve/result.jsp").forward(request, response);
	}

}
