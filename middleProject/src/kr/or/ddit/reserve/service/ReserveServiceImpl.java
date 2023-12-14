package kr.or.ddit.reserve.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.reserve.dao.IReserveDao;
import kr.or.ddit.reserve.dao.ReserveDaoImpl;
import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;
import kr.or.ddit.vo.RestaurantReserveVO;
import kr.or.ddit.vo.RestaurantVO;

public class ReserveServiceImpl implements IReserveService 
{
	
	private static IReserveDao dao = ReserveDaoImpl.getInstance();
	
	private static IReserveService service = null;
	
	private ReserveServiceImpl() {}
	
	public static IReserveService getInstance() 
	{
		if ( service == null ) 
		{
			service = new ReserveServiceImpl();
		}
		
		return service;
	}

	@Override
	public int reserveHotel(HotelReserveVO hotelRsvVo) 
	{
		return dao.reserveHotel(hotelRsvVo);
	}

	@Override
	public HotelVO getHotelInfo(int hotel_no) 
	{
		return dao.getHotelInfo(hotel_no);
	}

	@Override
	public int subtractHotelRoom(int hotel_no) {
		return dao.subtractHotelRoom(hotel_no);
	}

	@Override
	public int getHotelRoom(Map<String, String> date) {
		return dao.getHotelRoom(date);
	}

	@Override
	public RestaurantVO getRestaurantInfo(int rest_no) {
		return dao.getRestaurantInfo(rest_no);
	}

	@Override
	public int reserveRestaurant(RestaurantReserveVO restRsvVo) {
		return dao.reserveRestaurant(restRsvVo);
	}

	@Override
	public List<String> getRestaurantReservedTime(Map<String, String> selectedDate) {
		return dao.getRestaurantReservedTime(selectedDate);
	}

	@Override
	public int doManagerAllCheckout() {
		return dao.doManagerAllCheckout();
	}

	@Override
	public List<Map<String, String>> getMemberHotelReserve(String mem_id) {
		return dao.getMemberHotelReserve(mem_id);
	}

	@Override
	public List<Map<String, String>> getMemberRestaurantReserve(String mem_id) {
		return dao.getMemberRestaurantReserve(mem_id);
	}

	@Override
	public int reserveHotelCancel(String hotel_rsv_no) {
		return dao.reserveHotelCancel(hotel_rsv_no);
	}

	@Override
	public int reserveRestaurantCancel(int rest_rsv_no) {
		return dao.reserveRestaurantCancel(rest_rsv_no);
	}

	@Override
	public List<Map<String, String>> getMemberHotelReserveCancel(String mem_id) {
		return dao.getMemberHotelReserveCancel(mem_id);
	}

	@Override
	public List<Map<String, String>> getMemberRestaurantReserveCancel(String mem_id) {
		return dao.getMemberRestaurantReserveCancel(mem_id);
	}

}
