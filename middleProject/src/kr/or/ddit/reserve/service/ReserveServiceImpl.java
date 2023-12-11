package kr.or.ddit.reserve.service;

import kr.or.ddit.reserve.dao.IReserveDao;
import kr.or.ddit.reserve.dao.ReserveDaoImpl;
import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;

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

}
