package kr.or.ddit.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PageVO;

public class NoticeServiceImpl implements INoticeService {

	private INoticeDao noticeDao;
	private static INoticeService noticeService;
	public NoticeServiceImpl() {
		noticeDao = new NoticeDaoImpl();
	}
	public static INoticeService getInstance() {
		if(noticeService==null) {
			noticeService = new NoticeServiceImpl();
		}
		return noticeService;
	}

	@Override
	public List<NoticeVO> getAllNotice() {
		return noticeDao.getAllNotice();
	}
	
	@Override
	public NoticeVO getNotice(int no) {
		return noticeDao.getNotice(no);
	}

	@Override
	public int deleteNotice(int no) {
		return noticeDao.deleteNotice(no);
	}

	@Override
	public int updateHits(int noticeNo) {
		return noticeDao.updateHits(noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return noticeDao.updateNotice(noticeVO);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		return noticeDao.insertNotice(noticeVO);
	}

}	//NoticeServiceImpl 끝
