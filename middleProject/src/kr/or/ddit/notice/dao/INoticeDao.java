package kr.or.ddit.notice.dao;

import java.util.List;

import kr.or.ddit.vo.NoticeVO;

public interface INoticeDao {

	public List<NoticeVO> getAllNotice();
	public NoticeVO getNotice(int no);
	public int deleteNotice(int no);
	public int updateHits(int num);
	public int updateNotice(NoticeVO noticeVO);
	
	
}	