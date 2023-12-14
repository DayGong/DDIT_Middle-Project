package kr.or.ddit.admin.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.AdminVO;

public class AdminDaoImpl implements IAdminDao
{
	private SqlSession session;
	
	private static AdminDaoImpl dao;
	
	private AdminDaoImpl() {}
	
	public static AdminDaoImpl getInstance()
	{
		if(dao==null) dao = new AdminDaoImpl();
		
		return dao;
	}
	// 싱글톤 끝.

	@Override
	public int insertAdmin(AdminVO adminVo) 
	{
		session = MybatisUtil.getSqlSession();
		int cnt = 0; //결과값을 저장하는 변수
		try 
		{
			cnt = session.insert("admin.insertAdmin", adminVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			if(session != null) session.close();
		}
		return cnt;
	}	//insertAdmin 끝

}
