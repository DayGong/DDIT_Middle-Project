package kr.or.ddit.vo;

public class ReserveVO {
	private int rsv_no;		// 예약번호
	private String rsv_date;	// 예약날짜
	private int rsv_count;		// 인원수
	private int rsv_state;		// 취소여부
	private String mem_id; 		// 회원 테이블의 기본키_회원아이디
	private int comp_no; 		// 업체 테이블의 기본키_업체번호

	public int getRsv_no() {
		return rsv_no;
	}

	public void setRsv_no(int rsv_no) {
		this.rsv_no = rsv_no;
	}

	public String getRsv_date() {
		return rsv_date;
	}

	public void setRsv_date(String rsv_date) {
		this.rsv_date = rsv_date;
	}

	public int getRsv_count() {
		return rsv_count;
	}

	public void setRsv_count(int rsv_count) {
		this.rsv_count = rsv_count;
	}

	public int getRsv_state() {
		return rsv_state;
	}

	public void setRsv_state(int rsv_state) {
		this.rsv_state = rsv_state;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getComp_no() {
		return comp_no;
	}

	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}

}
