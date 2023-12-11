package kr.or.ddit.member.dao;
 
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao{
	private SqlSession session;
	
	private static MemberDaoImpl dao;
	
	private MemberDaoImpl() {}
	
	public static MemberDaoImpl getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}
	// 싱글톤 끝.
	
	@Override
	public int insertMember(MemberVO memVo)
	{
		session = MybatisUtil.getSqlSession();
		int cnt = 0;		// 결과값을 저장하는 변수
		
		try
		{
			cnt = session.insert("member.insertMember", memVo);
			
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
	} // insertMember 끝

	@Override
	public int updateMember(MemberVO memVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO getSelectMember(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectById(String memId) 
	{
		String res = null;
		
		try 
		{
			session = MybatisUtil.getSqlSession();
			res = session.selectOne("member.selectById", memId);
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			if(session != null) session.close();
		}

		return res;
	}

	@Override
	public MemberVO getLoginMember(MemberVO memVo) {
		MemberVO loginMemberVo = null;
		session = MybatisUtil.getSqlSession();
		
		try {
			loginMemberVo = session.selectOne("member.getLoginMember", memVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return loginMemberVo;
	}

}
