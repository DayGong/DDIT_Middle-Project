package kr.or.ddit.vo;

public class TourVO {

	private int tour_no;		// 관광지번호
	private String tour_tp_nm;	// 관광지구분
	private String tour_name;	// 관광지명
	private String tour_addr;	// 관광지주소
	private String tour_tel;	// 관광지연락처
	private String tour_url;	// 관광지URL
	private String tour_img;	// 관광지이미지파일명
	private int tour_x;
	private int tour_y;
	
	public int getTour_x() {
		return tour_x;
	}
	public void setTour_x(int tour_x) {
		this.tour_x = tour_x;
	}
	public int getTour_y() {
		return tour_y;
	}
	public void setTour_y(int tour_y) {
		this.tour_y = tour_y;
	}
	public int getTour_no() {
		return tour_no;
	}
	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}
	public String getTour_tp_nm() {
		return tour_tp_nm;
	}
	public void setTour_tp_nm(String tour_tp_nm) {
		this.tour_tp_nm = tour_tp_nm;
	}
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public String getTour_addr() {
		return tour_addr;
	}
	public void setTour_addr(String tour_addr) {
		this.tour_addr = tour_addr;
	}
	public String getTour_tel() {
		return tour_tel;
	}
	public void setTour_tel(String tour_tel) {
		this.tour_tel = tour_tel;
	}
	public String getTour_url() {
		return tour_url;
	}
	public void setTour_url(String tour_url) {
		this.tour_url = tour_url;
	}
	public String getTour_img() {
		return tour_img;
	}
	public void setTour_img(String tour_img) {
		this.tour_img = tour_img;
	}

}
