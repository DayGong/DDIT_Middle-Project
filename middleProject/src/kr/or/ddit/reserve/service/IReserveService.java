package kr.or.ddit.reserve.service;

import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.ReserveVO;

public interface IReserveService 
{

	/**
	 * ReserveVO객체를 받아 예약 테이블에 정보를 저장을 하는 메서드
	 * 
	 * @param reserveVo 예약 정보가 담긴 ReserveVO객체
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int reserveRestaurant(ReserveVO reserveVo);
	
	/**
	 * 업체 번호로 호텔의 상세 정보를 검색해 ReserveVO객체로 반환하는 메서드
	 * 
	 * @param comp_no 검색할 업체 번호
	 * @return 호텔의 상세 정보가 담긴 CompanyVO객체
	 */
	public CompanyVO getHotelInfo(int comp_no);
	
}
