package kr.or.ddit.reserve.dao;

import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;

public interface IReserveDao 
{
	
	/**
	 * HotelReserveVO객체를 받아 숙소 예약 테이블에 정보를 저장을 하는 메서드
	 * 
	 * @param hotelRsvVo 숙소 예약 정보가 담긴 HotelReserveVO객체
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int reserveHotel(HotelReserveVO hotelRsvVo);

	/**
	 * 숙소 번호로 호텔의 상세 정보를 검색해 HotelVO객체로 반환하는 메서드
	 * 
	 * @param hotel_no 검색할 숙소 번호
	 * @return 숙소의 상세 정보가 담긴 HotelVO객체
	 */
	public HotelVO getHotelInfo(int hotel_no);
	
}
