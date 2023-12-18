package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;

public class BoardServiceImpl implements IBoardService {

	private IBoardDao boardDao;
	private static IBoardService boardService;
	
	public BoardServiceImpl() {
		boardDao = new BoardDaoImpl();
	}
	
	public static IBoardService getInstance() {
		if(boardService==null) {
			boardService = new BoardServiceImpl();
		}
		return boardService;
	}

	@Override
	public List<BoardVO> getAllBoard() {
		return boardDao.getAllBoard();
	}
	
	@Override
	public BoardVO getBoard(int no) {
		return boardDao.getBoard(no);
	}

	@Override
	public int deleteBoard(int no) {
		return boardDao.deleteBoard(no);
	}

	@Override
	public int updateHits(int boardNo) {
		return boardDao.updateHits(boardNo);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		return boardDao.updateBoard(boardVO);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		return boardDao.insertBoard(boardVO);
	}

	


//	@Override
//	public PageVO getPageInfo(int page, String stype, String sword) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("stype", stype);
//		map.put("sword", sword);
//		
//		int count = this.getTotalCount(map);
//		
//		int plist = PageVO.getPerList();
//		int totalPage = (int) Math.ceil((double)count/plist);
//		
//		if(page>totalPage) page = totalPage;
//		
//		int start = (page -1)*plist +1;
//		int end = start + plist -1;
//		
//		if(end>count) {
//			end = count;
//		}
//		
//		int ppage = PageVO.getPerPage();
//		int startPage = ((page-1)/ppage*ppage)*1;
//		int endPage = startPage + ppage - 1;
//		
//		if (endPage > totalPage) {
//			endPage = totalPage;
//		}
//		
//		PageVO pageVo = new PageVO();
//		pageVo.setStart(start);
//		pageVo.setEnd(end);
//		pageVo.setStartPage(startPage);
//		pageVo.setEndPage(endPage);
//		pageVo.setTotalPage(totalPage);
//		
//		return pageVo;
//	}

//	@Override
//	public int getTotalCount(Map<String, Object> map) {
//		return noticeDao.getTotalCount(map);
//	}

//	@Override
//	public List<NoticeVO> selectByPage(Map<String, Object> map) {
//		return noticeDao.getAllNotice();
//	}


}	//NoticeServiceImpl 끝
