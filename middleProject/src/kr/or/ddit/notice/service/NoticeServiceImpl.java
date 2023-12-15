package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.vo.NoticeVO;

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
	public int updateHits(int num) {
		return noticeDao.updateHits(num);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return noticeDao.updateNotice(noticeVO);
	}


}	//NoticeServiceImpl 끝
