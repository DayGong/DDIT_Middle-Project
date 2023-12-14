package kr.or.ddit.admin.dao;

import kr.or.ddit.vo.AdminVO;

public interface IAdminDao {
	/**
	 * AdminVO객체를 받아 관리자 정보를 저장하는 메서드
	 * 
	 * @param adminVo
	 * @return 성공 시 반환값: 1, 실패 시 반환값: 0
	 */
	public int insertAdmin(AdminVO adminVo);
}
