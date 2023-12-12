package kr.or.ddit.reserve.dao;

import java.util.Map;

import kr.or.ddit.vo.HotelReserveVO;
import kr.or.ddit.vo.HotelVO;
import kr.or.ddit.vo.RestaurantReserveVO;
import kr.or.ddit.vo.RestaurantVO;

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
	 * 숙소 번호로 숙소의 상세 정보를 검색해 HotelVO객체로 반환하는 메서드
	 * 
	 * @param hotel_no 검색할 숙소 번호
	 * @return 숙소의 상세 정보가 담긴 HotelVO객체
	 */
	public HotelVO getHotelInfo(int hotel_no);
	
	/**
	 * 예약이 성공하면 숙소의 객실 수를 차감하는 메서드
	 * 
	 * @param hotel_no 객실 수를 차감할 숙소번호
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int subtractHotelRoom(int hotel_no);
	
	/**
	 * 사용자가 설정한 예약일에 잔여 객실이 존재하는지 확인하는 메서드
	 * 
	 * @param date 사용자가 설정한 예약 시작일과 예약 종료일이 담긴 Map
	 * @return 예약이 있는 객실 수
	 */
	public int getHotelRoom(Map<String, String> date);
	
	/**
	 * 식당 번호로 호텔의 상세 정보를 검색해 RestaurantVO객체로 반환하는 메서드
	 * 
	 * @param rest_no 검색할 식당 번호
	 * @return 식당의 상세 정보가 담긴 RestaurantVO객체
	 */
	public RestaurantVO getRestaurantInfo(int rest_no);
	
	/**
	 * RestaurantReserveVO객체를 받아 식당 예약 테이블에 정보를 저장을 하는 메서드
	 * 
	 * @param restRsvVo 식당 예약 정보가 담긴 RestaurantReserveVO객체
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int reserveRestaurant(RestaurantReserveVO restRsvVo);
}
