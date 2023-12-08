package kr.or.ddit.reserve.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.ReserveVO;

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
	public int reserveRestaurant(ReserveVO reserveVo) 
	{
		int res = 0; // 결과값을 저장하는 변수
		SqlSession session = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
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
	
	
}
