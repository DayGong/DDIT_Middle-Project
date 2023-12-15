package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {

	public List<NoticeVO> getAllNotice();
	public NoticeVO getNotice(int no);
	public int deleteNotice(int no);
	public int updateHits(int num);
	public int updateNotice(NoticeVO noticeVO);
	
	
}	//INoticeService 끝
