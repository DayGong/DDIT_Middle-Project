package kr.or.ddit.reserve.service;

import kr.or.ddit.reserve.dao.IReserveDao;
import kr.or.ddit.reserve.dao.ReserveDaoImpl;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.ReserveVO;

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
	public int reserveRestaurant(ReserveVO reserveVo) 
	{
		return dao.reserveRestaurant(reserveVo);
	}

	@Override
	public CompanyVO getHotelInfo(int comp_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
