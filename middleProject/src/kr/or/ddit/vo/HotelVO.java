package kr.or.ddit.vo;

public class HotelVO {
	private int hotel_no;			// 숙소번호
	private String hotel_name;		// 숙소명
	private String hotel_addr;		// 주소
	private String hotel_tel;		// 전화번호
	private String hotel_time;		// 운영시간
	private String hotel_img;		// 이미지파일명

	public int getHotel_no() {
		return hotel_no;
	}

	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}

	public String getHotel_name() {
		return hotel_name;
	}

	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

	public String getHotel_addr() {
		return hotel_addr;
	}

	public void setHotel_addr(String hotel_addr) {
		this.hotel_addr = hotel_addr;
	}

	public String getHotel_tel() {
		return hotel_tel;
	}

	public void setHotel_tel(String hotel_tel) {
		this.hotel_tel = hotel_tel;
	}

	public String getHotel_time() {
		return hotel_time;
	}

	public void setHotel_time(String hotel_time) {
		this.hotel_time = hotel_time;
	}

	public String getHotel_img() {
		return hotel_img;
	}

	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}

}
