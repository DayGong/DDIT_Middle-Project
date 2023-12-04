package kr.or.ddit.member.dao;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {
	
	/**
	 * MemberVO객체를 받아 회원의 정보를 저장하는 메서드
	 * 
	 * @param memVo 회원의 정보가 있는 MemberVO객체
	 * @return 성공 시 반환값: 1, 실패 시 반환값: 0
	 */
	public int insertMember(MemberVO memVo);
	
	/**
	 * MemberVO객체를 받아 회원의 정보를 수정하는 메서드
	 * 
	 * @param memVo 회원의 정보가 있는 MemberVO객체
	 * @return 성공 시 반환값: 1, 실패 시 반환값: 0
	 */
	public int updateMember(MemberVO memVo);
	
	/**
	 * 회원의 ID를 받아 회원의 탈퇴 여부를 0으로 변경하는 메서드
	 * (0은 탈퇴한 회원, 1은 기존 회원)
	 * 
	 * @param memId 탈퇴 여부를 변경할 회원의 ID
	 * @return 성공 시 반환값: 1, 실패 시 반환값: 0
	 */
	public int deleteMember(String memId);
	
	/**
	 * 회원의 정보를 읽어 MemberVO객체로 반환하는 메서드
	 * 
	 * @param memId 정보를 가져올 회원의 ID
	 * @return 검색한 회원의 MemberVO객체
	 */
	public MemberVO getSelectMember(String memId);
}
