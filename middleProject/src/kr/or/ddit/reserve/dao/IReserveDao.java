package kr.or.ddit.reserve.dao;

import kr.or.ddit.vo.ReserveVO;

public interface IReserveDao {
	
	/**
	 * ReserveVO객체를 받아 예약 테이블에 정보를 저장을 하는 메서드
	 * 
	 * @param reserveVo 예약 정보가 담긴 ReserveVO객체
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int reserveRestaurant(ReserveVO reserveVo);

}
