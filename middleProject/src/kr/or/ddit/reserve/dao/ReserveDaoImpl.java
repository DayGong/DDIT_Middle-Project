package kr.or.ddit.reserve.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;

public class ReserveDaoImpl implements IReserveDao 
{

	private static IReserveDao dao;
	
	private ReserveDaoImpl() {}
	
	public static IReserveDao getInstance() 
	{
		if ( dao == null ) 
		{
			dao = new ReserveDaoImpl();
		}
		
		return dao;
	}
	
	@Override
	public int reserveHotel(HotelReserveVO hotelRsvVo) 
	{
		int res = 0; // 결과값을 저장하는 변수
		SqlSession session = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			res = session.insert("reserveVo.reserveHotel", hotelRsvVo);
			
			session.commit();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally 
		{
			if ( session != null ) 
			{
				session.close();
			}
		}
		
		return res;
	}

	@Override
	public HotelVO getHotelInfo(int hotel_no) 
	{
		HotelVO hotelVo = null;
		SqlSession session = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			hotelVo = session.selectOne("hotelVo.getHotelInfo", hotel_no);
			System.out.println(hotelVo);
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally 
		{
			if ( session != null ) 
			{
				session.close();
			}
		}
		
		return hotelVo;
	}
	
}
