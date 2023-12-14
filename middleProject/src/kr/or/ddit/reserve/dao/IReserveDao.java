package kr.or.ddit.reserve.dao;

import java.util.List;
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
	
	/**
	 * 사용자가 선택한 날짜에 예약된 시간 정보를 반환하는 메서드
	 * 
	 * @param selectedTime rest_no 식당 번호, selectedDate 사용자가 선택한 날짜
	 * @return 이미 예약된 시간을 List 객체로 반환
	 */
	public List<String> getRestaurantReservedTime(Map<String, String> selectedDate);
	
	/**
	 * 해당 날짜에 해당하는 숙소를 일괄 체크아웃하는 메서드
	 * 
	 * @param 전체를 검색할 때 parameterType에 넣을 임시 값(null 안 됨)
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int doManagerAllCheckout();
	
	/**
	 * mem_id를 가진 사용자가 예약한 숙소 정보를 불러오는 메서드
	 * 
	 * @param mem_id 예약한 정보를 가져올 사용자의 ID
	 * @return 호텔 정보와 예약 정보가 담긴 List 객체
	 */
	public List<Map<String, String>> getMemberHotelReserve(String mem_id);
	
	/**
	 * mem_id를 가진 사용자가 예약한 숙소 중 취소되거나 완료된 숙소 정보를 불러오는 메서드
	 * 
	 * @param mem_id 취소되거나 완료된 숙소 정보를 가져올 사용자의 ID
	 * @return 취소되거나 완료된 숙소 정보가 담긴 List 객체
	 */
	public List<Map<String, String>> getMemberHotelReserveCancel(String mem_id);

	/**
	 * mem_id를 가진 사용자가 예약한  식당 정보를 불러오는 메서드
	 * 
	 * @param mem_id 예약한 정보를 가져올 사용자의 ID
	 * @return 식당 정보와 예약 정보가 담긴 List 객체
	 */
	public List<Map<String, String>> getMemberRestaurantReserve(String mem_id);
	
	/**
	 * mem_id를 가진 사용자가 예약한  식당 중 취소되거나 완료된 식당 정보를 불러오는 메서드
	 * 
	 * @param mem_id 취소되거나 완료된 식당 정보를 가져올 사용자의 ID
	 * @return 취소되거나 완료된 식당 정보가 담긴 List 객체
	 */
	public List<Map<String, String>> getMemberRestaurantReserveCancel(String mem_id);
	
	/**
	 * 숙소 예약 번호를 불러와 예약을 취소하는 메서드
	 * @param hotel_rsv_no 취소할 숙소 예약 번호
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int reserveHotelCancel(String hotel_rsv_no);
	
	/**
	 * 식당 예약 번호를 불러와 예약을 취소하는 메서드
	 * @param hotel_rsv_no 취소할 식당 예약 번호
	 * @return 반환값 성공 시: 1, 실패 시: 0
	 */
	public int reserveRestaurantCancel(int rest_rsv_no);
	
}
