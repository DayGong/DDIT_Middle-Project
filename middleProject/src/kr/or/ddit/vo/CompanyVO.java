package kr.or.ddit.vo;

public class CompanyVO {
	private int comp_no;		// 업체번호
	private String comp_name;	// 업체이름
	private String comp_addr;	// 주소
	private String comp_tel;	// 전화번호
	private String comp_time;	// 운영시간
	private int comp_room;		// 잔여 객실 수
	private String comp_img;	// 업체이미지파일명
	private int comp_tp_cd;	// 업체구분코드
	
	public int getComp_no() {
		return comp_no;
	}
	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getComp_addr() {
		return comp_addr;
	}
	public void setComp_addr(String comp_addr) {
		this.comp_addr = comp_addr;
	}
	public String getComp_tel() {
		return comp_tel;
	}
	public void setComp_tel(String comp_tel) {
		this.comp_tel = comp_tel;
	}
	public String getComp_time() {
		return comp_time;
	}
	public void setComp_time(String comp_time) {
		this.comp_time = comp_time;
	}
	public int getComp_room() {
		return comp_room;
	}
	public void setComp_room(int comp_room) {
		this.comp_room = comp_room;
	}
	public String getComp_img() {
		return comp_img;
	}
	public void setComp_img(String comp_img) {
		this.comp_img = comp_img;
	}
	public int getComp_tp_cd() {
		return comp_tp_cd;
	}
	public void setComp_tp_cd(int comp_tp_cd) {
		this.comp_tp_cd = comp_tp_cd;
	}
	
}
