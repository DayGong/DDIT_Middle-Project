package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService
{
	
	private static IMemberDao dao = MemberDaoImpl.getInstance();
	
	private static IMemberService service = null;
	
	private MemberServiceImpl() {}
	
	public static IMemberService getInstance()
	{
		if( service == null )
		{
			service = new MemberServiceImpl();
		}
		
		return service;
	}
	
	
	@Override
	public int insertMember(MemberVO memVo)
	{
		return dao.insertMember(memVo);
	}

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
	public String selectById(String memId) {
		return dao.selectById(memId);
	}

}
