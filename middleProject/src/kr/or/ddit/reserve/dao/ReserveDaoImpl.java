package kr.or.ddit.reserve.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;
import kr.or.ddit.vo.RestaurantReserveVO;
import kr.or.ddit.vo.RestaurantVO;

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
			
			res = session.insert("hotelRsvVo.reserveHotel", hotelRsvVo);
			
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

	@Override
	public int subtractHotelRoom(int hotel_no) 
	{
		SqlSession session = null;
		int res = 0; // 결과값을 저장할 변수
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			res = session.update("hotelVo.subtractHotelRoom", hotel_no);
			
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
	public int getHotelRoom(Map<String, String> date) 
	{
		SqlSession session = null;
		int res = 0;	// 결과값을 저장할 변수
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			res = session.selectOne("hotelVo.getHotelRoom", date);
			
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
	public RestaurantVO getRestaurantInfo(int rest_no) {
		RestaurantVO restaurantVo = null;
		SqlSession session = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			restaurantVo = session.selectOne("restaurantVo.getRestaurantInfo", rest_no);
			
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
		
		return restaurantVo;
	}

	@Override
	public int reserveRestaurant(RestaurantReserveVO restRsvVo) 
	{
		int res = 0; // 결과값이 저장될 변수
		SqlSession session = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			res = session.insert("restRsvVo.reserveRestaurant", restRsvVo);
			
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
	public List<String> getRestaurantReservedTime(Map<String, String> selectedDate) {
		List<String> reservedTimeList = new ArrayList<String>();
		SqlSession session = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			
			reservedTimeList = session.selectList("restRsvVo.getReservedTime", selectedDate);
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			if (session != null)
			{
				session.close();
			}
		}
		
		return reservedTimeList;
	}
	
}
